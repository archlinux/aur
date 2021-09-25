# Maintainer: Marcel Bierling <morzzz@gmail.com>

_pkgname=freetype
pkgname=lib32-libttf2
pkgver=1.3.1
pkgrel=1
pkgdesc="A free, high-quality, and portable font engine (32-bit)"
arch=('x86_64')
url="https://www.freetype.org/freetype1/"
license=('GPL')
depends=('lib32-glibc')
makedepends=('gcc-multilib')
source=(https://sourceforge.net/projects/freetype/files/freetype/${pkgver}/${_pkgname}-${pkgver}.tar.gz
        freetype-tools-${pkgver}.patch
        freetype-${pkgver}.dif
        freetype-${pkgver}-nopatent.patch
        freetype-${pkgver}-gcc.patch
        freetype-${pkgver}-kpathsea.patch
        update-config-files.diff
        libtool32bitweirdness.diff)
sha1sums=('a398fb4d6dd756826e459058d8075759086f8ca4'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP')

prepare() {
  cd ${_pkgname}-${pkgver}
  patch -Np1 -i "${srcdir}/libtool32bitweirdness.diff"
  patch -Np1 -i "${srcdir}/freetype-tools-${pkgver}.patch"
  patch -Np0 -i "${srcdir}/freetype-${pkgver}.dif"
  patch -Np0 -i "${srcdir}/freetype-${pkgver}-nopatent.patch"
  patch -Np0 -i "${srcdir}/freetype-${pkgver}-gcc.patch"
  patch -Np0 -i "${srcdir}/freetype-${pkgver}-kpathsea.patch"
  patch -Np1 -i "${srcdir}/update-config-files.diff"
}

build() {
  export CC="gcc -m32"

  cd ${_pkgname}-${pkgver}

  sed "s:getline:getline_nonlibc:" -i contrib/*/*.{c,h}

  ./configure --prefix=/usr --disable-static --libdir=/usr/lib32 --mandir=/usr/share/man --infodir=/usr/share/info --host=$CARCH-unknown-linux-gnu --target=$CARCH-unknown-linux-gnu
  make ttlib
}

package() {
  mkdir ${pkgdir}/usr ${pkgdir}/usr/lib32
  cp ${_pkgname}-${pkgver}/lib/.libs/libttf.so.2.2.0 ${pkgdir}/usr/lib32
  cd ${pkgdir}/usr/lib32
  ln -s libttf.so.2.2.0 libttf.so.2
}
