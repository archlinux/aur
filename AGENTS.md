# AGENTS.md

## 仓库定位

本仓库将上游 GUI.for.SingBox 二进制打包为 Arch Linux 的 AUR 软件包
`gui-for-singbox-bin`。

维护范围仅限打包层。不要在此处修改或重建上游应用源码。上游项目如下：

- 仓库：https://github.com/GUI-for-Cores/GUI.for.SingBox
- 发布页：https://github.com/GUI-for-Cores/GUI.for.SingBox/releases
- 软件包页：https://aur.archlinux.org/packages/gui-for-singbox-bin

## 文件说明

- `PKGBUILD`：软件包元数据、上游二进制 URL、依赖和安装布局。
- `.SRCINFO`：生成的 AUR 元数据。修改 `PKGBUILD` 后需要重新生成。
- `update.sh`：检查最新 GitHub release，更新二进制校验和，重置
  `pkgrel`，并重新生成 `.SRCINFO`。
- `gui-for-singbox.install`：创建运行时数据目录，链接 `sing-box` 可执行
  文件，并在安装或升级本包时设置所需 capability。
- `gui-for-singbox-setcap.hook`：在 `sing-box` 核心二进制安装或升级后恢复
  capability。
- `gui-for-singbox.rules`：允许桌面用户为 TUN 配置 systemd-resolved。
- `gui-for-singbox.desktop`：桌面条目，以及已安装二进制和图标的路径。
- `pkg/`、`src/`、`*.pkg.tar.zst` 和下载的上游资源都是被忽略的构建产物，
  不要将它们提交到仓库。

## 软件包版本模型

软件包有两个相互独立的版本号：

- `pkgver` 跟随上游 GitHub release tag，但不包含开头的 `v`。
- `pkgrel` 表示同一上游版本下的打包层变更次数。

上游版本变化时，将 `pkgrel` 重置为 `1`。只有软件包元数据或集成方式变化
时，保留 `pkgver` 并递增 `pkgrel`。

当前软件包将 x86_64 Linux 二进制安装到
`/opt/gui-for-singbox/GUI.for.SingBox`，图标安装在同一前缀目录下。
依赖包括 `glibc`、`sing-box-bin` 和 `webkit2gtk-4.1`。上游 ZIP 由 makepkg
使用 bsdtar 自动解压，不需要额外的 `unzip` 构建依赖。

## 更新上游版本

需要更新软件包时：

1. 在仓库根目录运行 `./update.sh`。
2. 检查 `PKGBUILD` 和 `.SRCINFO` 的完整 diff。
3. 确认 release 中包含
   `GUI.for.SingBox-linux-amd64.zip`，并确认校验和对应的正是该资源。
4. 检查新的二进制是否仍然匹配现有安装布局和运行时依赖。
5. 在提交前，使用可用的 Arch 打包工具构建或校验软件包。

上游发布流程是自动化的，release 通常没有有用的 changelog。不要自行编造
发布说明。如果需要总结功能变化，应对比旧 tag 和新 tag，并区分已确认的
变化与推测。只要资源和集成方式仍然兼容，就应直接打包新的上游版本。

常用命令：

```bash
./update.sh
git diff -- PKGBUILD .SRCINFO
makepkg --verifysource
makepkg -f
```

`update.sh` 使用 GitHub Releases API，需要 `curl`、`jq`、`updpkgsums` 和
`makepkg`。

## 现有集成细节

阅读或修改软件包时，注意以下现有行为：

- 安装脚本只创建 `/opt/gui-for-singbox/data`、`data/sing-box` 和 sing-box
  链接，其余运行时目录和文件由 GUI 按需创建。
- 安装脚本将 `/usr/bin/sing-box` 链接到应用数据目录，并为核心设置
  `cap_net_admin`、`cap_net_raw` 和 `cap_net_bind_service`。alpm hook 监听
  `usr/bin/sing-box` 的安装和升级，在核心二进制被替换后自动恢复 capability；
  GUI 启动时不再通过 `pkexec` 请求权限。
- `sing-box` 软件包的 resolve1 规则只覆盖系统服务用户 `sing-box`。GUI 以桌面
  用户启动核心，因此额外规则允许本机活动会话用户设置和恢复 TUN 接口的
  DNS、域及默认 DNS 路由。
- `data` 和 `data/sing-box` 以 `777` 权限创建，GUI 后续创建的内容保留运行
  用户的所有权和默认权限。升级不会迁移已有数据的权限。

这些是现有的打包决策。只有在它们影响更新兼容性时才记录相关问题，不要在
常规上游版本更新中擅自改变它们。

## 上游版本快照

截至 2026-08-03，最新上游 release 是 `v1.26.1`，发布时间为 2026-07-21。
其 release body 只有 GitHub Actions 自动生成的说明。与当前打包的
`v1.25.4` 对比后，可以确认或高度确定以下变化：

- Windows 命令输出现在会根据系统 OEM code page 处理，改善非 UTF-8 输出
  的兼容性。
- 入站配置新增 `direct` 类型支持。
- 定时任务日志可以返回并显示。
- 对话框支持最小化。
- 代码编辑器和代码查看器拆分为独立组件，同时调整 Markdown 流式更新。
- 调整前端布局、对话框滚动、间距和样式 hooks。
- 修复 Rolldown 执行顺序问题。

此次对比包含 13 个 commit、约 100 个变更文件。仅凭自动生成的 release
元数据无法确定部分界面变化和性能影响。以下内容应作为排查线索，而不是
未经核实的正式发布说明：

- Release：https://github.com/GUI-for-Cores/GUI.for.SingBox/releases/tag/v1.26.1
- Compare：https://github.com/GUI-for-Cores/GUI.for.SingBox/compare/v1.25.4...v1.26.1
- Compare API：https://api.github.com/repos/GUI-for-Cores/GUI.for.SingBox/compare/v1.25.4...v1.26.1

## 提交规范

提交前检查 `git status`、`git diff` 和近期提交记录。只提交属于本次变更
的软件包源文件和生成的元数据。不要提交下载的二进制文件或构建目录。
