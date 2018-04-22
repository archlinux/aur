# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-isl
_pkgbasename=isl
pkgver=0.19
pkgrel=1
pkgdesc="Library for manipulating sets and relations of integer points bounded by linear constraints"
arch=('x86_64')
url="http://isl.gforge.inria.fr/"
depends=('lib32-gmp' 'lib32-glibc' 'lib32-python' 'isl')
makedepends=('lib32-gcc-libs')
license=('MIT')
source=("http://isl.gforge.inria.fr/${_pkgbasename}-${pkgver}.tar.xz")
sha256sums=('6d6c1aa00e2a6dfc509fa46d9a9dbe93af0c451e196a670577a148feecf6b8a5')


prepare() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export LDFLAGS+=' -m32'
  export PYTHON='/usr/bin/python-32'
  
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
  
  install -dm755 "${pkgdir}/usr/share/gdb/auto-load/usr/lib32/"
  mv "${pkgdir}/usr/lib32/"*.py "${pkgdir}/usr/share/gdb/auto-load/usr/lib32/"
}

