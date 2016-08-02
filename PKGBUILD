# Maintainer: Luis Sarmiento < Luis.Sarmiento-ala-nuclear.lu.se >

pkgname=scid
_pkgname=Scid
pkgver=4.6.4
_pkgver=4.6
pkgrel=1
pkgdesc="A Free Chess Database Application"
url="http://scid.sourceforge.net"
arch=('x86_64' 'i686')
license=('GPL')
# namcap says 'tk' is not needed. tlc is needed but tk has it as a dependency.
depends=('python' 'tk' 'desktop-file-utils')
optdepends=('snack: for sound support'
            'tkimg: for using some alternate sets of pieces')
options=('!emptydirs')
install="${pkgname}.install"
source=("https://sourceforge.net/projects/${pkgname}/files/${_pkgname}/${_pkgname}%20${_pkgver}/${pkgname}-${pkgver}.zip")
md5sums=('766f212dc8f3414415c78405aeb6f85d')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure BINDIR=/usr/bin SHAREDIR=/usr/share/$pkgname
  make || return 1
}

package () {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  msg "Creating Desktop file"
  install -Dm644 $srcdir/$pkgname-$pkgver/svg/scid.ico $pkgdir/usr/share/scid/scid.ico
  cat > $srcdir/$pkgname.desktop <<EOF
[Desktop Entry]
Version=1.0
Name=${_pkgname}
Comment=${pkgdesc}
Exec=${pkgname} %F
MimeType=application/x-chess-pgn
Icon=/usr/share/${pkgname}/${pkgname}.ico
Categories=Game;BoardGame;
Type=Application
Terminal=false
StartupNotify=false
EOF

  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  msg "Copying sound files"
  install -d $pkgdir/usr/share/sounds
  install -Dm644 $srcdir/$pkgname-$pkgver/sounds/*.wav $pkgdir/usr/share/sounds

  msg "Fix world writtable bit in books folder"
  find $pkgdir/usr/share/scid/books -type f -exec chmod 644 {} \;

  msg "Removing reference to '$pkgdir'"
  sed -i "s#$pkgdir##g" $pkgdir/usr/bin/$pkgname

  msg "Applying Polish language fix"
  sed -i 's/iso8859-1\ polish/iso8859-2\ polish/g' $pkgdir/usr/share/scid/tcl/language.tcl

}
