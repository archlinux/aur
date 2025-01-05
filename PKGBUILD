# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=clang17-bin
pkgver=17.0.6.20
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

sha256sums=('47b088ca70bc8aeaab82a6c64c51b6acf44100324640ede1702ecb007c871c2e'
            '18dac1ffc755b4e56f3b5640c0fc8a28bf13bd0957fca1078d151c61f7ad91c0'
            'b6951e1e122f757ef44f1896eba25d07caa54769812b6ad314280c4c0159b7cc'
            '5cbc5721d6dc7a77ec8526fe7776449436769a7c6f084650b45c497441e99eb0'
            'd9faf1668060b60c4f497f02561c08983545d4fe6f69d8c29553e31f7f09b1d6'
            '8f0ba3faa561559b7f23fff3047700055b15ed77e0dc947af52a07f86c3d0cae')

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
