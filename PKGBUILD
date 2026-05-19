# Maintainer: ercpereda
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: envolution
# Contributor: Bastien "neitsab" Traverse <neitsab@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=llama.cpp-vulkan-bin
pkgver=b9222
pkgrel=1
pkgdesc="LLM inference in C/C++ (with Vulkan GPU optimizations) (precompiled Linux binaries)"

url="https://github.com/ggml-org/llama.cpp"
arch=("x86_64")
license=('MIT')

provides=("llama.cpp" 'libggml' 'ggml')
conflicts=("llama.cpp" 'libggml' 'ggml')
depends=('glibc' 'gcc-libs' 'curl' 'vulkan-icd-loader')

backup=("etc/conf.d/llama.cpp")

source=("README-${pkgver}.md::https://raw.githubusercontent.com/ggml-org/llama.cpp/${pkgver}/README.md"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.conf"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.service")
source_x86_64=("${pkgname%-bin}-${pkgver}.tgz"::"${url}/releases/download/${pkgver}/llama-${pkgver}-bin-ubuntu-vulkan-x64.tar.gz")
sha256sums=('fdb1441c2e8159956dd50d3dd1634ac9c38edbfbb831b39e47cafeadaacbf0fd'
            'e4856f186f69cd5dbfcc4edec9f6b6bd08e923bceedd8622eeae1a2595beb2ec'
            '0377d08a07bda056785981d3352ccd2dbc0387c4836f91fb73e6b790d836620d')
sha256sums_x86_64=('0960f8d9a651692b6c6c3e4fe30cea8c1e966a9005f97fee7fe630068739dc12')

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
