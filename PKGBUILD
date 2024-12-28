# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=clang17-bin
pkgver=17.0.6.19
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

for _package in "${_packages[@]}"; do
  source+=("${_package}-${_debver}.deb::http://deb.debian.org/debian/pool/main/l/llvm-toolchain-17/${_package}_${_debver}_amd64.deb")
  noextract+=("${_package}-${_debver}.deb")
done

sha256sums=('f06f1dfdfb53e23f0d3da7a69f475eb4431f99b5c477567a3674e28e908c532f'
            'cbb479691ad9913c3ac908dde2dbef11f7f0035c3d5fd4ad236731327333e0d4'
            'bcf5d1c7071f6db65086621e1da5dcd9e1e97ebcddfa82e934f1c09d041f83a2'
            'b1e916d93f3f2286384d86e5ac6f2c04538a91707600aacbc038936f726920ca'
            '00369b106763c1f95e73ef208b61a4559e2f7d8ca9836fabba6410b267d8b9da'
            '369f3f9fe220d8dbc6bfaff9231e0eeab192489307fddc3c59185c8599e0684a')

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
# vim:set ts=2 sw=2 et:
