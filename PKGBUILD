# Maintainer: Ivan Souza <ivanttt54@gmail.com>
# Contributor: Jesus Alvarez <jeezusjr@gmail.com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgver=dev_2024_03

_srcname=Odin
pkgname=odin
pkgver_actual=${pkgver//_/-}
pkgrel=1
pkgdesc="A fast, concise, readable, pragmatic and open sourced programming language."
arch=('x86_64')
url="https://odin-lang.org/"
license=('BSD-2-Clause')
depends=('clang' 'llvm-libs')
makedepends=('git' 'clang' 'llvm' 'python')
options=('staticlibs')
provides=('odin')
conflicts=('odin')
source=("https://github.com/odin-lang/Odin/archive/refs/tags/${pkgver_actual}.tar.gz")
sha256sums=('8ad9d5ed4cee910ce52a7b6025879e86d64c78c5e82e865b60bf38773b118aaa')

build() {
  cd "${srcdir}/Odin-${pkgver_actual}/"
  export LLVM_CONFIG=llvm-config
  export CXX=/usr/bin/clang++
  make release_native
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/${pkgname}"

  cd "${srcdir}/${_srcname}-${pkgver_actual}/"

  cp odin "${pkgdir}/usr/lib/${pkgname}/odin"
  cp -r base "${pkgdir}/usr/lib/${pkgname}/base"
  cp -r core "${pkgdir}/usr/lib/${pkgname}/core"
  cp -r shared "${pkgdir}/usr/lib/${pkgname}/shared"
  cp -r vendor "${pkgdir}/usr/lib/${pkgname}/vendor"

  ln -s "/usr/lib/${pkgname}/odin" "${pkgdir}/usr/bin/odin"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 PROPOSAL-PROCESS.md "${pkgdir}/usr/share/doc/${pkgname}/PROPOSAL-PROCESS.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
  cd "${srcdir}/Odin-${pkgver_actual}/"
  ./odin check examples/all -strict-style

  cd tests/core
  make

  cd ../internal
  make
}
