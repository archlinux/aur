# Maintainer:  Wez Furlong <wez at wezfurlong dot org>
# NOTE: if you're looking at this on AUR, this file is generated from
# https://github.com/wez/wezterm/blob/master/ci/PKGBUILD.template
# by automation in the wezterm repo.

pkgname=wezterm-bin
_tag=20201101-103216-403d002d
pkgver=$(echo $_tag | tr - .)
pkgrel=3
pkgdesc='A GPU-accelerated cross-platform terminal emulator and multiplexer implemented in Rust'
arch=('i686' 'x86_64')
url='https://wezfurlong.org/wezterm'
license=('MIT')
provides=('wezterm')
# Don't strip: it will break the binary and it only saves ~10% anyway
options=('!strip')
makedepends=('fuse')
depends=(
  'dbus'
  'fontconfig'
  'hicolor-icon-theme'
  'libx11'
  'libxkbcommon-x11'
  'wayland'
  'xcb-util-keysyms'
  'xcb-util-wm'
)
source=(
  "wezterm::https://github.com/wez/wezterm/releases/download/${_tag}/WezTerm-${_tag}-Ubuntu16.04.AppImage"
  'LICENSE::https://github.com/wez/wezterm/raw/master/LICENSE.md'
)
sha256sums=(
  'e99630c0fba8c4737af700e91e4f369d1b161dd064c66a7339a20dd08909187e'
  'ad915d9508677a4e94e4b3c0a045fedd20e953d95d7cd3ec97e6d16840fa0ed5'
)

prepare() {
  chmod +x "${srcdir}/wezterm"
}

pkgver() {
  "${srcdir}/wezterm" --version | cut -d' ' -f2 | tr - .
}

build() {
  "${srcdir}/wezterm" --appimage-extract >/dev/null
}

package() {
  install -Dm755 squashfs-root/usr/bin/wezterm -t "${pkgdir}/usr/bin/"
  install -Dm755 squashfs-root/usr/bin/wezterm-gui -t "${pkgdir}/usr/bin/"
  install -Dm755 squashfs-root/usr/bin/wezterm-mux-server -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 squashfs-root/usr/share/icons/hicolor/128x128/apps/org.wezfurlong.wezterm.png \
                 "${pkgdir}/usr/share/icons/hicolor/128x128/apps/org.wezfurlong.wezterm.png"
  install -Dm644 squashfs-root/usr/share/applications/org.wezfurlong.wezterm.desktop \
                 "${pkgdir}/usr/share/applications/org.wezfurlong.wezterm.desktop"
}
