# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>

pkgname=nlbwmon
pkgver=20170807
pkgrel=1
pkgdesc="Simple conntrack based traffic accounting"
arch=('x86_64' 'i686')
url="https://github.com/jow-/nlbwmon"
license=('ISC')
depends=('zlib' 'libnl' 'libubox')
makedepends=('git' 'cmake')
source=("git+https://github.com/jow-/nlbwmon"
        "cmake.patch")
sha256sums=('SKIP'
            '7af0737d147a1ff5042b15b3fd3aae64feceda8ee4bf544c1f69a4cd8ebb8499')

pkgver() {
  cd "$srcdir/$pkgname"
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 -i "$srcdir/cmake.patch"
}

build() {
  cd "$srcdir/$pkgname"
  mkdir -p build && cd build
  cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/$pkgname"
  cd build
  make DESTDIR="$pkgdir/" install
  ln -s nlbwmon "$pkgdir/usr/bin/nlbw"
  install -D -m 644 ../protocols.txt "$pkgdir/usr/share/nlbwmon/protocols"
}

# vim:set ts=2 sw=2 et:
