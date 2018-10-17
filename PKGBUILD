# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=python-fafclient-icetest
pkgver=0.18.22
pkgrel=1
epoch=0
pkgdesc="Forged Alliance Forever - Lobby Client. Community-driven client system for Supreme Commander: Forged Alliance."
url="http://www.faforever.com/"
arch=('any')
license=('GPL3')
groups=()
depends=('python-pyqt5' 'python-ipaddress' 'python-jsonschema' 'python-semantic-version' 'lib32-libpulse' 'wine>1.6.0' 'xdelta3' 'faf-uid' 'qt5-webengine' 'faf-ice-adapter-java')
makedepends=('python-setuptools')
checkdepends=()
optdepends=()
provides=()
conflicts=('')
replaces=('python2-fafclient-icetest')
backup=()
options=()
install=
changelog=
source=("git+https://github.com/muellni/client.git#branch=feature/ice-adapter" 'FAForeverPy37ICE.desktop')
sha256sums=('SKIP'
            '96f296ed235c5d9419f40ff63f8e8ea21c7788073515377a2577e3b98e43b05d')
noextract=()
validpgpkeys=()

pkgver() {
  cd "client"
  git describe --tags | sed -e 's/-/./g'
}

prepare() {
  cd "client"
  mkdir -p fafclientice
  mv src fafclientice/src
  echo "import src" >> fafclientice/__init__.py
}

build() {
  cd "client"
  FAFCLIENT_VERSION=$pkgver python setup.py build
}

package() {
  cd "client"
  FAFCLIENT_VERSION=$pkgver python setup.py install --root="$pkgdir" --optimize=1 
  install -D "$srcdir/FAForeverPy37ICE.desktop" "$pkgdir/usr/share/applications/FAForeverPy37ICE.desktop"
  cp -r "res" "$pkgdir/usr/lib/python3.7/site-packages/fafclientice/res"
  echo `expr "$pkgver" : '^\([0-9]\.[0-9][0-9]\.[0-9]*\).*'` > "$pkgdir/usr/lib/python3.7/site-packages/fafclientice/res/RELEASE-VERSION"
}
