# Maintainer: Luis Sarmiento < Luis.Sarmiento-ala-nuclear.lu.se >

pkgname=scid
_pkgname=Scid
pkgver=5.1.0
_pkgver=${pkgver}
pkgrel=2
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
sha256sums=('25bf60b047e7ebc14bc43e569f078fe80d4c2a95dfe4b95cdd5fe184649ade61')

build() {
  msg "build ()"
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure BINDIR='${DESTDIR}'/usr/bin SHAREDIR='${DESTDIR}'/usr/share/${pkgname} SCIDFLAGS="$LDFLAGS"
  sed -i "/LDFLAGS =$/d" engines/phalanx-scid/makefile
  make || return 1
}

package () {
  msg "package ()"
  install -d $pkgdir/usr/share/scid
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

  install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

  msg "Copying sound files"
  install -d ${pkgdir}/usr/share/sounds
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/sounds/*.wav ${pkgdir}/usr/share/sounds

  msg "Fix world writtable bit in books folder"
  find ${pkgdir}/usr/share/scid/books -type f -exec chmod 644 {} \;

  msg "Fix dangling symlink"
  ln -sf /usr/share/scid/scid ${pkgdir}/usr/bin/scid
}
