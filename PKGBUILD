# Maintainer: Luis Sarmiento < Luis.Sarmiento-ala-nuclear.lu.se >

pkgname=scid
_pkgname=Scid
pkgver=4.6.1
_pkgver=4.6
pkgrel=2
pkgdesc="A Free Chess Database Application"
url="http://scid.sourceforge.net"
arch=('x86_64' 'i686')
license=('GPL')
# namcap says 'tk' is not needed. tlc is needed but tk has it as a dependency.
depends=('python' 'tk')
optdepends=('snack: for sound support'
            'tkimg: for using some alternate sets of pieces')

options=('!emptydirs')

source=("http://sourceforge.net/projects/${pkgname}/files/${_pkgname}/${_pkgname}%20${_pkgver}/${pkgname}-v${pkgver}.zip")
md5sums=('cb241937ce0df20f5b75893da4743971')

build() {
  cd $srcdir/$pkgname
  ./configure BINDIR=$pkgdir/usr/bin SHAREDIR=$pkgdir/usr/share/$pkgname
  make -j1 || return 1
}

package () {
  cd $srcdir/$pkgname
  make DESTDIR=$pkgdir install
  msg "Creating Desktop file"
  install -Dm644 $srcdir/$pkgname/svg/scid.ico $pkgdir/usr/share/scid/scid.ico
  echo "
[Desktop Entry]
Version=1.0
Name=${_pkgname}
Comment=${pkgdesc}
Exec=${pkgname}
Icon=/usr/share/${pkgname}/${pkgname}.ico
Categories=Game;BoardGame;
Type=Application
Terminal=false
StartupNotify=false
" > $srcdir/$pkgname.desktop

  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  msg "Copying sound files"
  install -d $pkgdir/usr/share/sounds
  install -Dm644 $srcdir/$pkgname/sounds/*.wav $pkgdir/usr/share/sounds

  msg "Fix world writtable bit in books folder"
  find $pkgdir/usr/share/scid/books -type f -exec chmod 644 {} \;

  msg "Removing reference to '$pkgdir'"
  sed -i "s#$pkgdir##g" $pkgdir/usr/bin/$pkgname

  msg "Applying Polish language fix"
  sed -i 's/iso8859-1\ polish/iso8859-2\ polish/g' $pkgdir/usr/share/scid/tcl/language.tcl

}
