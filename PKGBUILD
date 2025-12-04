# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=clang17-bin
pkgver=17.0.6.23+b1
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

sha256sums=('bad63be67eb1b7cb171ae585e72f76cc7b64e5cc21376c0496cb95d12c1e3e0d'
            '8ebc0c26bc646ede4dd4cf4543d315956fbc357c8a9262a6912f358b41984b68'
            'bb5597206243083ce606de30f69ede087573240e5e3fe63d5ce40d3f5085b7c5'
            'adc867ab0ec04ef8eb5c27c6d96bcc3dba6f619c04160a208b77a2c11edb593e'
            '9300e59660b9da93d9095160ce5a42b4f8793b2263f9c0a5e93e20171d283ba3'
            '1655549df73a4bb9a14f1fe141644b1cb3fcb20ca33aa4412325c79c8645af1b')

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
