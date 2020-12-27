# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

_pkgname=libtiff
pkgname=lib32-${_pkgname}-git
pkgver=4.2.0
pkgrel=1
pkgdesc='Library for manipulation of TIFF images (32-bit)'
url='http://www.simplesystems.org/libtiff/'
arch=('x86_64')
license=('custom')
depends=('libtiff' 'lib32-gcc-libs' 'lib32-libjpeg' 'lib32-zlib' 'lib32-xz' 'lib32-zstd')
makedepends=(wget)
provides=(lib32-libtiff)
conflicts=(lib32-libtiff)
source=(git+https://gitlab.com/libtiff/libtiff.git)
sha512sums=('SKIP')
#validpgpkeys=('EBDFDB21B020EE8FD151A88DE301047DE1198975') # Bob Friesenhahn <bfriesen@simple.dallas.tx.us>

pkgver() {
    cd libtiff
    git describe --tags | sed 's/-/+/g'
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd libtiff

  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man \
    --with-docdir=/usr/share/doc/${pkgname} \
    --libdir=/usr/lib32 \
    --includedir=/usr/include/libtiff32
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

#check() {
#  cd libtiff
#  make check
#}

package() {
  cd libtiff
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{share,bin}
  mkdir -p "${pkgdir}/usr/share/licenses"
  ln -s ${_pkgname} "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
