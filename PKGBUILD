# Maintainer: seiuneko <chfsefefgesfen foxmail>
# Contributor: Radek Podgorny <radek@podgorny.cz>

pkgname=novnc-git
pkgver=1.2.0.r20.g90456db
pkgrel=1
pkgdesc="HTML VNC Client Library and Application"
arch=(any)
url="https://github.com/kanaka/noVNC"
license=('custom')
depends=('bash' 'websockify')
optdepends=('python-numpy: better HyBi protocol performance')
provides=('novnc')
conflicts=('novnc')
source=("novnc::git+https://github.com/novnc/noVNC.git")
md5sums=('SKIP')
makedepends=("git")

pkgver() {
  cd   "$srcdir"/novnc
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "novnc"
  sed \
    -e 's#\(share\)#\1/webapps#g' \
    -e '2 i WEBSOCKIFY=/usr/bin/websockify' \
    -i utils/launch.sh
}

package() {
  cd "novnc"

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 vendor/pako/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
  ( cd docs; find . -name 'LICENSE*' -type f -exec cp -a {} "$pkgdir/usr/share/licenses/$pkgname/{}" \; )

  install -dm644 "$pkgdir/usr/share/doc/$pkgname"
  ( cd docs; find . ! -name 'LICENSE*' -type f -exec cp -a {} "$pkgdir/usr/share/doc/$pkgname/{}" \; )

  install -Dm755 utils/launch.sh "$pkgdir/usr/bin/novnc"

  install -dm755 "$pkgdir/usr/share/webapps/novnc"
  cp -a app core po vendor vnc.html karma.conf.js package.json vnc_lite.html "$pkgdir/usr/share/webapps/novnc"
}
