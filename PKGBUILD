# Maintainer:  Wez Furlong <wez at wezfurlong dot org>
# NOTE: if you're looking at this on AUR, this file is generated from
# https://github.com/wez/wezterm/blob/master/ci/PKGBUILD.template
# by automation in the wezterm repo.

pkgname=wezterm-bin
_tag=20200607-142624-9d659486
pkgver=$(echo $_tag | tr - .)
pkgrel=2
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
  'bd892d0ea5116381154f44908319246c7a5ed5a14913efa12195b19a860ab8a0'
  '191c46fcf52061382b1c51a70311eb9081381cc158e5899f3739473a9432185b'
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
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 squashfs-root/usr/share/icons/hicolor/128x128/apps/org.wezfurlong.wezterm.png \
                 "${pkgdir}/usr/share/icons/hicolor/128x128/apps/org.wezfurlong.wezterm.png"
  install -Dm644 squashfs-root/usr/share/applications/org.wezfurlong.wezterm.desktop \
                 "${pkgdir}/usr/share/applications/org.wezfurlong.wezterm.desktop"
  install -dm755 ${pkgdir}/usr/share/wezterm/colors
  install -Dm644 -t ${pkgdir}/usr/share/wezterm/colors/* squashfs-root/usr/share/wezterm/colors/*
}
