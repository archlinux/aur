# Maintainer: slatkin
pkgname=paw
pkgver=1.28.0
pkgrel=1
_tag="${pkgver}-paw.${pkgrel}"
pkgdesc="Wayland terminal emulator, a fork of foot, with the kitty graphics protocol"
arch=('x86_64')
url="https://github.com/slatkin/paw"
license=('MIT')
depends=('fcft' 'fontconfig' 'libpng' 'libutf8proc' 'libxkbcommon' 'ncurses' 'pixman' 'wayland' 'zlib')
makedepends=('meson' 'ninja' 'python' 'scdoc' 'tllist' 'wayland-protocols')
optdepends=('bash-completion: completion for positional arguments'
            'libnotify: desktop notifications'
            'xdg-utils: open URLs')
source=("https://github.com/slatkin/paw/releases/download/v${_tag}/paw-${_tag}.tar.gz")
# aur.yml sets the checksum for each release.
sha256sums=('be8d64f7bfa242365cf79581bd0b04e0413c3c2d1a3d88a471789256636dd9ef')

build() {
  cd "paw-${_tag}"
  meson setup build --prefix=/usr --buildtype=release
  meson compile -C build
}

package() {
  cd "paw-${_tag}"
  DESTDIR="${pkgdir}" meson install -C build --no-rebuild
  # ncurses already ships the foot and foot-direct terminfo entries.
  rm -r "${pkgdir}/usr/share/terminfo/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
