# Maintainer: Tom Hale <tom at hale dot ee>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164  # var unused / var not assigned / cd without || exit

pkgname=parakeet.cpp-vulkan-bin-release-git
pkgver=0.3.2
pkgrel=1
pkgdesc='Fast on-device ASR using NVIDIA Parakeet models via ggml (prebuilt Vulkan binary, latest Git release)'
arch=('x86_64')
url='https://github.com/mudler/parakeet.cpp'
license=('MIT')
depends=('vulkan-icd-loader')
makedepends=('git' 'curl')
provides=('parakeet.cpp')
conflicts=('parakeet.cpp' 'parakeet.cpp-git' 'parakeet.cpp-bin' 'parakeet.cpp-release-git')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  # Release tag only; binary archive URL is derived from this clean version.
  git describe --tags --abbrev=0 2>/dev/null | sed 's/^v//'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git reset --hard "$(git describe --tags --abbrev=0)"

  # Download the prebuilt Vulkan binary release archive derived from pkgver.
  # Option D: binary asset fetched dynamically; git source is only for version tracking.
  local _ver="${pkgver}"
  local _archive="parakeet-v${_ver}-bin-linux-vulkan-x64.tar.gz"
  local _dlurl="${url}/releases/download/v${_ver}/${_archive}"
  curl -fL "${_dlurl}" -o "${srcdir}/${_archive}"
  tar -xzf "${srcdir}/${_archive}" -C "${srcdir}"
}

package() {
  local _bindir="${srcdir}/parakeet-v${pkgver}-bin-linux-vulkan-x64"
  install -Dm755 "${_bindir}/parakeet-cli" "${pkgdir}/usr/bin/parakeet-cli"
  install -Dm644 "${_bindir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${_bindir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et ft=PKGBUILD: