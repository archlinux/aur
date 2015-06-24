# Submitter:  Milan Knížek <knizek@volny.cz>
# Maintainer: Milan Knížek <knizek@volny.cz>

pkgname=x2godesktopsharing
pkgver=3.1.1.2
pkgrel=2
pkgdesc="x2godesktopsharing is an X2Go add-on tool that allows a user to grant other X2go users access to the current session (shadow session support)."
arch=('i686' 'x86_64')
url="http://www.x2go.org/"
license=('GPL')
depends=('x2goserver>=4.0.1' 'qt4>=4.5')
options=(emptydirs)
install=$pkgname.install
groups=('x2go' 'alts')
options=(!strip)
source=('sharetray.cpp.patch2'
        "http://code.x2go.org/releases/source/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('83c1d72798534d60a2fcc2d21713cd83'
         'bd48394f5a4eaa55559622f21a5e0a79')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
#  echo "CONFIG = qt x11 dll debug" >> x2godesktopsharing.pro
  patch -p0 < ../sharetray.cpp.patch2
  qmake-qt4 x2godesktopsharing.pro
#  cp ../Makefiledbg Makefile
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m 755 x2godesktopsharing "$pkgdir/usr/bin/x2godesktopsharing"
  install    -m 755 bin/x2goresume-desktopsharing "$pkgdir/usr/bin/x2goresume-desktopsharing"
  install    -m 755 bin/x2gosuspend-desktopsharing "$pkgdir/usr/bin/x2gosuspend-desktopsharing"
  install    -m 755 bin/x2goterminate-desktopsharing "$pkgdir/usr/bin/x2goterminate-desktopsharing"

  install -d -m 755 "$pkgdir/usr/share/applications"
  install    -m 644 x2godesktopsharing.desktop "$pkgdir/usr/share/applications/x2godesktopsharing.desktop"

  install -d -m 755 "$pkgdir/usr/share/x2godesktopsharing/icons"
  install    -m 644 icons/x2godesktopsharing.xpm "$pkgdir/usr/share/x2godesktopsharing/icons/x2godesktopsharing.xpm"

  install -d -m 755 "$pkgdir/usr/share/icons/hicolor/128x128/apps"
  install    -m 644 icons/128x128/x2godesktopsharing.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/x2godesktopsharing.png"

  install -d -m 755 "$pkgdir/usr/share/icons/hicolor/16x16/apps"
  install    -m 644 icons/16x16/x2godesktopsharing.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/x2godesktopsharing.png"

  install -d -m 755 "$pkgdir/usr/share/icons/hicolor/64x64/apps"
  install    -m 644 icons/64x64/x2godesktopsharing.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/x2godesktopsharing.png"

  install -d -m 755 "$pkgdir/usr/share/icons/hicolor/32x32/apps"
  install    -m 644 icons/32x32/x2godesktopsharing.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/x2godesktopsharing.png"

  gzip man/man1/x2godesktopsharing.1
  install -d -m 755 "$pkgdir/usr/share/man/man1"
  install    -m 644 -t "$pkgdir/usr/share/man/man1" man/man1/x2go*.gz

  gzip man/man8/x2go*-desktopsharing.8
  install -d -m 755 "$pkgdir/usr/share/man/man8"
  install    -m 644 -t "$pkgdir/usr/share/man/man8" man/man8/x2go*-desktopsharing.8.gz

  install -d -m 755 "$pkgdir/usr/share/menu"

  install -d -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"

  install -d -m 755 "${pkgdir}/usr/share/x2go/versions/"
  echo ${pkgver} > "${pkgdir}/usr/share/x2go/versions/VERSION.$pkgname"

  install -D -m 755 "share/x2gofeature.d/x2godesktopsharing.features" "${pkgdir}/usr/share/x2go/x2gofeature.d/x2godesktopsharing.features"
}
