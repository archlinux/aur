# Maintainer: Ivan Souza <ivanttt54@gmail.com>
# Contributor: Jesus Alvarez <jeezusjr@gmail.com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgver=dev_2023_12

_srcname=Odin
pkgname=odin
pkgver_actual=${pkgver//_/-}
pkgrel=1
pkgdesc="A fast, concise, readable, pragmatic and open sourced programming language."
arch=('x86_64')
url="https://odin-lang.org/"
license=('BSD-2-Clause')
depends=('clang' 'llvm14-libs')
makedepends=('git' 'clang' 'clang14' 'llvm14')
provides=('odin')
conflicts=('odin')
source=("https://github.com/odin-lang/Odin/archive/refs/tags/${pkgver_actual}.tar.gz")
sha256sums=('9c4a39fcfc0fb29e5060a2513931000c0c3ce491f3672faaab1429b07cad0896')

build() {
  cd "${srcdir}/Odin-${pkgver_actual}/"
  export LLVM_CONFIG=llvm-config-14
  export CXX=/usr/lib/llvm14/bin/clang++
  make release
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/${pkgname}"

  cd "${srcdir}/${_srcname}-${pkgver_actual}/"

  cp odin "${pkgdir}/usr/lib/${pkgname}/odin"
  cp -r core "${pkgdir}/usr/lib/${pkgname}/core"
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
