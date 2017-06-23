# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=python2-fafclient
pkgver=0.13.0.rc.13.ge199b14e
pkgrel=1
epoch=0
pkgdesc="Forged Alliance Forever - Lobby Client. Community-driven client system for Supreme Commander: Forged Alliance."
url="http://www.faforever.com/"
arch=('any')
license=('GPL3')
groups=()
depends=('python2-pyqt4>=4.0.0' 'python2-ipaddress' 'python2-enum34' 'python2-py' 'python2-pycparser' 'python2-dateutil' 'python2-requests' 'python2-lupa' 'python2-trueskill' 'python2-cffi' 'python2-marshmallow-jsonapi' 'python2-semantic-version' 'python2-faftools' 'lib32-libpulse' 'wine>1.6.0' 'xdelta3' 'faf-uid')
makedepends=('python2-setuptools' 'python2-pathlib' 'python2-glob2')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/FAForever/client.git#branch=develop" 'FAForever.desktop')
sha256sums=('SKIP'
            'd2b49457654a529dfae2fe260cb6ce8d1a8d20add685fdcb0ec8ed42e0400bac')
noextract=()
validpgpkeys=()

pkgver() {
  cd "client"
  git describe --tags | sed -e 's/-/./g'
}
prepare() {
  cd "client"
  mkdir fafclient
  mv src fafclient/client
  echo "import client" >> fafclient/__init__.py
}

build() {
  cd "client"
  FAFCLIENT_VERSION=$pkgver python2 setup.py build
}

package() {
  cd "client"
  FAFCLIENT_VERSION=$pkgver python2 setup.py install --root="$pkgdir" --optimize=1 
  install -D "$srcdir/FAForever.desktop" "$pkgdir/usr/share/applications/FAForever.desktop"
  cp -r "res" "$pkgdir/usr/lib/python2.7/site-packages/fafclient/res"
  echo `expr "$pkgver" : '^\([0-9]\.[0-9][0-9]\.[0-9]*\).*'` > "$pkgdir/usr/lib/python2.7/site-packages/fafclient/res/RELEASE-VERSION"
}
