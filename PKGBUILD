# Maintainer: NebulaNeko <chfsefefgesfen foxmail>
# Contributor: Radek Podgorny <radek@podgorny.cz>

pkgname=novnc
pkgver=1.1.0
pkgrel=1
pkgdesc="HTML VNC Client Library and Application"
arch=('any')
url="https://github.com/novnc/noVNC"
license=('custom')
depends=('bash')
optdepends=('websockify: WebSockets support for any application/server, also depend by novnc launch script.')
source=("$pkgname-$pkgver.tar.gz::https://github.com/noVNC/noVNC/archive/v${pkgver}.tar.gz")
sha512sums=('9c736912f5a3051027efe779fc64b182f523b9378ff412d78202e52665772678846d97fe3cc5ac18f5c29dd83d5ff2a2dd915e5eadf9af3573fe871db2e7821e')


prepare(){
  cd "noVNC-$pkgver"
  sed \
    -e 's#\(share\)#\1/webapps#g' \
    -e '119,+28c WEBSOCKIFY=/usr/bin/websockify' \
    -i utils/launch.sh
}

package() {
  cd "noVNC-$pkgver"

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 vendor/pako/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
  ( cd docs; find . -name 'LICENSE*' -type f -exec cp -a {} "$pkgdir/usr/share/licenses/$pkgname/{}" \; )

  install -dm644 "$pkgdir/usr/share/doc/$pkgname"
  ( cd docs; find . ! -name 'LICENSE*' -type f -exec cp -a {} "$pkgdir/usr/share/doc/$pkgname/{}" \; )

  install -Dm755 utils/launch.sh "$pkgdir/usr/bin/novnc"

  install -dm755 "$pkgdir/usr/share/webapps/novnc"
  cp -a app core vendor vnc.html "$pkgdir/usr/share/webapps/novnc"
}
