# Maintainer: ercpereda
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: envolution
# Contributor: Bastien "neitsab" Traverse <neitsab@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=llama.cpp-vulkan-bin
pkgver=b10453
pkgrel=1
pkgdesc="LLM inference in C/C++ (with Vulkan GPU optimizations) (precompiled Linux binaries)"

url="https://github.com/ggml-org/llama.cpp"
arch=("x86_64")
license=('MIT')

provides=("llama.cpp")
conflicts=("llama.cpp")
depends=('glibc' 'gcc-libs' 'curl' 'vulkan-icd-loader')

backup=("etc/conf.d/llama.cpp" "usr/lib/systemd/system/llama.cpp.service")

source=("README-${pkgver}.md::https://raw.githubusercontent.com/ggml-org/llama.cpp/${pkgver}/README.md"
  "llama.cpp.conf"
  "llama.cpp.service")
source_x86_64=("${pkgname%-bin}-${pkgver}.tgz"::"${url}/releases/download/${pkgver}/llama-${pkgver}-bin-ubuntu-vulkan-x64.tar.gz")
sha256sums=('c65738f44172822a09bf0a6cdc72fee0099ddf8ae734687d7c50f9e863c0b191'
            'e4856f186f69cd5dbfcc4edec9f6b6bd08e923bceedd8622eeae1a2595beb2ec'
            '0377d08a07bda056785981d3352ccd2dbc0387c4836f91fb73e6b790d836620d')
sha256sums_x86_64=('73d52b2626927cb9cb7a5d82b850c52d823ad358d62b77f7376c54e8767a77f9')

package() {
  BIN_FOLDER="llama-${pkgver}"

  # Install everything to /opt/
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -a ${BIN_FOLDER}/* "${pkgdir}/opt/${pkgname}/"

  # Symlink executables to /usr/bin/
  install -dm755 "${pkgdir}/usr/bin/"
  find "${pkgdir}/opt/${pkgname}" -maxdepth 1 -type f -name "llama-*" -execdir ln -sf "/opt/${pkgname}/{}" "${pkgdir}/usr/bin/" \;

  # Install configuration and systemd services
  install -Dm644 "llama.cpp.conf" "${pkgdir}/etc/conf.d/llama.cpp"
  install -Dm644 "llama.cpp.service" "${pkgdir}/usr/lib/systemd/system/llama.cpp.service"

  # Install documentation and licenses
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${BIN_FOLDER}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Remove duplicate LICENSE from /opt to keep it clean
  rm "${pkgdir}/opt/${pkgname}/LICENSE"
}
