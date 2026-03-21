# Maintainer: Keon Cachia <keonfarrugia@gmail.com>

pkgname=rill-git
_pkgname=rill
pkgdesc="A minimalist scrolling window manager for River"
pkgver=9d992b7
pkgrel=4
arch=('x86_64' 'aarch64')
url="https://codeberg.org/lzj15/rill"
license=('MIT')
depends=('wayland' 'river')
makedepends=('zig' 'wayland-protocols')
install=rill.install
source=(git+$url.git
       	zig-wayland.zip::https://codeberg.org/ifreund/zig-wayland/archive/v0.5.0.zip)
sha256sums=('SKIP'
            '816d6d9fffeb596244e5467b60f5b21575ba779e441a27dcc63ce5f6a5a09841')
noextract=("${source[@]:1}")

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "$(git rev-parse --short=7 HEAD)"
}
prepare(){
  zig fetch --global-cache-dir ./zig-global-cache "./${source[1]%%::*}"
}
build() {
  cd "$srcdir/$_pkgname"
  DESTDIR="build" zig build \
    --summary all \
    --prefix /usr \
    --search-prefix /usr \
    --global-cache-dir ../zig-global-cache \
    --system ../zig-global-cache/p \
    --build-id=sha1 \
    -Dtarget=native-linux.6.6-gnu.2.40 \
    -Dcpu=baseline \
    -Doptimize=ReleaseSafe
}
package() {
  cd "$srcdir/$_pkgname"
  cp -a build/* "$pkgdir"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

# vim:set ts=2 sw=2 et:
