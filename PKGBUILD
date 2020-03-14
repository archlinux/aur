# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=biblesync-git
pkgver=2.0.1.r1.gb16df42
pkgrel=2
epoch=1
pkgdesc='multicast shared co-navigation library for Bible programs'
arch=('x86_64' 'i686')
url='https://github.com/karlkleinpaste/biblesync'
license=('custom')
makedepends=('cmake' 'git')
provides=("${pkgname%-git}=$pkgver" "libbiblesync.so=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --tags --abbrev=7 HEAD | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  mkdir -p build
  cd build
  cmake \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBDIR=/usr/lib \
    ../
  make
}

package() {
  cd "${pkgname%-git}"
  install -Dm644 -t "$pkgdir/usr/share/licences/$pkgname/" AUTHORS COPYING LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" ChangeLog README.md man/specification.txt WIRESHARK
  cd build
  make DESTDIR="$pkgdir/" install
}
