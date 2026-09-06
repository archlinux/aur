# systemd 沙箱迁移排障记录(2026-09-06)

bwrap 方案迁移到 systemd 原生沙箱(`PrivatePIDs` + 构造式路径视图 + 能力收敛)
过程中实际踩到的问题全记录。[troubleshooting.md](troubleshooting.md) 是对号
入座的排障索引,本文保留完整的定位过程、判据与方法,供下次排障复用。

## 0. 迁移架构速览

全部加固落在 `leigod.service`,由 systemd 在 exec 前完成:

- `PrivatePIDs=yes`:私有 pid 命名空间(隐含 `MountAPIVFS=yes`)
- `PrivateDevices=yes` + `DevicePolicy=closed` + `DeviceAllow=/dev/net/tun rw`
  + `BindPaths=/dev/net/tun`(三件套缺一不可,见 §4)
- `TemporaryFileSystem=` 每路径一条,敏感目录全部换空 tmpfs,再按白名单 bind 回
- `CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_RAW`
- 网络命名空间共享(插件按设计修改宿主路由/iptables/ipset)

## 1. 服务启动即 226/NAMESPACE:`/etc: Invalid argument`

- **症状**:`ExecStartPre` 以 `226/NAMESPACE` 退出,journal 报
  `Failed to set up mount namespacing: /etc: Invalid argument`,重启循环。
- **定位**:`systemd-run --wait --pipe -p <属性> /bin/true` 逐属性二分三轮:
  单条 `TemporaryFileSystem=/etc` 正常;`/etc:/var` 两路径即失败;拆成多条
  属性、每行一个路径则完全正常 —— 与路径内容无关。
- **根因**:systemd 261 回归。**单条 `TemporaryFileSystem=` 写多个冒号分隔
  路径时 tmpfs 挂载触发内核 EINVAL**。一行复现器:
  ```sh
  systemd-run --wait -p 'TemporaryFileSystem=/etc:/var' /bin/true
  ```
- **修复**:单元中每个路径单独一条 `TemporaryFileSystem=`(追加语义,效果
  等价,新旧版本均兼容)。

## 2. pacman 安装报"命令未能被正确执行"

- **症状**:包安装成功但 pacman 报错,服务未按预期重启。
- **根因**:`post_upgrade` 里 `is-active --quiet && systemctl restart` ——
  服务非 active 时 `&&` 链整体退出码 1,pacman 将安装脚本视为失败。
- **修复**:改 `if systemctl is-active --quiet leigod; then ... fi`。
  通用规则:安装脚本里的条件动作必须保证"条件不满足"时整段以 0 退出。

## 3. App 提示"路由器插件已离线"

- **表象**:与 bwrap 时代 web 崩溃(issue #5 类)相似,极易误导为网络问题。
- **实况**:strace 全程无失败系统调用,LAN 发现/web API/云端 HTTPS 全通;
  `web_api.log` 的 `Board info ... token:` 为空,App 拿到空 token 占位符
  (`d41d8c…` = MD5("")),云端校验失败判离线。
- **根因**:绑定 token 在迁移之前(bwrap 时代的卸载/重装实验)就已丢失。
  判据:两次装包输出均无"已恢复加速绑定状态"。
- **附带认知修正**:token 落盘发生在**加速 start/stop 生命周期事件**,而非
  web 进程的周期性配置 flush —— 首次绑定后需完整跑一次加速,`[device]` 才
  会写入 token;只绑定不加速就重启,绑定不落盘。

## 4. 加速失败:`create tun rules failed`

- **症状**:App 下发加速,acc 进程 1 秒内自杀,`acc_PC.log` 报
  `SteamDeckAccCore::start:55 create tun rules failed`,无 `tun_PC`。
- **前置排除**:daemon 启动时 `destroy_steamdeck_tun_rules ... successful`
  证明 iptables/ipset 在沙箱内可执行 —— 先排除规则工具,再查设备节点。
- **定位**:`nsenter -t <daemon_pid> -m -- ls /dev/net/` → **私有 `/dev`
  连 `net/` 目录都没有**;`DeviceAllow=` 只管理 cgroup 白名单,不创建节点。
- **修复**:`PrivateDevices=yes` + `DeviceAllow=/dev/net/tun rw` +
  `BindPaths=/dev/net/tun` 三件套。验证方式:
  ```sh
  systemd-run --wait --pipe -p PrivateDevices=yes -p DevicePolicy=closed \
    -p 'DeviceAllow=/dev/net/tun rw' -p 'BindPaths=/dev/net/tun' \
    -p CapabilityBoundingSet=CAP_NET_ADMIN -p BindReadOnlyPaths=/usr \
    -- sh -c 'ip tuntap add dev t mode tun && ip tuntap del dev t mode tun && echo OK'
  ```

## 5. 服务重启死循环:run.sh exit 1 且 journal 零输出

- **症状**:重启后 `Restart=always` 无限循环,`ExecStart` status=1,journal
  无任何应用层报错。
- **定位**:journal 无输出说明退出发生在 `exec` 之后的官方 monitor 脚本内
  (它把报错写日志文件,不进 journal)。查宿主 `/run/acc_daemon.lock`:内容
  恰为 2 字节 `"1\n"`。
- **根因**:三个条件叠加 —— ① monitor 是 ns pid 1,`echo $$` 写锁得到的
  是 "1";② 单元曾把宿主 `/run` bind 到 `/var/run`,锁跨重启持久残留;
  ③ 新 monitor `kill -0 1` 恒命中自身 → "already running (PID: 1)" 退出,
  且"陈旧锁清理"只在 `kill -0` 失败时执行,死循环永不自愈。
- **修复**:去掉 `/run` 的 bind —— 锁文件落进沙箱私有 tmpfs,随沙箱销毁
  自动清理;`ExecStartPre=/usr/bin/mkdir -p /var/run` 保证目录存在。
  副作用为正:宿主 `/run`(systemd/会话 socket 聚集地)从沙箱 rw 暴露面
  中移除。
- **通用教训**:pid 命名空间内,一切写入持久存储的 PID 记录(锁文件、pid
  文件)都会失效或误判;pid 文件类状态必须随命名空间生命周期存亡。

## 6. 停服等待 90s

- **根因**:内核对 pid 命名空间 init 的规则 —— 未安装 handler 的信号不投递,
  monitor 收不到 SIGTERM;systemd 等 `TimeoutStopSec`(默认 90s)超时后
  SIGKILL。
- **修复**:`TimeoutStopSec=5` 兜底 + 构建期启用官方 monitor 的 TERM trap
  (官方源码中被注释的一行,在 `prepare()` 以 sed 启用)。不照抄官方原行:
  去掉 `EXIT` 伪条件避免 TERM→exit→EXIT 双重触发、`exit` 显式为 0、变量改
  为触发时展开。启用后 monitor 可即时响应 TERM,停服接近瞬时;`TimeoutStopSec`
  仅在 trap 补丁失效时兜底。

## 方法论备忘

- **`systemd-run --wait --pipe -p KEY=VAL cmd`**:最小复现单元属性。命名空间
  阶段的失败与其他属性无关,逐属性叠加二分即可;多轮(粗分 → 两两组合 →
  减员)可定位交互型问题。
- **`nsenter -t <pid> -m -- cmd`**:以目标进程的挂载命名空间视角检查沙箱
  内实际视图(`/dev`、`/proc/1/root` 等)。
- **strace**:`strace -f -e trace=%file,socket,connect -p <pid,pid>` 抓
  "想做什么/哪一步失败"。教训:加 `-tt` 时间戳,否则只能靠事件顺序对齐
  日志。判"沙箱问题"还是"程序行为"的第一问:**有没有失败的系统调用** ——
  全部成功却什么都没发生,就是程序自身逻辑,别在沙箱上找。
- **10001 调试台**:`( exec 3<>/dev/tcp/127.0.0.1/10001; printf
  'set_log_level debug\n' >&3 )` 即可切 debug 级别,无需 nc。注意 bash 的
  `exec 3<>/dev/tcp/...` 连接失败会**退出整个非交互脚本**,须放在子壳里。
- **journal 静默 ≠ 无输出**:程序可能把报错写自己的日志文件
  (`/opt/leigod/log/`)而非 stderr。

## 非问题存档(排障中排除的疑点)

- **monitor 每 5 秒空名字启动失败**:官方脚本 `PROCESS_DATA` 结束引号行的
  缩进空格绕过 `-z` 空行判断,`xargs` 后为空。bwrap 时代日志中即有 1491 次,
  无害噪音,未修。
- **acc_upgrade_monitor "缺失"**:pgrep 模式(`acc-gw|sslh|steamdeck_acc`)
  没覆盖 `acc_upgrade_monitor` 这个名字,进程实际一直在跑。
- **云端 TURN 不在线**(troubleshooting.md #4):不阻塞同 LAN 使用加速。
- **web 进程实际监听 `0.0.0.0:5589`**(README 架构图写 `127.0.0.1`):
  LAN 可直达 5589 绕过 sslh 门前过滤,属既有暴露面,与本迁移无关;后续可用
  防火墙规则限制 5589 仅接受 lo,收紧为"仅 sslh 可达"。
- **Landlock 警告 `/etc/ld.so.cache`**:白名单遗漏,已补 bind,无害。

## 8. 视图审计补遗:遮蔽式 ≠ 构造式,改为根整体遮蔽

审计发现顶层宿主目录 `/efi`(vfat ESP 独立挂载)与 `/windows`(双启动
挂载点)漏在视图内。原因:此前实现是"逐路径 tmpfs 遮蔽 + bind 放回"——
命名空间仍克隆宿主根挂载,**未列入遮蔽清单的顶层目录全部可见**;严格说这是
黑名单遮蔽,不是构造式白名单(bwrap 从空根开始构造才是)。逐路径枚举也无法
穷尽各机器的 `/data`、`/storage` 等自定义挂载点。

**修复(通用)**:`TemporaryFileSystem=/` 根整体遮蔽,视图只剩 bind 白名单,
与宿主顶层布局无关。两个非显然的连带约束:

- **/bin /lib /lib64 /sbin 必须 bind**:根遮蔽后这四个 usr-merged 符号链接
  不存在,而脚本 shebang(`/bin/sh`、`/bin/bash`)与 ELF 解释器
  (`/lib64/ld-linux-x86-64.so.2`)按绝对路径访问,缺了 exec 直接失败;
  bind 源经符号链接解析到 /usr 子目录,以目录形式落回,功能等价。
- **/var/run 由 ExecStartPre 创建**:根 tmpfs 内本无 /var,`mkdir -p`
  在挂载完成后执行,锁文件照旧落在私有 tmpfs。

审定后的可读面:`/usr` 完整只读(执行依赖);`/etc` 白名单 12 项;`/home`
仅 `deck/leigod`;`/dev` 仅固定节点集 + tun;`/proc` 仅沙箱进程;`/sys`
宿主 sysfs 视图(sysfs 本身只读,`class/net` 的接口名/MAC 是插件功能所需);
可读敏感信息收敛为 `machine-id`、网卡清单、`/proc/net` 连接表、`/usr` 包
清单。不可读:`/etc/shadow`、`/etc/ssh`、宿主进程、块设备、其他用户的
0600 文件(无 `DAC_OVERRIDE`)。
