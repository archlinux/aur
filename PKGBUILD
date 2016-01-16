# Maintainer: Riley Trautman <asonix.dev@gmail.com>
# Contributor: Michael Spencer <sonrisesoftware@gmail.com>

pkgname=papyros-files
pkgver=0.1.0
pkgrel=1
pkgdesc="The file manager for Papyros"
arch=("i686" "x86_64")
url="https://github.com/papyros/files-app"
license=("LGPL")
depends=("qt5-declarative" "qt5-graphicaleffects" "qt5-tools" "qml-material-git"
"taglib" "kdeclarative")
makedepends=("git" "cmake" "intltool" "extra-cmake-modules")
optdepends=('pulseaudio: audio support')
provides=("$pkgname")
source=("$pkgname::git+https://github.com/papyros/files-app.git#branch=master")
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "$srcdir/$pkgname" -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

# Additional functions to generate a changelog

changelog() {
  cd "$pkgname"
  git log $1..HEAD --no-merges --format=" * %s"
}

gitref() {
  cd "$pkgname"
  git rev-parse HEAD
}
