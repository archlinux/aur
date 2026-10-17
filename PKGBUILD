# Maintainer: Osilvfe <osilvfe@gmail.com>

pkgname=yaqmc-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Unofficial QQ Music client (official Electron binary release)'
arch=('x86_64' 'aarch64')
url='https://github.com/YAQMC/YAQMC'
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libnotify'
  'libsecret'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'xdg-utils'
)
optdepends=('libayatana-appindicator: system tray support')
provides=('yaqmc')
conflicts=('yaqmc' 'yaqmc-git')
options=('!strip' '!debug')
source=("LICENSE::https://raw.githubusercontent.com/YAQMC/YAQMC/v${pkgver}/LICENSE")
source_x86_64=("YAQMC-linux-x64.deb::https://github.com/YAQMC/YAQMC/releases/download/v${pkgver}/YAQMC-linux-x64.deb")
source_aarch64=("YAQMC-linux-arm64.deb::https://github.com/YAQMC/YAQMC/releases/download/v${pkgver}/YAQMC-linux-arm64.deb")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('9fef3753d42070c0e4ff83edc360fb5ee6933231233c9bb43b16d5e82ac190b4')
sha256sums_aarch64=('12408a9f00a35e64e4bb16f9f887f0f4ceff5149aa5469ad780ace0298690a39')

prepare() {
  local _asset_arch
  case "$CARCH" in
    x86_64) _asset_arch=x64 ;;
    aarch64) _asset_arch=arm64 ;;
    *) exit 1 ;;
  esac

  install -d "${srcdir}/deb" "${srcdir}/pkg"
  bsdtar -xf "${srcdir}/YAQMC-linux-${_asset_arch}.deb" -C "${srcdir}/deb"
  bsdtar -xf "${srcdir}/deb/data.tar.xz" -C "${srcdir}/pkg"
}

package() {
  install -d "${pkgdir}/opt/yaqmc"
  cp -a "${srcdir}/pkg/opt/YAQMC/." "${pkgdir}/opt/yaqmc/"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/yaqmc/yaqmc "${pkgdir}/usr/bin/yaqmc"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "${srcdir}/pkg/usr/share/applications/org.yaqmc.desktop" \
    "${pkgdir}/usr/share/applications/org.yaqmc.desktop"
  sed -i 's|^Exec=.*|Exec=/opt/yaqmc/yaqmc %U|' \
    "${pkgdir}/usr/share/applications/org.yaqmc.desktop"

  install -d "${pkgdir}/usr/share/icons"
  cp -a "${srcdir}/pkg/usr/share/icons/hicolor/." "${pkgdir}/usr/share/icons/hicolor/"

  # Arch enables unprivileged user namespaces by default. Do not ship a setuid
  # chrome-sandbox; linux-hardened users should enable that kernel feature.
  chmod 0755 "${pkgdir}/opt/yaqmc/chrome-sandbox"
}
