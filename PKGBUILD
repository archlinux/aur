# Maintainer:  <keonfarrugia@gmail.com>
pkgname=rill
pkgver=0.4.0
pkgrel=1
epoch=
pkgdesc="A minimalist scrolling window manager for River"
arch=('x86_64')
url="https://codeberg.org/lzj15/rill"
license=('MIT')
depends=('wayland' 'river')
makedepends=('wayland-protocols' 'zig')
install=rill.install
source=(https://codeberg.org/lzj15/rill/archive/v"$pkgver".tar.gz
	zig-wayland.zip::https://codeberg.org/ifreund/zig-wayland/archive/v0.5.0.zip)
sha256sums=('56ff76abb108943eb4da06bcdd31be2f1628eb2ad3896a616558958ab67be31e'
            '816d6d9fffeb596244e5467b60f5b21575ba779e441a27dcc63ce5f6a5a09841')
noextract=("${source[@]:1}")

prepare() {
  zig fetch --global-cache-dir ./zig-global-cache "./${source[1]%%::*}"
}

build() {
  cd "$srcdir/$pkgname"
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
  cd "$srcdir/$pkgname"

  cp -a build/* "$pkgdir"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

# vim:set ts=2 sw=2 et:
