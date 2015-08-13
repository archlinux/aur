# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=gog-tri
pkgver=2.4.0.7
pkgrel=2
pkgdesc="Puzzle game about triangles and foxes (GOG.com version)"
arch=('i686' 'x86_64')
url="http://www.gog.com/game/tri"
license=('custom: GOG.com EULA')
depends=('glu')
makedepends=('dos2unix')
source=(local://gog_tri_$pkgver.sh
        $pkgname
        $pkgname.desktop)
sha256sums=('67e9f5ac366a92e8f75d894c260208386e1ec0f53874d7b6681aeef5785cf30f'
            '7a01b6e86edf010c170816e3b55bb5f762b719096dfe05081e49bed487365498'
            '6bf4fc465f259b0e4a2b025ba1b1a12b865d24dda3a12b161fddd776a3311f5c')

prepare() {
  cd data
  mv noarch/* .
  rmdir noarch
  rm -fr support/xdg-utils

  find -type d -exec chmod 755 {} +
  find -type f -exec chmod 644 {} +
  chmod 755 start.sh game/tri.x86*

  if [ "$CARCH" == i686 ]; then
    rm game/tri.x86_64
  else
    rm game/tri.x86
  fi

  dos2unix -q "docs/End User License Agreement.txt"
  mv "docs/End User License Agreement.txt" docs/EULA
}

package() {
  cd data

  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 docs/EULA "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -d "$pkgdir/opt/TRI"
  install -d "$pkgdir/usr/share/icons"

  cp -a start.sh game gameinfo support "$pkgdir/opt/TRI"
  ln -s /opt/TRI/support/icon.png "$pkgdir/usr/share/icons/gog-tri.png"
}
