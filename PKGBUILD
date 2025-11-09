# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=clang17-bin
pkgver=17.0.6.23
pkgrel=1
pkgdesc="C, C++ and Objective-C compiler - sourced from Debian sid"
arch=(x86_64)
options=(!strip)
provides=("clang=17" clang17)
depends=(libxml2-legacy binutils patchelf libedit z3)
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

sha256sums=('8511141c0f09be1a7fb96b45a4bb7089763f43018ac7a34866df5fb7c86d39c3'
            '5340599c3de77126be50b36ae897321290ab5bc414a74bcdefe708318edebeed'
            'd314c7f8fc68c8e5a197e49e69b474c82c580f8fa2e4f076d9e538849185b95c'
            '212f42e4147b8b5b7c95baf85a8788b1fde729bf8da5ff14c47f8c6ab51d9539'
            '898062bbbaa3a6220c02e04cc758a800a7a7c44c8fb04f15c3321be94878824a'
            '1cd1fc8836cc94db5e63a84c4162b910d7e3584099d0e27cedded23ed206489c')

prepare() {
  rm -rf _pkg && mkdir -p _pkg
  for _package in "${_packages[@]}"; do
    bsdtar -xOf "${_package}-${_debver}.deb" data.tar.xz | bsdtar -xJf - -C _pkg
  done
  mv _pkg/usr/lib/$CARCH-linux-gnu/* _pkg/usr/lib/
  rmdir _pkg/usr/lib/$CARCH-linux-gnu
}

build() {
  #  objdump -p /usr/lib/libxml2.so | grep SONAME

  patchelf --replace-needed libedit.so.2 libedit.so _pkg/usr/lib/libLLVM-17.so.1
  patchelf --replace-needed libz3.so.4 libz3.so _pkg/usr/lib/libLLVM-17.so.1
}

package() {
  find _pkg -type f \( -name "*.so" -o -name "*.so.*" \) -exec chmod 0755 {} \;

  #fix symlinks
  cd _pkg/usr/lib
  ln -sf llvm-17/lib/libclang-cpp.so.17 libclang-cpp.so.17
  cd llvm-17/lib
  ln -sf ../../libclang-17.so.17 libclang-17.so.1
  ln -sf ../../libclang-17.so.17 libclang-17.so.17

  cp -r ${srcdir}/_pkg/* ${pkgdir}
  install -Dm644 ${pkgdir}/usr/share/doc/${_packages[0]}/copyright \
    "${pkgdir}"/usr/share/licenses/${_packages[0]}/LICENSE
}
# vim:set ts=2 sw=2 et:
