# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=python-fafclient
pkgver=0.13.2.28.g6c6021fa
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
            '4b748a04d4d37744ff7ba81101d4ac08bd26daeea06df87fc7e1b55205931eca')
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
  install -D "$srcdir/FAForeverPy36.desktop" "$pkgdir/usr/share/applications/FAForeverPy36.desktop"
  cp -r "res" "$pkgdir/usr/lib/python3.6/site-packages/fafclient/res"
  echo `expr "$pkgver" : '^\([0-9]\.[0-9][0-9]\.[0-9]*\).*'` > "$pkgdir/usr/lib/python3.6/site-packages/fafclient/res/RELEASE-VERSION"
}
