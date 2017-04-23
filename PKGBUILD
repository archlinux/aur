# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public@gmail.com>

pkgname=nufraw
pkgver=0.39
pkgrel=1
pkgdesc='A new version of the popular raw digital images manipulator ufraw.'
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/nufraw'
license=('GPL')
provides=(gimp-nufraw)
depends=('gtkimageview' 'exiv2' 'lcms' 'desktop-file-utils' 'cfitsio' 'lensfun')
makedepends=('gimp')
optdepends=('gimp: to use the gimp import plugin for raw images')
source=(
https://sourceforge.net/projects/$pkgname/files/$pkgname-$pkgver.tar.gz
nufraw.desktop
)
noextract=($pkgname-$pkgver.tar.gz)
sha512sums=('43a82d5706ddce58d3499c4206955be4afb829c39701dd4d73150d7da51d34b2a9534eefc2ee627df71c85592275c417000725c6779fb109fe3826c851f1334d'
            'ccd6318b5d731e60aef35505e2ce01dfc9469d46b8f14577f4fab722cb1fed0f408a3513ba3432ebb8938c9a1647320b4f6accbd1c30002865daac84f6578bbf')
prepare(){
  cd "$srcdir"
  tar zxf $pkgname-$pkgver.tar.gz \
    --exclude doc-pak --exclude=.git
  cd "$pkgname-$pkgver"
  chmod +x mkinstalldirs generate_schemas.sh
  mv nufraw.desktop.desktop nufraw.desktop
}
build(){
  cd "$srcdir"/$pkgname-$pkgver

  msg2 "Running autogen"
  ./autogen.sh
  msg2 "Running configure"
  local configure=(
    --prefix=/usr
    --enable-contrast
    --enable-mime
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
  msg2 "Running make install"
  make DESTDIR="$pkgdir/" install
  rm -f "$pkgdir/usr/bin/dcraw"                 # provided by dcraw
  rm -f "$pkgdir/usr/bin/nikon-curve"           # provided by gimp-ufraw
  install -Dm644 "$srcdir/nufraw.desktop" "$pkgdir/usr/share/applications/nufraw.desktop"
  install -Dm644 nufraw-mime.xml "$pkgdir/usr/share/mime/packages/nufraw-mime.xml"
}

