# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

_pkgname=qtermwidget
pkgname=$_pkgname-git
pkgver=1.4.0.44.g75c0066
pkgrel=1
pkgdesc="A terminal widget for Qt, used by QTerminal"
arch=("x86_64")
url="https://github.com/lxqt/qtermwidget"
# Yep, it's messy when you're talking about licenses
license=("LGPL" "custom:BSD" "custom:Public Domain")
depends=("qt6-base")
makedepends=("git" "cmake" "lxqt-build-tools-git" "qt6-tools"
             "python-pyqt6" "pyqt-builder" "sip" "python-installer")
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
optdepends=(
  'python: PyQt bindings'
)
source=("git+https://github.com/lxqt/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --always | sed "s/-/./g"
}

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/$_pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make

  cd "$srcdir/$_pkgname"/pyqt
  CXXFLAGS="-I$PWD/../lib -I$PWD/../../build/lib" LDFLAGS="-L$PWD/../../build" sip-wheel --verbose --qmake /usr/bin/qmake6
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$_pkgname/README.md" -t "$pkgdir"/usr/share/licenses/$pkgname

  cd "$srcdir/$_pkgname"/pyqt
  python -m installer --destdir="$pkgdir" *.whl
}
