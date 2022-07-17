# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=sng
pkgver=1.1.0
pkgrel=2
pkgdesc="Convert PNGs to and from a text format representation"
debpatch=4
arch=('i686' 'x86_64')
url="http://sng.sourceforge.net/"
license=('BSD')
depends=('libpng' 'netpbm')
source=("https://sourceforge.net/projects/$pkgname/files/sng-${pkgver}.tar.gz"
        "https://deb.debian.org/debian/pool/main/s/sng/sng_${pkgver}-${debpatch}.debian.tar.xz")
b2sums=('66a013f5d0875766f249b3c75aceb8991e3a58dbbd3e02d1c845711547c71ce886334197edceafc90cbe0bf07f70bd46e4cca1a93e6a411b1605991ff098d0be'
        '5f77805994ed40f0517d6276910b43e7fd77e4e78313b80ae8181bcc334a051acf67ecc74d02bfe4575546ddc59ce6cbeca6da79e2a17e71881132f2b5ad356f')

prepare() {
  cd "${pkgname}-${pkgver}"
  while read patch; do
    patch -p1 -i ../debian/patches/"${patch}"
  done < ../debian/patches/series

  rm Makefile
  autoreconf -fi
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-rgbtxt=/usr/share/netpbm/rgb.txt
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
