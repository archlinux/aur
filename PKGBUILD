# Maintainer: Eugene Aslanov <aslanov.ev at gmail dot com>

pkgname=kawpowminer-git
_pkgname=kawpowminer
pkgver=r14409.632f6ea0a
pkgrel=1
pkgdesc="kawpow miner with OpenCL, CUDA and stratum support"
arch=('x86_64')
url="https://github.com/RavenCommunity/kawpowminer"
license=('GPL3')
depends=('cuda')
makedepends=('cmake' 'gcc9' 'perl' 'git')
provides=('kawpowminer')
conflicts=()
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
        cd "$srcdir/${pkgname%-git}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd "$_pkgname"
  git submodule update --init --recursive
  mkdir -p build
  export CC=/usr/bin/gcc-9
  export CXX=/usr/bin/g++-9
  cmake \
        -B build -S . \
        -DAPICORE:BOOL='ON' \
        -DETHASHCL:BOOL='ON' \
        -DETHASHCUDA:BOOL='ON' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
  cmake --build build
}

package() {
  cd "$_pkgname/build"
  make DESTDIR=$pkgdir install
}
