# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=clang17-bin
pkgver=17.0.6.21
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

sha256sums=('f402f6559563f127f483a19f3e5c253d79ca3f330f0292c5e7f2e0afcfd14a3b'
            'c9c492a50c8bcf90c8c376f75b606f5c47a1355db53396f04a509a0703e7ab70'
            '4cbce218e8950b09a32aafc3427baacd2f65825b7185ba676d6b84886982ac13'
            'cf9fea923df8e79233d703d63f277b5dca4948c198fb7280561f6fe185cb8f89'
            '817153cd4795b2b8265369c6947314b0aa10cf5dbf314f50a05f14962085dd98'
            '7b00188364c7191cbb5cad15b419e816093004eaa92d41b14a83e64bf12d51eb')

package() {
  for _package in "${_packages[@]}"; do
    bsdtar -xOf "${_package}-${_debver}.deb" data.tar.xz | bsdtar -xJf - -C "${pkgdir}"
  done
  mv "${pkgdir}"/usr/lib/x86_64-linux-gnu/* "${pkgdir}"/usr/lib/
  rmdir "${pkgdir}"/usr/lib/x86_64-linux-gnu
  find ${pkgdir} -type f \( -name "*.so" -o -name "*.so.*" \) -exec chmod 0755 {} \;
  patchelf --replace-needed libedit.so.2 libedit.so.0 "${pkgdir}"/usr/lib/libLLVM-17.so.1
  patchelf --replace-needed libz3.so.4 libz3.so.4.13 "${pkgdir}"/usr/lib/libLLVM-17.so.1
  install -Dm644 ${pkgdir}/usr/share/doc/${_packages[0]}/copyright "${pkgdir}"/usr/share/licenses/${_packages[0]}/LICENSE
}
# vim:set ts=2 sw=2 et:
