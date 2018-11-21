# Maintainer: algebro <algebro at tuta dot io>
# Contributor: Adrian Petrescu <apetresc at gmail dot com>

pkgname=leela-zero-amd-git
pkgver=0.16.r13.g8670a40
pkgrel=2
pkgdesc="Go engine with no human-provided knowledge, modeled after the AlphaGo Zero paper. AMD version with OpenCL."
arch=('x86_64')
url="https://github.com/gcp/leela-zero"
license=('GPLv3')
depends=('glibc' 'zlib' 'openblas' 'boost' 'opencl-amd' 'qt5-base')
makedepends=('git' 'opencl-headers' 'cmake' 'ocl-icd')
conflicts=('leela-zero' 'leela-zero-git')
provides=('leela-zero' 'leela-zero-git')
source=("git+https://github.com/gcp/leela-zero#branch=next"
        "git+https://github.com/google/googletest.git"
        "git+https://github.com/eigenteam/eigen-git-mirror"
        "weights.txt.gz::http://zero.sjeng.org/best-network")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd leela-zero
  git describe --long --tags | sed -r 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
}

prepare() {
  cd leela-zero
  git submodule init
  git config submodule.gtest.url "$srcdir"/googletest
  git config submodule.src/Eigen.url "$srcdir"/eigen-git-mirror
  git submodule update gtest src/Eigen
  mkdir -p build
}

build() {
  cd leela-zero/build
  cmake ..
  make leelaz
  cd "$srcdir"/leela-zero/autogtp
  qmake
  make
}

check() {
  cd leela-zero/build
  make tests
  ./tests
}

package() {
  cd leela-zero
  install -Dm755 build/leelaz "$pkgdir"/usr/bin/leelaz
  install -Dm755 autogtp/autogtp "$pkgdir"/usr/bin/autogtp
  install -Dm644 "$srcdir"/weights.txt "$pkgdir"/usr/share/leela-zero/networks/weights.txt
}
