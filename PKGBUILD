# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=python-fafclient
pkgver=0.18.9
pkgrel=1
epoch=0
pkgdesc="Forged Alliance Forever - Lobby Client. Community-driven client system for Supreme Commander: Forged Alliance."
url="http://www.faforever.com/"
arch=('any')
license=('GPL3')
groups=()
depends=('python-pyqt5' 'python-sip' 'python-ipaddress' 'python-jsonschema' 'python-semantic-version' 'python-pyqtwebengine' 'python-jinja' 'lib32-libpulse' 'wine>1.6.0' 'xdelta3' 'faf-uid' 'qt5-webengine' 'faf-ice-adapter-java-bin')
makedepends=('python-setuptools')
checkdepends=()
optdepends=()
replaces=('python-fafclient-icetest' 'python2-fafclient-icetest' 'python2-fafclient')
backup=()
options=()
install=
changelog=
source=("git+https://github.com/FAForever/client.git#branch=develop" 'FAForeverPy38.desktop')
sha256sums=('SKIP'
            '2396777ba17ff972db17d458f4ec20e5b2916490ebfff24bbfba169094319dbd')
noextract=()
validpgpkeys=()

pkgver() {
  cd "client"
  git describe --tags | sed -e 's/-/./g'
}

prepare() {
  cd "client"
  mkdir -p fafclient
  mv src fafclient/src
  echo "import src" >> fafclient/__init__.py
}

build() {
  cd "client"
  FAFCLIENT_VERSION=$pkgver python setup.py build
}

package() {
  cd "client"
  FAFCLIENT_VERSION=$pkgver python setup.py install --root="$pkgdir" --optimize=1 
  install -D "$srcdir/FAForeverPy38.desktop" "$pkgdir/usr/share/applications/FAForeverPy38.desktop"
  cp -r "res" "$pkgdir/usr/lib/python3.8/site-packages/fafclient/res"
  echo `expr "$pkgver" : '^\([0-9]\.[0-9][0-9]\.[0-9]*\).*'` > "$pkgdir/usr/lib/python3.8/site-packages/fafclient/res/RELEASE-VERSION"
}
