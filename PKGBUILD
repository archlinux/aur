# Maintainer: Adrian Petrescu <apetresc at gmail dot com>
# Contributor: algebro <algebro at tuta dot io>

pkgname=leela-zero
pkgver=0.17
pkgrel=1
pkgdesc="Go engine with no human-provided knowledge, modeled after the AlphaGo Zero paper."
arch=('x86_64')
url="https://github.com/leela-zero/leela-zero"
license=('GPLv3')
depends=('glibc' 'zlib' 'openblas' 'boost' 'opencl-driver' 'qt5-base')
makedepends=('git' 'opencl-headers' 'cmake' 'ocl-icd')
install="$pkgname.install"
source=("${pkgname}::git+https://github.com/leela-zero/leela-zero#tag=v${pkgver}"
        "git+https://github.com/google/googletest.git"
        "git+https://github.com/eigenteam/eigen-git-mirror"
        "weights.txt.gz::http://zero.sjeng.org/best-network")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

prepare() {
  cd $srcdir/$pkgname
  git submodule init
  git config submodule.gtest.url "$srcdir"/googletest
  git config submodule.src/Eigen.url "$srcdir"/eigen-git-mirror
  git submodule update gtest src/Eigen
  mkdir -p build
}

build() {
  cd $srcdir/$pkgname/build
  cmake ..
  make leelaz
  cd $srcdir/$pkgname/autogtp
  qmake
  make
}

check() {
  cd $srcdir/$pkgname/build
  make tests
  ./tests
}

package() {
  cd $srcdir/$pkgname
  install -Dm755 build/leelaz $pkgdir/usr/bin/leelaz
  install -Dm755 autogtp/autogtp $pkgdir/usr/bin/autogtp
  install -Dm644 $srcdir/weights.txt $pkgdir/usr/share/leela-zero/networks/weights.txt
}
