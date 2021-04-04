# Maintainer: seiuneko <chfsefefgesfen foxmail>
# Contributor: Radek Podgorny <radek@podgorny.cz>

pkgname=novnc
pkgver=1.2.0
pkgrel=3
pkgdesc="HTML VNC Client Library and Application"
arch=('any')
url="https://github.com/novnc/noVNC"
license=('custom')
depends=('bash' 'websockify' 'inetutils')
optdepends=('python-numpy: better HyBi protocol performance')
source=("$pkgname-$pkgver.tar.gz::https://github.com/noVNC/noVNC/archive/v${pkgver}.tar.gz")
sha512sums=('461490da7bb983e9c94b8ce39f8455ee6609b5a9df8d88254bcc37ebaa5153f5ee9db6afbd88b51762d6d55661bc5cde6fbe70616597583bfce1203e337adf75')


prepare(){
  cd "noVNC-$pkgver"
  sed \
    -e 's#\(share\)#\1/webapps#g' \
    -e '2 i WEBSOCKIFY=/usr/bin/websockify' \
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
  cp -a app core po vendor vnc.html karma.conf.js package.json vnc_lite.html "$pkgdir/usr/share/webapps/novnc"
}
