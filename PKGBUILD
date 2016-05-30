# Maintainer: Alexander 'z33ky' Hirsch <1zeeky@gmail.com>
# The following contributors are from community/devil
# Contributor: Laurent Carlier <lordheavym@gmail.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: TheHoff <forums>

pkgname=devil-ilut-vanilla
# "vanilla" as in doesn't add more --enable or --disable flags than neccesary for ILUT
pkgver=1.7.8
pkgrel=1
pkgdesc="Library for reading several different image formats (includes ILUT & doesn't --{dis,en}able more than that)"
arch=('i686' 'x86_64')
url='http://openil.sourceforge.net/'
depends=('libpng' 'libmng' 'jasper' 'lcms' 'openexr')
options=('!docs' '!emptydirs')
license=('GPL')
provides=('devil')
conflicts=('devil')
source=(http://downloads.sourceforge.net/openil/DevIL-$pkgver.tar.gz
        libpng14.patch
        gcc-5.0.patch)
md5sums=('7918f215524589435e5ec2e8736d5e1d'
         '0f839ccefd43b0ee8b4b3f99806147fc'
         '8d1b5d973c93927f60f775aecb448e77')

prepare() {
  cd ${srcdir}/devil-$pkgver

  patch -Np1 -i ${srcdir}/libpng14.patch
  patch -Np1 -i ${srcdir}/gcc-5.0.patch

  # link against libpng.so, not libpng12.so
  sed -i 's/png12/png/g' configure m4/devil-definitions.m4
}

build() {
  cd ${srcdir}/devil-$pkgver

  if [[ $CARCH == x86_64 ]]; then
    ./configure --prefix=/usr --enable-ILU --enable-ILUT
  else
    ./configure --prefix=/usr --enable-ILU --enable-ILUT --disable-sse3
  fi

  make
}

package() {
  cd ${srcdir}/devil-$pkgver

  make prefix=${pkgdir}/usr install
}
