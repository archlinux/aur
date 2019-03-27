# Maintainer: Luis Sarmiento < Luis.Sarmiento-ala-nuclear.lu.se >

pkgname=scid
_pkgname=Scid
pkgver=4.7.0
_pkgver=4.7
pkgrel=2
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
source=("https://sourceforge.net/projects/${pkgname}/files/${_pkgname}/${_pkgname}%20${_pkgver}/${pkgname}-code-${pkgver}.zip")
sha256sums=('2ed25781ec3c82d60fcee85259c19fd8934feae2547f9464304cdb01960f86da')

build() {
  cd $srcdir/$pkgname
  ./configure BINDIR=/usr/bin SHAREDIR=/usr/share/$pkgname SCIDFLAGS="$LDFLAGS"
  sed -i "/LDFLAGS =$/d" engines/phalanx-scid/makefile
  make || return 1
}

package () {
  cd $srcdir/$pkgname
  make DESTDIR=$pkgdir install
  msg "Creating Desktop file"
  install -Dm644 $srcdir/$pkgname/resources/svg/scid.ico $pkgdir/usr/share/scid/scid.ico
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
  install -Dm644 $srcdir/$pkgname/sounds/*.wav $pkgdir/usr/share/sounds

  msg "Fix world writtable bit in books folder"
  find $pkgdir/usr/share/scid/books -type f -exec chmod 644 {} \;
}
