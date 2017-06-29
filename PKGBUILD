# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=python-fafclient
pkgver=0.13.1.rc.1.25.g0bc6d35d
pkgrel=1
epoch=0
pkgdesc="Forged Alliance Forever - Lobby Client. Community-driven client system for Supreme Commander: Forged Alliance."
url="http://www.faforever.com/"
arch=('any')
license=('GPL3')
groups=()
depends=('python-pyqt5' 'python-ipaddress' 'python-py' 'python-pycparser' 'python-dateutil' 'python-requests' 'python-lupa' 'python-trueskill' 'python-cffi' 'python-marshmallow-jsonapi' 'python-semantic-version' 'python-faftools' 'lib32-libpulse' 'wine>1.6.0' 'xdelta3' 'faf-uid')
makedepends=('python-setuptools')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/FAForever/client.git#branch=474-feature-py3" 'FAForeverPy36.desktop')
sha256sums=('SKIP'
            '09a99ecf8aadaea6d2d45d2e7c3b28e7b42e270117f6c0f0cde80c3fc1cb8b9b')
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
  FAFCLIENT_VERSION=$pkgver python setup.py build
}

package() {
  cd "client"
  FAFCLIENT_VERSION=$pkgver python setup.py install --root="$pkgdir" --optimize=1 
  install -D "$srcdir/FAForeverPy36.desktop" "$pkgdir/usr/share/applications/FAForeverPy36.desktop"
  cp -r "res" "$pkgdir/usr/lib/python3.6/site-packages/fafclient/res"
  echo `expr "$pkgver" : '^\([0-9]\.[0-9][0-9]\.[0-9]*\).*'` > "$pkgdir/usr/lib/python3.6/site-packages/fafclient/res/RELEASE-VERSION"
}
