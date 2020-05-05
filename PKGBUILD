# Maintainer: Artem Klevtsov <a.a.klevtsov@gmail com>

_pkgbase=fancon
pkgname=fancon-git
pkgver=0.20.1.r3.gbebdfc8
pkgrel=1
pkgdesc="A Linux fan control daemon"
arch=('x86_64')
url="https://github.com/hbriese/${_pkgbase}"
license=('Apache')
provides=("${_pkgbase}")
depends=('lm_sensors' 'boost-libs' 'protobuf' 'libx11' 'grpc')
makedepends=('clang>=9.0' 'cmake>=3.13' 'boost')
source=("${_pkgbase}::git+https://github.com/hbriese/${_pkgbase}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  rm -rf "${srcdir}/${_pkgbase}/build"
  mkdir "${srcdir}/${_pkgbase}/build"
  cd "${srcdir}/${_pkgbase}/build"
  export CC=clang
  export CXX=clang++
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DNVIDIA_SUPPORT=OFF ..
  make
}

package() {
  cd "${srcdir}/${_pkgbase}/build"
  make DESTDIR="${pkgdir}" install
}
