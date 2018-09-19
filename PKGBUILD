# Maintainer: Jan Holthuis <holthuis.jan@googlemail.com>
pkgname=libcmmk-git
_pkgname=libcmmk
pkgver=r65.9894101
pkgrel=2
pkgdesc="An unofficial LED control API for Coolermaster Masterkey keyboards"
arch=(i686 x86_64)
url="https://github.com/chmod222/libcmmk"
license=('GPL')
depends=(libusb)
makedepends=(cmake)
install="${pkgname}.install"
source=("git+https://github.com/chmod222/libcmmk.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_BINDIR=bin \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_INCLUDEDIR=include/libcmmk \
        ..
  make
}

package() {
  cd "$srcdir/$_pkgname/build"
  make DESTDIR="$pkgdir/" install

  cd "$srcdir/$_pkgname"
  install -d "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm755 "contrib/etc/udev/rules.d/20-coolermaster.rules" "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm755 "extra/reference/CoolerMaster LED Table.xls" "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm755 "PROTOCOL.md" "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm755 "README.md" "$pkgdir/usr/share/doc/$_pkgname"
}
# vim: set ts=2 sw=2 et:
