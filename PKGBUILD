# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=clang17-bin
pkgver=17.0.6.21+b1
pkgrel=2
pkgdesc="C, C++ and Objective-C compiler - sourced from Debian sid"
arch=(x86_64)
options=(!strip)
provides=("clang=17" clang17)
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

sha256sums=('92ff3fe50d7c12fc4f5f5e5123ec8da966ca98956757f55b1e4afe4e1d5ad5de'
            '441a5dca36a81af5a5d3b0f1cebaae7bca7b856b0d23b53236b182e95321ff4c'
            '4b9eae559e5eafea9b10c20cd6859ab303a0b986e0647a1c6616a74797591594'
            'bbadc165401ffe416641d33299f58b693ef2539ba6e472e7b4f0b8d4c08d2a22'
            '24f366192fe0f626198775a097ce7f34532df29c0ca548f3b3650462b9b1837a'
            'ee97f351948f3f7e5600a76c230646fdf3b691992d822c47d7cfb88cdf3c1a73')

prepare() {
  rm -rf _pkg && mkdir -p _pkg
  for _package in "${_packages[@]}"; do
    bsdtar -xOf "${_package}-${_debver}.deb" data.tar.xz | bsdtar -xJf - -C _pkg
  done
  mv _pkg/usr/lib/x86_64-linux-gnu/* _pkg/usr/lib/
  rmdir _pkg/usr/lib/x86_64-linux-gnu
}

build() {
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
