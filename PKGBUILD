# Maintainer: seiuneko <chfsefefgesfen foxmail>
# Contributor: Radek Podgorny <radek@podgorny.cz>

pkgname=novnc
pkgver=1.4.0
pkgrel=1
pkgdesc="HTML VNC Client Library and Application"
arch=('any')
url="https://github.com/novnc/noVNC"
license=('custom')
depends=('bash' 'websockify' 'inetutils')
optdepends=('python-numpy: better HyBi protocol performance')
source=("$pkgname-$pkgver.tar.gz::https://github.com/noVNC/noVNC/archive/v${pkgver}.tar.gz"
        "novnc@.service")
sha512sums=('b42b0e8c3947dba9a9ba8518bbeb218e77c9d36302c1161f168351ef971c76f3a25e0d136d44e5aa0c6d934290e7d8f23961519e64ca9bdb1eeed8d416aecee3'
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
