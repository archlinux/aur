# Maintainer: Ulysses R Ribeiro <ulyssesrr@gmail.com>
# Based on the original Arch Linux package by:
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: rudy.matela

pkgname=python2-z3
pkgver=4.8.4
pkgrel=1
pkgdesc='High-performance theorem prover'
url='https://github.com/Z3Prover/z3'
arch=('x86_64')
license=('MIT')
 # 'java-environment-common' 'mono' 'ocaml' 'ocaml-findlib'
makedepends=('cmake' 'python2' 'python2-setuptools' 'gcc-libs' 'gmp' 'ninja')
depends=('python2' 'libz3')
source=(https://github.com/Z3Prover/z3/archive/z3-${pkgver}.tar.gz)
sha512sums=('4660ba6ab33a6345b2e8396c332d4afcfc73eda66ceb2595a39f152df4d62a9ea0f349b0f9212389ba84ecba6bdae6ad9b62b376ba44dc4d9c74f80d7a818bf4')

prepare() {
  cd z3-z3-${pkgver}
  mkdir -p build
}

build() {
  cd z3-z3-${pkgver}/build
  cmake .. \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_PYTHON_BINDINGS=1 \
    -DPYTHON_EXECUTABLE=/usr/bin/python \
    -DUSE_LIB_GMP=1
  ninja
}

package_python2-z3() {
  cd z3-z3-${pkgver}/build
  DESTDIR="${pkgdir}" ninja install
  install -Dm 644 ../LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${pkgdir}"
  rm -r usr/include usr/bin usr/lib/cmake usr/lib/lib*
  mv usr/lib/python* usr/lib/python2.7
  [ -n "${SOURCE_DATE_EPOCH}" ] && find . -exec touch -h -d @$SOURCE_DATE_EPOCH {} +
  python2 -m compileall .
  python2 -O -m compileall .
}

# vim: ts=2 sw=2 et:
