# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=biblesync-git
pkgver=2.0.1.r1.gb16df42
pkgrel=5
epoch=1
pkgdesc='multicast shared co-navigation library for Bible programs'
arch=('x86_64' 'i686')
url='https://github.com/karlkleinpaste/biblesync'
license=('custom')
makedepends=('cmake' 'git')
provides=("${pkgname%-git}=$pkgver" "libbiblesync.so")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --tags --abbrev=7 HEAD | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  cmake -S . -B build \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBDIR=/usr/lib
  make -C build
}

package() {
  cd "${pkgname%-git}"
  make -C build DESTDIR="$pkgdir/" install
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    ChangeLog README.md man/specification.txt WIRESHARK
  install -Dm644 -t "$pkgdir/usr/share/licences/$pkgname/" \
    AUTHORS COPYING LICENSE
}
