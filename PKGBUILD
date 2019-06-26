# Maintainer: Ulysses R Ribeiro <ulyssesrr@gmail.com>
# Based on the original Arch Linux package by:
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: rudy.matela

pkgname=python2-z3
pkgver=4.8.5
pkgrel=1
pkgdesc='High-performance theorem prover'
url='https://github.com/Z3Prover/z3'
arch=('x86_64')
license=('MIT')
 # 'java-environment-common' 'mono' 'ocaml' 'ocaml-findlib'
makedepends=('cmake' 'python2' 'python2-setuptools' 'gcc-libs' 'gmp' 'ninja')
depends=('python2' 'libz3')
source=(https://github.com/Z3Prover/z3/archive/Z3-${pkgver}.tar.gz)
sha512sums=('ca36e1a0332bd473a64f41dfdb31656fb3486178473e4fd4934dccce109a84c9686c08f94998df74bacb588eb12ea5db25dc17a564ee76f82fd2559349697309')

prepare() {
  cd z3-Z3-${pkgver}
  mkdir -p build
}

build() {
  cd z3-Z3-${pkgver}/build
  cmake .. \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_PYTHON_BINDINGS=1 \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DUSE_LIB_GMP=1
  ninja
}

package_python2-z3() {
  cd z3-Z3-${pkgver}/build
  DESTDIR="${pkgdir}" ninja install
  install -Dm 644 ../LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${pkgdir}"
  rm -r usr/include usr/bin usr/lib/cmake usr/lib/lib*
  #mv usr/lib/python* usr/lib/python2.7
  [ -n "${SOURCE_DATE_EPOCH}" ] && find . -exec touch -h -d @$SOURCE_DATE_EPOCH {} +
  python2 -m compileall .
  python2 -O -m compileall .
}

# vim: ts=2 sw=2 et:
