# Maintainer: seiuneko <chfsefefgesfen foxmail>
# Contributor: Radek Podgorny <radek@podgorny.cz>

pkgname=novnc-git
pkgver=1.3.0.r28.g78eda3c
pkgrel=1
pkgdesc="HTML VNC Client Library and Application"
arch=(any)
url="https://github.com/novnc/noVNC"
license=('custom')
depends=('bash' 'websockify' 'inetutils' 'which')
optdepends=('python-numpy: better HyBi protocol performance')
provides=('novnc')
conflicts=('novnc')
source=("novnc::git+https://github.com/novnc/noVNC.git"
        "novnc@.service")
sha512sums=('SKIP'
            '5dce6fb71dcdeab9ebe3986ebad431d01bb01860cb9960b1e70af84b2beba2330738cd9aa37ab9e025ee8263cba7475d484d5c6d55d4b3750d27aff37c7aef41')
makedepends=("git")

pkgver() {
  cd "$srcdir"/novnc
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "novnc"
  sed \
    -e 's#\(share\)#\1/webapps#g' \
    -e '2 i WEBSOCKIFY=/usr/bin/websockify' \
    -i utils/novnc_proxy
}

package() {
  install -Dm644 novnc@.service "${pkgdir}/usr/lib/systemd/system/novnc@.service"

  cd "novnc"

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 vendor/pako/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
  ( cd docs; find . -name 'LICENSE*' -type f -exec cp -a {} "$pkgdir/usr/share/licenses/$pkgname/{}" \; )

  install -dm644 "$pkgdir/usr/share/doc/$pkgname"
  ( cd docs; find . ! -name 'LICENSE*' -type f -exec cp -a {} "$pkgdir/usr/share/doc/$pkgname/{}" \; )

  install -Dm755 utils/novnc_proxy "$pkgdir/usr/bin/novnc"

  install -dm755 "$pkgdir/usr/share/webapps/novnc"
  cp -a app core po vendor vnc.html karma.conf.js package.json vnc_lite.html "$pkgdir/usr/share/webapps/novnc"
}
