# Maintainer: envolution
pkgname=clang17-bin
pkgver=17.0.6.18
pkgrel=1
pkgdesc="C, C++ and Objective-C compiler - sourced from Debian sid"
arch=(x86_64)
options=(!strip)
provides=("clang=${pkgver}" clang17)
depends=(patchelf libedit z3)
url="https://www.llvm.org/"
license=('Apache-2.0-LLVM-Exception')

_packages=(
  clang-17
  libclang1-17t64
  libclang-common-17-dev
  libclang-cpp17t64
  libllvm17t64
  llvm-17-linker-tools
)

_debver="${pkgver%.*}-${pkgver##*.}"
source=()
noextract=()

for package in "${_packages[@]}"; do
  source+=("${package}-${_debver}.deb::http://deb.debian.org/debian/pool/main/l/llvm-toolchain-17/${package}_${_debver}_amd64.deb")
  noextract+=("${package}-${_debver}.deb")
done

sha256sums=('de7aed46e704d46e46ca02ac8ed2f111338993d7c6b02dde23d8621bd3b13900'
            'ec49ef1945b9b6a2b1fe978544af09705a05036b283036a3aaba01dc12908969'
            '86f5e4dfc41055ea3c8d5fe5d4c60dbb9512a854ae9caca198f491a05e9590df'
            'f17e493249e614d5f5db11c60690eefa366f5efbc28d75640a311a570a16ace1'
            '55f9668899c968e790412f1e0a014ae2d9e8beba7f0611841093859064cbe4dc'
            '78c11daa6465b688bd27e7d4489cd732352a80ecc27f521e318b7a8d1ab8a328')

package() {
  for _package in "${_packages[@]}"; do
    bsdtar -xOf "${_package}-${_debver}.deb" data.tar.xz | bsdtar -xJf - -C "${pkgdir}"
  done
  mv "${pkgdir}"/usr/lib/x86_64-linux-gnu/* "${pkgdir}"/usr/lib/
  rmdir "${pkgdir}"/usr/lib/x86_64-linux-gnu
  patchelf --add-rpath /usr/lib/llvm-17/lib "${pkgdir}/usr/bin/clang"*
  ln -s /usr/lib/libz3.so "${pkgdir}"/usr/lib/llvm-17/lib/libz3.so.4
  ln -s /usr/lib/libedit.so "${pkgdir}"/usr/lib/llvm-17/lib/libedit.so.2
  install -Dm644 ${pkgdir}/usr/share/doc/${_packages[0]}/copyright "${pkgdir}"/usr/share/licenses/${_packages[0]}/LICENSE
}
