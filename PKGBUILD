# Maintainer: Tom Hale <tom at hale dot ee>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164  # var unused / var not assigned / cd without || exit
_pkgname=ostt
pkgname=ostt-vulkan-bin-release-git
pkgver=0.0.25
pkgrel=1
pkgdesc='Terminal-native speech-to-text with Vulkan GPU acceleration (latest Git binary release)'
arch=('x86_64')
url="https://github.com/kristoferlund/${_pkgname}"
license=('MIT')
depends=('alsa-lib' 'ffmpeg' 'openssl' 'vulkan-icd-loader')
optdepends=(
  'wl-clipboard: Wayland clipboard support'
  'xclip: X11 clipboard support'
)
conflicts=('ostt' ostt-{cuda,vulkan} ostt-{cuda,vulkan}-bin 'ostt-cuda-bin-release-git')
provides=('ostt' 'ostt-vulkan')
options=('!strip')
source=(
  "${_pkgname}-vulkan.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu-vulkan.tar.gz"
  "LICENSE::${url}/raw/v${pkgver}/LICENSE"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  git ls-remote --tags "${url}.git" | grep -oP 'refs/tags/v\K[0-9]+\.[0-9]+\.[0-9]+$' | sort -V | tail -1
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Generate and install shell completions
  for _shell in bash zsh fish; do
    if _comp=$("${srcdir}/${_pkgname}" "completions" "${_shell}" 2>/dev/null); then
      install -Dm644 /dev/stdin "${pkgdir}/usr/share/${_shell}/completions/${_pkgname}" <<< "${_comp}"
    fi
  done
}
# vim:set ts=2 sw=2 et ft=PKGBUILD:
