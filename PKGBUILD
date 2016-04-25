# Maintainer: neXyon <nexyon at gmail dot com>

pkgname=audi-git
pkgver=0.1.167.ff0740e
pkgrel=1
pkgdesc="Implementation of an automated differentiation system using generalized dual numbers (i.e. truncated Taylor expansions)."
arch=('i686' 'x86_64')
url="https://github.com/darioizzo/audi"
license=('GPL3')
groups=()
depends=('python' 'boost' 'piranha-git')
makedepends=('gcc' 'cmake' 'git')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("git+https://github.com/darioizzo/audi.git")
md5sums=('SKIP')
noextract=()
_gitname="audi"

pkgver() {
  cd $_gitname

  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)

  echo 0.1.$revision.$hash
}

build() {
  mkdir -p build

  cd $_gitname

  git submodule init
  git submodule update

  cd ../build

  cmake ../$_gitname \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DBUILD_PYAUDI=ON \
    -DBUILD_TESTS=OFF || return 1

  make $MAKEFLAGS || return 1
}

package() {
  cd build
  make DESTDIR="$pkgdir" install || return 1
}

