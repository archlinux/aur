# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>

pkgname=libubox
pkgver=20170617
pkgrel=1
pkgdesc="C utility functions for OpenWrt"
arch=('x86_64' 'i686')
url="https://wiki.openwrt.org/doc/techref/libubox"
license=('BSD')
depends=('json-c')
makedepends=('git' 'cmake' 'lua51')
optdepends=('lua51')
source=("git+https://git.lede-project.org/project/libubox.git#commit=fd57eea9f37e447814afbf934db626288aac23c4"
        "lua.patch")
sha256sums=('SKIP'
            'b0b945fc453a7ec936245088659827feb8950d1823fcf99404b5ac15d9e8f351')

pkgver() {
  cd "$srcdir/$pkgname"
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 -i "$srcdir/lua.patch"
}

build() {
  cd "$srcdir/$pkgname"
  mkdir -p build && cd build
  cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLUAPATH=/usr/lib/lua/5.1
  make
}

package() {
  cd "$srcdir/$pkgname"
  cd build
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
