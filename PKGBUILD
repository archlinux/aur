# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public@gmail.com>

pkgname=nufraw
pkgver=0.37
pkgrel=2
pkgdesc='A new version of the popular raw digital images manipulator ufraw.'
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/nufraw'
license=('GPL')
provides=(gimp-nufraw)
depends=('gtkimageview' 'exiv2' 'lcms' 'desktop-file-utils' 'cfitsio' 'lensfun')
makedepends=('gimp')
optdepends=('gimp: to use the gimp import plugin for raw images')
source=(https://sourceforge.net/projects/$pkgname/files/$pkgname-$pkgver.tar.gz
nufraw.desktop
)
sha512sums=('a61669fd353891323e86ea8e4c754f072ddb076d9817b773ab46107c4faed325a9d9481e9937da763eef1ae22784ceccd126d831119499f6d126c9837b62050d'
            '46285022f5ffcb57b99f3595c5907cba90a5be022bece5b77911597ecd3efbcba9bdea660bbcb175c8d8fb1cfab904f52b920b2e81dca541b2b1b5c544b8a498')

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
  install -Dm644 "$srcdir/nufraw.desktop" "$pkgdir/usr/share/applications/nufraw.desktop"
}

