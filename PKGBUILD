# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public@gmail.com>

pkgname=nufraw
pkgver=0.37
pkgrel=3
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
            'ccd6318b5d731e60aef35505e2ce01dfc9469d46b8f14577f4fab722cb1fed0f408a3513ba3432ebb8938c9a1647320b4f6accbd1c30002865daac84f6578bbf')

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

