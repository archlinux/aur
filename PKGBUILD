# Maintainer: Lucas <lucaszhou007 at 163 dot com>
#
# amdgpu-fan-ctl-bmc —— 用 rocm-smi 读到的 AMD GPU 温度，通过 BMC（带外管理）
# 控制机箱风扇。
#
# 为什么名字里有 bmc：这个程序不驱动显卡自己的风扇（AMD Instinct 这类被动散热
# 卡根本没有自带风扇），而是去调**主板 BMC 管的机箱风扇**——温度从 rocm-smi 来，
# 转速指令发给 BMC。当前实现的 BMC 后端是 H3C HDM。
#
# ── 关于 source ────────────────────────────────────────────────────────────
# 本 PKGBUILD 用「本地源」：amdgpu_fan_ctl_bmc.py 等文件就放在本目录里（也一起提交进
# AUR git 仓库），所以 `makepkg` 完全不需要联网，`makepkg -si` 直接可用。
#
# 如果哪天把项目托管到了 GitHub/GitLab，建议换成更符合 AUR 习惯的远程源，
# 并把 url= 改成项目主页（改完记得重新生成 .SRCINFO 和校验和）：
#
#     url='https://github.com/<你的用户名>/amdgpu-fan-ctl-bmc'
#     source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
#     sha256sums=('...')
#
# ───────────────────────────────────────────────────────────────────────────
# 打包目录里各文件的来源（同步脚本见同目录 sync.sh）：
#   amdgpu_fan_ctl_bmc.py / config.toml / README.md / USAGE.md / test_amdgpu_fan_ctl_bmc.py
#       ← 从 ../amdgpu-fan-ctl-bmc/ 原样拷贝
#   amdgpu-fan-ctl-bmc.service   ← 打包专用版（路径改成 /usr/bin 和 /usr/lib/systemd）
#   amdgpu-fan-ctl-bmc.sysusers  ← 服务专用系统账户的定义，装成
#       /usr/lib/sysusers.d/amdgpu-fan-ctl-bmc.conf，pacman 安装/升级时由
#       systemd-sysusers 自动创建用户（以及同名组）
#   hdm.env.example / amdgpu-fan-ctl-bmc.install     ← 只为打包而写
#   LICENSE-MIT                                 ← 程序本体的 MIT 文本，
#       会装成 /usr/share/licenses/amdgpu-fan-ctl-bmc/LICENSE
#   LICENSE + LICENSES/ + REUSE.toml            ← 打包文件本身的许可声明：
#       按 RFC 0040 / RFC 0052，AUR 仓库里的 PKGBUILD 及辅助文件用 0BSD
#       （程序本体仍是 MIT，两者互不影响）

pkgname=amdgpu-fan-ctl-bmc
pkgver=0.1.0
pkgrel=1
pkgdesc='用 rocm-smi 读 AMD GPU 温度，通过 BMC（H3C HDM）控制机箱风扇'
arch=('any')
url='https://aur.archlinux.org/packages/amdgpu-fan-ctl-bmc'
license=('MIT')
depends=('python')
optdepends=(
  'rocm-smi-lib: 提供 rocm-smi，读取 AMD GPU 温度（本机没有 AMD 卡、靠 --remote 读远程时不需要）'
  'openssh: 用 --remote user@host 在另一台装了 GPU 的机器上跑 rocm-smi'
)
backup=('etc/amdgpu-fan-ctl-bmc/config.toml')
install=amdgpu-fan-ctl-bmc.install

# 命令名 / unit / 配置目录 / 状态目录全部与包名同名。
# 下划线前缀是 PKGBUILD 里放私有变量的惯例写法。
_prog=amdgpu-fan-ctl-bmc
source=(
  'amdgpu_fan_ctl_bmc.py'
  'config.toml'
  'amdgpu-fan-ctl-bmc.service'
  'amdgpu-fan-ctl-bmc.sysusers'
  'README.md'
  'USAGE.md'
  'hdm.env.example'
  'LICENSE-MIT'
)
sha256sums=('e90347bb7ac34bd8cf7422468002b2b4f171f61d64ba1ad9ecc5b08a6a692384'
            '56f6b3efbb688d349aacec5bed22b83eeeb6d029c8ce6ae8cbd862670b86b2b8'
            'fb5a02407a44146e8514c3b3b26e62c29a961c491b0828fcfe9cd2da2020b11e'
            '9b69358deee4a31b7892745bc9b3127d91c1562f1e4f9f531deabd4edcd177cc'
            '20eefcde38af0a3c13d01668201d3235f1d2e2d5a0d804f71adee1abbafc00b3'
            '794310825931f5477d71e18f753174799ddcd1c53b29272f7e8ba2c9e92d887e'
            '73159af2ba711a86db112e2ea135949f9ea64be8f63d9cbbc5ba12db92ebc1aa'
            '01a98a1cd74349bd5833cb19088a03dc386ad57002c1364435befe05c4348272')

package() {
  # 程序本体放 /usr/lib/$_prog/，再给 /usr/bin 一个符号链接。
  install -Dm755 "$srcdir/amdgpu_fan_ctl_bmc.py" "$pkgdir/usr/lib/$_prog/amdgpu_fan_ctl_bmc.py"
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$_prog/amdgpu_fan_ctl_bmc.py" "$pkgdir/usr/bin/$_prog"

  # unit / 配置目录都与包名同名（$_prog == $pkgname）
  install -Dm644 "$srcdir/amdgpu-fan-ctl-bmc.service" \
    "$pkgdir/usr/lib/systemd/system/$_prog.service"

  # 服务专用系统账户：pacman 安装/升级时由 systemd-sysusers 处理本文件，
  # 自动创建 amdgpu-fan-ctl-bmc 用户和同名组（unit 里的 User=/Group= 用它）
  install -Dm644 "$srcdir/amdgpu-fan-ctl-bmc.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/$_prog.conf"

  # 出厂配置 = 只读不写（mode=observe, dry_run=true），改了会被 pacman 当 .pacnew 保留
  install -Dm644 "$srcdir/config.toml" "$pkgdir/etc/$_prog/config.toml"

  install -Dm644 "$srcdir/README.md"  "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/USAGE.md"   "$pkgdir/usr/share/doc/$pkgname/USAGE.md"
  # 单元测试只在 check() 里跑，不装进系统（装了之后 namcap 会满屏
  # "Referenced python module 'amdgpu_fan_ctl_bmc.X' is an uninstalled dependency"，
  # 因为测试从 /usr/share/doc 里 import 不到 /usr/lib/amdgpu-fan-ctl-bmc 下的模块）
  install -Dm644 "$srcdir/hdm.env.example" \
    "$pkgdir/usr/share/doc/$pkgname/hdm.env.example"

  install -Dm644 "$srcdir/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}



# ── 维护者常用命令（不会被 makepkg 执行，纯备忘） ─────────────────────────
#
# 1) 本地构建与测试
#   makepkg -f                 # 强制重新打包（会跑 check() 里的 61 个单元测试）
#   makepkg -si                # 打包并自动装依赖、安装到本机
#   makepkg -C                 # 只清理 pkg/ src/ 构建目录
#   python -m unittest test_amdgpu_fan_ctl_bmc   # 不打包，单独跑测试
#
# 2) 改了 source 里任何文件之后（本仓库是本地源，哈希要手动刷新）
#   updpkgsums                 # 重新计算 sha256sums 并就地更新本文件
#   makepkg --printsrcinfo > .SRCINFO   # 每次改 PKGBUILD 元数据后必须重新生成
#
# 3) 提交前自检（需要 pacman -S namcap）
#   namcap PKGBUILD            # 查 PKGBUILD 本身的问题
#   namcap amdgpu-fan-ctl-bmc-*.pkg.tar.zst   # 查打出的包（多余依赖/缺失权限等）
#
# 4) 发布 / 更新到 AUR（AUR 仓库只放打包文件，不放 pkg/ src/ *.pkg.tar.zst）
#   git clone ssh://aur@aur.archlinux.org/amdgpu-fan-ctl-bmc.git
#   # 或在已有克隆里：git pull
#   cp PKGBUILD .SRCINFO amdgpu-fan-ctl-bmc.install amdgpu-fan-ctl-bmc.service \
#      amdgpu-fan-ctl-bmc.sysusers \
#      amdgpu_fan_ctl_bmc.py test_amdgpu_fan_ctl_bmc.py config.toml \
#      README.md USAGE.md hdm.env.example LICENSE LICENSE-MIT REUSE.toml \
#      amdgpu-fan-ctl-bmc/
#   cd amdgpu-fan-ctl-bmc
#   git add PKGBUILD .SRCINFO
#   git commit -m "Update to $pkgver-$pkgrel"
#   git push                   # 只能推到 master 分支
#
# 一次完整的发版流程：
#   updpkgsums && makepkg -f && makepkg --printsrcinfo > .SRCINFO \
#     && namcap PKGBUILD amdgpu-fan-ctl-bmc-*.pkg.tar.zst
