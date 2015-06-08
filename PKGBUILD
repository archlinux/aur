# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=gog-tri
pkgver=1.4.0.6
pkgrel=1
pkgdesc="Puzzle game about triangles and foxes (GOG.com version)"
arch=('i686' 'x86_64')
url="http://www.gog.com/game/tri"
license=('custom: GOG.com EULA')
depends=('glu')
source=(gog://gog_tri_$pkgver.tar.gz
	"$pkgname"
	"$pkgname.desktop")
sha256sums=('018662c5b112939c5247a4d59f2f5583526c87f164d2e66c92bd344e95998c06'
            '7a01b6e86edf010c170816e3b55bb5f762b719096dfe05081e49bed487365498'
            '6bf4fc465f259b0e4a2b025ba1b1a12b865d24dda3a12b161fddd776a3311f5c')

prepare() {
  cd TRI

  find -type d -exec chmod 755 {} +
  find -type f -exec chmod 644 {} +
  chmod 755 start.sh game/tri.x86*

  if [ "$CARCH" == i686 ]; then
    rm game/tri.x86_64
  else
    rm game/tri.x86
  fi

  fmt -s "docs/End User License Agreement.txt" > docs/EULA
}

package() {
  cd TRI

  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 docs/EULA "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -d "$pkgdir/opt/TRI"
  install -d "$pkgdir/usr/share/icons"

  cp -a start.sh game support "$pkgdir/opt/TRI"
  ln -s /opt/TRI/support/gog-tri.png "$pkgdir/usr/share/icons/gog-tri.png"
}
