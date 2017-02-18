# Maintainer: KNOSSOS-Team <knossos-team ät mpimf-heidelberg.mpg.de>

pkgname="qt5-python27-git"
_qtver=5.8.0
pkgver=3.1+115.gb06f864
pkgrel=1
arch=("x86_64")
pkgdesc="PythonQt fork featuring Qt 5.x and Python 3.x support and improved CMake build system (Qt5 and Python2.7 version)"
license=("LGPL")
url="https://github.com/knossos-project/PythonQt"
makedepends=("cmake"
  "git"
  "mesa" # GL/gl.h
  "ninja"
  "qt5-tools" # Qt5UiTools
)
depends=("python2"
  "qt5-declarative" # =$_qtver
  "qt5-multimedia"
  "qt5-svg"
)
provides=("qt5-python27")
replaces=("qt5-python26") # conflicting older versions is the idea
source=("git+https://github.com/knossos-project/PythonQt.git")
md5sums=('SKIP')

pkgver() {
  cd "PythonQt"
  git describe --always --dirty --tags | sed 's/^v//;s/-/+/;s/-/./g'
}

prepare() {
  mkdir -p PythonQt/src/private
}

build() {
  mkdir -p "$srcdir/build-$CHOST-$pkgname"
  cd "$srcdir/build-$CHOST-$pkgname"
  cmake -G Ninja -DCMAKE_BUILD_TYPE=RELEASE -DBUILD_SHARED_LIBS=TRUE -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -DPythonQt_Qt5=TRUE -DPythonQt_Python3=FALSE ../PythonQt
  ninja
}

check() {
  if ! xset q &> /dev/null; then
    echo "no running X Server, skipping tests"
  else
    cd "$srcdir/build-$CHOST-$pkgname"
    ninja tests
  fi
}

package() {
  cd "$srcdir/build-$CHOST-$pkgname"
  ninja install
}
