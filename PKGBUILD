# Maintainer: seiuneko <chfsefefgesfen foxmail>
# Contributor: Radek Podgorny <radek@podgorny.cz>

pkgname=novnc
pkgver=1.3.0
pkgrel=1
pkgdesc="HTML VNC Client Library and Application"
arch=('any')
url="https://github.com/novnc/noVNC"
license=('custom')
depends=('bash' 'websockify' 'inetutils' 'which')
optdepends=('python-numpy: better HyBi protocol performance')
source=("$pkgname-$pkgver.tar.gz::https://github.com/noVNC/noVNC/archive/v${pkgver}.tar.gz"
        "novnc@.service")
sha512sums=('2c9eb019bd9c86a0ffb716eba06e8f05bc522c37561e0acc7f88a66188c617ebc54f4cc9220897c241280ba2ed5919a2050a94eeb3da2c030bde43af0bd92c51'
            '53847ce79b1f90ad1368ad2f631742ae1400cfbbf9540d49b2a113ce928956668503e5e064c90fd62c0789806ed142d2a8b977931dbc524797aa7707791c9e77')


prepare(){
  cd "noVNC-$pkgver"
  sed \
    -e 's#\(share\)#\1/webapps#g' \
    -e '2 i WEBSOCKIFY=/usr/bin/websockify' \
    -i utils/novnc_proxy
}

package() {
  install -Dm644 novnc@.service "${pkgdir}/usr/lib/systemd/system/novnc@.service"

  cd "noVNC-$pkgver"

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 vendor/pako/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
  ( cd docs; find . -name 'LICENSE*' -type f -exec cp -a {} "$pkgdir/usr/share/licenses/$pkgname/{}" \; )

  install -dm644 "$pkgdir/usr/share/doc/$pkgname"
  ( cd docs; find . ! -name 'LICENSE*' -type f -exec cp -a {} "$pkgdir/usr/share/doc/$pkgname/{}" \; )

  install -Dm755 utils/novnc_proxy "$pkgdir/usr/bin/novnc"

  install -dm755 "$pkgdir/usr/share/webapps/novnc"
  cp -a app core po vendor vnc.html karma.conf.js package.json vnc_lite.html "$pkgdir/usr/share/webapps/novnc"
}
