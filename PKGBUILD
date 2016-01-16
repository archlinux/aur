# Maintainer: Riley Trautman <asonix.dev@gmail.com>
# Contributor: Michael Spencer <sonrisesoftware@gmail.com>

_pkgname=papyros-files
pkgname=$_pkgname-git
pkgver=0.0.4.r41.gf95637c
pkgrel=1
pkgdesc="The file manager for Papyros"
arch=("i686" "x86_64")
url="https://github.com/papyros/files-app"
license=("LGPL")
depends=("qt5-declarative" "qt5-graphicaleffects" "qt5-tools" "qml-material-git"
"taglib" "kdeclarative")
makedepends=("git" "cmake" "intltool" "extra-cmake-modules")
optdepends=('pulseaudio: audio support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/papyros/files-app.git#branch=master")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "$srcdir/$_pkgname" -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

# Additional functions to generate a changelog

changelog() {
  cd "$_pkgname"
  git log $1..HEAD --no-merges --format=" * %s"
}

gitref() {
  cd "$_pkgname"
  git rev-parse HEAD
}
