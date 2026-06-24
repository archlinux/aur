# Maintainer: Tom Hale <tom at hale dot ee>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164  # var unused / var not assigned / cd without || exit

pkgname=parakeet.cpp-vulkan-bin-release-git
_pkgname=parakeet-cli
pkgver=0.3.2
pkgrel=3
_repo=mudler/parakeet.cpp
pkgdesc='Fast on-device ASR using NVIDIA Parakeet models via ggml (prebuilt Vulkan binary, latest Git release)'
arch=('x86_64')
url="https://github.com/${_repo}"
license=('MIT')
depends=('vulkan-icd-loader')
makedepends=('git')
provides=('parakeet.cpp' 'parakeet.cpp-vulkan')
conflicts=('parakeet.cpp' 'parakeet.cpp-git' 'parakeet.cpp-release-git')
source=()

pkgver() {
  git ls-remote --tags "${url}.git" 'v[0-9]*' \
    | awk '{print $2}' | sed 's|^refs/tags/||' | sort -V | tail -1 \
    | sed 's/^v//'
}

build() {
  cd "${srcdir}"
  curl -sSLO "${url}/releases/download/v${pkgver}/parakeet-v${pkgver}-bin-linux-vulkan-x64.tar.gz"
  tar xf "parakeet-v${pkgver}-bin-linux-vulkan-x64.tar.gz"
}

package() {
  local _bindir="${srcdir}/parakeet-v${pkgver}-bin-linux-vulkan-x64"
  install -Dm755 "${_bindir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_bindir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${_bindir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et ft=PKGBUILD:
