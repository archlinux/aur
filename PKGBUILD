# Maintainer: Adrian Petrescu <apetresc at gmail dot com>
pkgname=leela-zero-git
_pkgname=leela-zero
pkgver=625
pkgrel=1
pkgdesc="Go engine with no human-provided knowledge, modeled after the AlphaGo Zero paper."
arch=('x86_64')
url="https://github.com/gcp/leela-zero"
license=('GPLv3')
depends=('glibc' 'zlib' 'libopenblas' 'boost' 'opencl-nvidia' 'qt5-base')
makedepends=('git' 'opencl-headers' 'cmake' 'ocl-icd')
conflicts=('leela-zero')
install="$pkgname.install"
source=("git+https://github.com/gcp/leela-zero#branch=next")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git rev-list --count HEAD
}

prepare() {
  cd ${srcdir}/${_pkgname}
  curl http://zero.sjeng.org/best-network | gunzip > weights_$(pkgver).txt
}

build() {
  cd ${srcdir}/${_pkgname}
  git submodule update --init --recursive
  mkdir -p build && cd build
  cmake .. || return 1
  make leelaz
  cd ../autogtp
  qmake
  make
}

check() {
  cd ${srcdir}/${_pkgname}/build
  make tests
  ./tests
}

package() {
  cd ${srcdir}/${_pkgname}
  install -Dm755 build/leelaz $pkgdir/usr/bin/leelaz
  install -Dm755 autogtp/autogtp $pkgdir/usr/bin/autogtp
  install -Dm644 weights_$pkgver.txt $pkgdir/usr/share/leela-zero/networks/weights_$pkgver.txt
}
