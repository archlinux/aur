# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=python-fafclient
pkgver=0.17.2
pkgrel=1
epoch=0
pkgdesc="Forged Alliance Forever - Lobby Client. Community-driven client system for Supreme Commander: Forged Alliance."
url="http://www.faforever.com/"
arch=('any')
license=('GPL3')
groups=()
depends=('python-pyqt5' 'python-ipaddress' 'python-jsonschema' 'python-semantic-version' 'lib32-libpulse' 'wine>1.6.0' 'xdelta3' 'faf-uid' 'qt5-webengine' 'qt5-multimedia')
makedepends=('python-setuptools' 'git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=('python2-fafclient')
backup=()
options=()
install=
changelog=
source=("git+https://github.com/FAForever/client.git" 'FAForeverPy36.desktop')
sha256sums=('SKIP'
            'cf43a921938364ff0c07f7e79c259016cdd09523e277ce50d7983d38d625cf1c')
noextract=()
validpgpkeys=()

pkgver() {
  cd "client"
  git describe --tags --abbrev=0 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
  cd "client"
  git checkout `git describe --tags --abbrev=0`
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
  install -D "$srcdir/FAForeverPy36.desktop" "$pkgdir/usr/share/applications/FAForeverPy36.desktop"
  cp -r "res" "$pkgdir/usr/lib/python3.6/site-packages/fafclient/res"
  echo `git describe --tags --abbrev=0` > "$pkgdir/usr/lib/python3.6/site-packages/fafclient/res/RELEASE-VERSION"
}
