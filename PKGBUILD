# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=nufraw
pkgver=0.39
pkgrel=2
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
            'd906c384fe19ebda8e0e8a9207b193f2ca20fa5ef13ba70f6ecf4019babea6f20dbf3249bb766dd21db450db04bd6a41a8bbccb168ddb3a419cc6c27cd627688')
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

