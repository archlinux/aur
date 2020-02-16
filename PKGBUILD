# Maintainer: japm48 <japm48gh@gmail.com>

pkgname=icotools-icoprog-usb

pkgver=r145.9c6185b
pkgrel=1
arch=('x86_64')

pkgdesc="Programmer and Debug Tool for the IcoBoard (USB Base Board variant)"
url="https://github.com/cliffordwolf/icotools"
license=('ISC')

makedepends=(git)
depends=(libftdi-compat)

_repo=cliffordwolf/icotools
source=("git+https://github.com/${_repo}.git")
sha512sums=('SKIP')

pkgver() {
  cd "icotools"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir/icotools"
  cd icoprog
  
  sed -i 's|/usr/local/|$(DESTDIR)/usr/|' Makefile
  sed -i 's|sudo ||' Makefile
  make USBMODE=1 icoprog
}

package() {
  cd "$srcdir/icotools"
  cd icoprog
  
  mkdir -p "${pkgdir}/usr/bin"
  make USBMODE=1 DESTDIR="$pkgdir" install
  
  # Get license
  head icoprog.cc -n17 | cut -d\* -f2 | awk '{$1=$1};1' >"LICENSE"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}



