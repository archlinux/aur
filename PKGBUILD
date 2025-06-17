# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=clang17-bin
pkgver=17.0.6.22+b2
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

sha256sums=('22892d7d2af1084131153600611d7abb3a9fa475c28ae36c548fc7fb377b9de5'
            '14d9527b6e2bb50c9707112e0a5cafe145a8e254c17ee27c60f3f5df32952181'
            'ecaffac9fbb23cabc893e682ebaef38d446f8135dc104c2dbd83e21a599f1810'
            '26fc474890552f298eab10986714fff2556181f667e6f1972822b1367e53b325'
            '7a17e701bac905cc71df20abc674b4ee1b08af99b43d4c153628f23c907b8ee2'
            '96a59e532c37864a93238dd89aab193d459c9f23eca4f0d85828417699383fc9')

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
