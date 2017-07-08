# Maintainer: orumin <dev at orum.in>

pkgname=lib32-gd
_basename=gd
pkgver=2.2.4
pkgrel=1
pkgdesc="Library for the dynamic creation of images by programmers (32-bit)"
arch=('x86_64')
url="http://www.libgd.org/"
license=('custom')
depends=('lib32-fontconfig' 'lib32-libxpm' 'lib32-libwebp' 'gd')
optdepends=('perl: bdftogd script')
checkdepends=('ttf-liberation')
source=("https://github.com/libgd/libgd/releases/download/gd-${pkgver}/libgd-${pkgver}.tar.xz"
        'gd-2.2.4-upstream.patch')
md5sums=('a244855a323a3ea1975d708eb1e12b7a'
         '7db6743a61b30471d0b466e6a6c54a49')

prepare() {
  cd libgd-${pkgver}
  patch -p1 -i ${srcdir}/gd-2.2.4-upstream.patch
}

build() {
  cd libgd-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix=/usr \
    --build=i686-pc-linux-gnu \
    --libdir=/usr/lib32 \
    --disable-rpath
  make
}

check() {
  cd libgd-${pkgver}
  #make check
}

package() {
  cd libgd-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}"/usr/bin
  rm -r "${pkgdir}"/usr/include
}
