# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=clang17-bin
pkgver=17.0.6.20+b2
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

sha256sums=('2810e48c1a23c376447280da9feeec2f14428e465ba1817042938d563c8b59d5'
            'ebab9a4bd6240251462a136de25c8e630ea4e21e5245fd5ccbe86b261c48414a'
            '70895f93c7821b94f004933c182d3158a8dbf935fa9f6f7187f66f899154eed3'
            '8246639006356b1eb2e2c2c21075bc7d9f513587ea8ba1b062532292e4a29986'
            '6f0faa44e56d54785b1a112c326a937ea0c6a1b6f71b6bfcbe816710fa99011b'
            '7fc9987571439336b535a00a18d3119b501064a7834ff2ec894c4635392c48e0')

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
