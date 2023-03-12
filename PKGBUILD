# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=nufraw
pkgver=0.43_3
_pkgver=0.43-3
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
https://downloads.sourceforge.net/project/$pkgname/$pkgname-$_pkgver.tar.gz
nufraw_cplusplus.patch
nufraw.desktop
)
noextract=($pkgname-$_pkgver.tar.gz)
sha512sums=('60a6d764ca0248f8c388f4b16ff67cded954f642515bb706d1d45bdab189d159593c93f29ec83bbe6cbe4597d6f229a1839f32a450d5ee1d73a135a825933ec8'
            '049176bb5379e0d8df651fc1f4ae0e3e50beb5bb604f5e84b9089df391eaac0e6d60c7626788793d9cbcfea78e1c17944f9ec961e572bc35501e755f57b95a90'
            'd906c384fe19ebda8e0e8a9207b193f2ca20fa5ef13ba70f6ecf4019babea6f20dbf3249bb766dd21db450db04bd6a41a8bbccb168ddb3a419cc6c27cd627688')
prepare(){
  cd "$srcdir"
  tar zxf $pkgname-$_pkgver.tar.gz \
    --exclude doc-pak --exclude=.git
  cd "$pkgname-$_pkgver"
  patch < ../nufraw_cplusplus.patch
  chmod +x mkinstalldirs generate_schemas.sh
  mv nufraw.desktop.desktop nufraw.desktop
#   msg2 "Fixing dcraw.cc: error: call of overloaded ‘abs(unsigned int&)’ is ambiguous"
#   sed '9361s/abs/ABS/g' -i dcraw.cc
}
build(){
  cd "$srcdir"/$pkgname-$_pkgver

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
  cd "$srcdir"/$pkgname-$_pkgver
  msg2 "Running make install"
  make DESTDIR="$pkgdir/" install
  rm -f "$pkgdir/usr/bin/dcraw"                 # provided by dcraw
  rm -f "$pkgdir/usr/bin/nikon-curve"           # provided by gimp-ufraw
  install -Dm644 "$srcdir/nufraw.desktop" "$pkgdir/usr/share/applications/nufraw.desktop"
  install -Dm644 nufraw-mime.xml "$pkgdir/usr/share/mime/packages/nufraw-mime.xml"
}

