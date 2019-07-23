# Maintainer: Adrian Petrescu <apetresc at gmail dot com>
# Contributor: algebro <algebro at tuta dot io>

pkgname=leela-zero-git
_pkgname=leela-zero
pkgver=766
pkgrel=6
pkgdesc="Go engine with no human-provided knowledge, modeled after the AlphaGo Zero paper. (next branch)"
arch=('x86_64')
url="https://github.com/leela-zero/leela-zero"
license=('GPLv3')
depends=('glibc' 'zlib' 'openblas' 'boost' 'opencl-driver' 'qt5-base')
makedepends=('git' 'opencl-headers' 'cmake' 'ocl-icd')
provides=('leela-zero')
conflicts=('leela-zero')
install="$pkgname.install"
source=("${_pkgname}::git+https://github.com/leela-zero/leela-zero#branch=next"
        "git+https://github.com/google/googletest.git"
        "git+https://github.com/eigenteam/eigen-git-mirror"
        "weights.txt.gz::http://zero.sjeng.org/best-network")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd $srcdir/${_pkgname}
  git rev-list --count HEAD
}

prepare() {
  gunzip -f weights.txt.gz
  cd $srcdir/${_pkgname}
  git submodule init
  git config submodule.gtest.url "$srcdir"/googletest
  git config submodule.src/Eigen.url "$srcdir"/eigen-git-mirror
  git submodule update gtest src/Eigen
  mkdir -p build
}

build() {
  cd $srcdir/${_pkgname}/build
  cmake ..
  make leelaz
  cd $srcdir/${_pkgname}/autogtp
  qmake
  make
}

check() {
  cd $srcdir/${_pkgname}/build
  make tests
  ./tests
}

package() {
  cd $srcdir/${_pkgname}
  install -Dm755 build/leelaz $pkgdir/usr/bin/leelaz
  install -Dm755 autogtp/autogtp $pkgdir/usr/bin/autogtp
  install -Dm644 $srcdir/weights.txt $pkgdir/usr/share/leela-zero/networks/weights.txt
}
