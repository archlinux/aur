# Maintainer: Luis Sarmiento < Luis.Sarmiento-ala-nuclear.lu.se >

pkgname=scid
_pkgname=Scid
pkgver=5.0.2
_pkgver=5.0.2
pkgrel=1
pkgdesc="A Free Chess Database Application"
url="http://scid.sourceforge.net"
arch=('x86_64')
license=('GPL')
depends=('python' 'tk' 'desktop-file-utils')
optdepends=('snack: for sound support'
            'tkimg: for using some alternate sets of pieces')
options=('!emptydirs')
install="${pkgname}.install"
source=("https://github.com/benini/scid/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('54b1b3c66810d806464966cafd73f0afa2aa39bd2e17549ebf1d12f659e46301')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure BINDIR=/usr/bin SHAREDIR=/usr/share/$pkgname SCIDFLAGS="$LDFLAGS"
  sed -i "/LDFLAGS =$/d" engines/phalanx-scid/makefile
  make || return 1
}

package () {
  cd $srcdir/${pkgname}-${pkgver}
  make DESTDIR=$pkgdir install
  msg "Creating Desktop file"
  install -Dm644 $srcdir/$pkgname-${pkgver}/resources/svg/scid.ico $pkgdir/usr/share/scid/scid.ico
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
  install -Dm644 $srcdir/$pkgname-${pkgver}/sounds/*.wav $pkgdir/usr/share/sounds

  msg "Fix world writtable bit in books folder"
  find $pkgdir/usr/share/scid/books -type f -exec chmod 644 {} \;
}
