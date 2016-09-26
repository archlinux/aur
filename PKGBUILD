# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public@gmail.com>

pkgname=nufraw
pkgver=0.33
pkgrel=1
pkgdesc='A new version of the popular raw digital images manipulator ufraw.'
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/nufraw'
license=('GPL')
provides=(gimp-nufraw)
depends=('gtkimageview' 'exiv2' 'lcms' 'desktop-file-utils' 'cfitsio' 'lensfun')
makedepends=('gimp')
optdepends=('gimp: to use the gimp import plugin for raw images')
source=(https://sourceforge.net/projects/$pkgname/files/$pkgname-$pkgver.tar.gz)
sha512sums=('1a64cb7f492eec8bc275c903b17d0e0e0750b099cf70964ebd185d45b447d140484371f2058b818b37cee1bc464a4f09c0344b7f47846f43f99e1ecb72ac8bf0')

prepare(){
  cd "$pkgname-$pkgver"
  chmod +x mkinstalldirs
}
build(){
  cd "$srcdir"/$pkgname-$pkgver

  msg2 "Running autogen"
  ./autogen.sh
  msg2 "Running configure"
  configure=(
    --prefix=/usr
    --enable-contrast
#     --enable-mime                             # make[2]: *** No rule to make target 'nufraw.desktop', needed by 'all-am'.  Stop.
    --enable-extras
    --enable-dst-correction
    --enable-openmp
    --with-gimp
#     --with-cinepaint                          # WARNING: unrecognized options: --with-cinepaint
  )
  ./configure ${configure[*]}
  msg2 "Running make"
  make
}
package(){
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
  rm -f "$pkgdir/usr/bin/dcraw"
  rm -f "$pkgdir/usr/bin/nikon-curve"
}

