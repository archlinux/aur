# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=clang17-bin
pkgver=17.0.6.22+b1
pkgrel=1
pkgdesc="C, C++ and Objective-C compiler - sourced from Debian sid"
arch=(x86_64)
options=(!strip)
provides=("clang=17" clang17)
depends=(libxml2-2.13 binutils patchelf libedit z3)
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

sha256sums=('44599f224260d27dfc904c621b074e87323645ca24674fcb1ff6a97bb666d299'
            'c2ddbe47b8ea8636044052d508498d53e4287985e88cbe4e505fcb85c260ba4c'
            '782cbff8d3270a17a78ef982ea68d1d38cba65328448b60ac7393c63cf7303d1'
            'dfb14e1f287e358b3e4660cb2720c05ce743d60681a4c10ddf321cc52c49d223'
            '917f9e94260263c70eb76124d8af1ed087cdbf471ecb7e99137db9a27bfb0582'
            'e87ff84bb1c52f1247936091da0585c164c68444bcd9d171d83901628ab1a98d')

prepare() {
  rm -rf _pkg && mkdir -p _pkg
  for _package in "${_packages[@]}"; do
    bsdtar -xOf "${_package}-${_debver}.deb" data.tar.xz | bsdtar -xJf - -C _pkg
  done
  mv _pkg/usr/lib/x86_64-linux-gnu/* _pkg/usr/lib/
  rmdir _pkg/usr/lib/x86_64-linux-gnu
}

build() {
#  objdump -p /usr/lib/libxml2.so | grep SONAME

  patchelf --replace-needed libedit.so.2 libedit.so _pkg/usr/lib/libLLVM-17.so.1
  patchelf --replace-needed libz3.so.4   libz3.so   _pkg/usr/lib/libLLVM-17.so.1
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
