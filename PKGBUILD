# Maintainer: Your Name <you@example.com>
# Upstream: https://gitlab.com/evlaV/jupiter-hw-support
#
# Repackage of Valve's SteamOS jupiter-hw-support tree as maintained by evlaV.
# 注意：与 SteamOS 官方仓库（steamdeck-packages.steamos.cloud）的同名包同名，
# 不要同时启用该官方仓库，否则升级时会被来回替换。

pkgname=jupiter-hw-support
_pkgver=20250728.1
_srctag=jupiter-${_pkgver}
pkgver=${_pkgver}
pkgrel=3
pkgdesc="Steam Deck (Jupiter) hardware support: scripts, udev rules, polkit, services, BIOS/controller firmware"
arch=('x86_64')
url="https://gitlab.com/evlaV/jupiter-hw-support"
license=('LicenseRef-jupiter-hw-support')

depends=(
  'bash'
  'systemd'
  'polkit'
  'dmidecode'
  'efibootmgr'
  'util-linux'
  'python'
  'python-click'
  'python-crcmod'
  'python-hid'
  'python-progressbar'
)

optdepends=(
  'plymouth: 启用 SteamOS 主题的开机动画（usr/share/plymouth/themes/steamos）'
  'grub: 仅当你手动让 /etc/default/grub-steamos 生效时才需要'
  'libusb: hidapi 的 libusb 后端（默认 hidraw 后端通常已够用）'
  'jupiter-fan-control: 让 polkit 助手 jupiter-fan-control 真正能启停风扇曲线服务'
)

makedepends=('git' 'rsync')

# 上游含已经预编译好的 ELF（thumbstick_cal、h2offt 等），
# strip 它们可能破坏厂商工具，禁止 makepkg 默认的 strip/lto 等动作。
options=('!strip' '!lto' '!debug')

backup=(
  'etc/default/grub-steamos'
)

source=("git+https://gitlab.com/evlaV/jupiter-hw-support.git#tag=${_srctag}")
sha512sums=('SKIP')

package() {
  cd "$srcdir/jupiter-hw-support"

  # 上游仓库已按 FHS 平铺为 etc/ 与 usr/，直接同步进 $pkgdir
  rsync -a \
    --exclude '.git*' \
    --exclude '.editorconfig' \
    etc usr "$pkgdir/"

  # ────────────────────────────────────────────────────────────────
  # 与 alsa-utils 冲突的文件：剔除掉，避免 pacman 安装时报 file conflict。
  # 如果你确实想让 SteamOS 版本覆盖 alsa-utils 的 alsa-restore.service，
  # 删除下面三行并在文件顶部加 conflicts=('alsa-utils')。
  # ────────────────────────────────────────────────────────────────
  rm -f "$pkgdir/etc/systemd/system/alsa-restore.service"
  rmdir --ignore-fail-on-non-empty \
    "$pkgdir/etc/systemd/system" \
    "$pkgdir/etc/systemd" 2>/dev/null || true

  # 若上游开始随仓库分发 LICENSE 文件，则直接安装；否则放一份指向源的占位说明。
  if [[ -f LICENSE ]]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  else
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    cat > "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt" <<EOF
This package redistributes files from:
    ${url}
    tag: ${_srctag}

Upstream does not currently ship a LICENSE file in this tree. Files originate
from Valve's SteamOS / jupiter-hw-support and are repackaged here as-is for
use on non-SteamOS Arch Linux installations. For licensing of individual
components (BIOS images, controller firmware, vendor binaries such as h2offt /
rfp-cli), refer to upstream and the respective vendors.
EOF
  fi
}
