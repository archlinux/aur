# Maintainer: Ivan Souza <ivanttt54@gmail.com>
# Contributor: Jesus Alvarez <jeezusjr@gmail.com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgver=dev_2024_07

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
sha256sums=('3c76fe2baabc4f383563a2760c6536b25475d4ed7cf77101926e2ae101352a0f')

build() {
  cd "${srcdir}/Odin-${pkgver_actual}/"
  export LLVM_CONFIG=llvm-config
  export CXX=/usr/bin/clang++
  make release_native

  # build third-party libs
  make -C vendor/stb/src
  make -C vendor/cgltf/src
  make -C vendor/miniaudio/src
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

  #./odin test tests/core/normal.odin -file -all-packages # I have to fix this because it's failing on the network test
  python tests/core/download_assets.py tests/core/assets # temp fix 
  ./odin test tests/core/speed.odin -o:speed -file -all-packages
  ./odin test tests/vendor -all-packages
  ./odin test tests/internal -all-packages
}
