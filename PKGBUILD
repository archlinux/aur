# Maintainer: Olivier Mehani <shtrom+aur@ssji.net>
pkgname=python2-libpebble-git
pkgver=r162.e935e9a
pkgrel=1
_python2ver=2.7
pkgdesc="Python library to interact with the Pebble smartwatch"
arch=(any)
url="https://github.com/Hexxeh/libpebble"
license=('custom')
depends=(python2-pyserial python2-sh python2-websocket-client-pebble lib-lightblue bluez-utils)
makedepends=(python2)
source=(${pkgname}::git+https://github.com/Hexxeh/libpebble.git)
md5sums=(SKIP)
conflicts=(python2-libpebble)

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  find . -name '*.py' -exec sed -i "1s/python\s*$/python2/" {} \;
  find pebble/ -name '*.py' -exec python2 -O -m py_compile {} \;
}

package() {
  cd "$srcdir/$pkgname"
  
  install -d $pkgdir/usr/lib/python${_python2ver}/site-packages/
  cp -r pebble/ $pkgdir/usr/lib/python${_python2ver}/site-packages/
  install -D pebble.py $pkgdir/usr/bin/pebble
  install -D LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -D README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}

# vim: sw=2
