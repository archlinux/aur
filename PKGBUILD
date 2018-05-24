# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=nufraw
pkgver=0.42
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
https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz
nufraw.desktop
)
noextract=($pkgname-$pkgver.tar.gz)
sha512sums=('43c864e41e30e80b7d6bab68810646a6a5cee070cf0941321b35213bdfc68fd8ec41694de1add294163c1f6753f6afc12e11be25b1124d4cd7acd5b7c0de13a9'
            'd906c384fe19ebda8e0e8a9207b193f2ca20fa5ef13ba70f6ecf4019babea6f20dbf3249bb766dd21db450db04bd6a41a8bbccb168ddb3a419cc6c27cd627688')
prepare(){
  cd "$srcdir"
  tar zxf $pkgname-$pkgver.tar.gz \
    --exclude doc-pak --exclude=.git
  cd "$pkgname-$pkgver"
  chmod +x mkinstalldirs generate_schemas.sh
  mv nufraw.desktop.desktop nufraw.desktop
#   msg2 "Fixing dcraw.cc: error: call of overloaded ‘abs(unsigned int&)’ is ambiguous"
#   sed '9361s/abs/ABS/g' -i dcraw.cc
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

