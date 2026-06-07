# Maintainer: Tom Hale <tom at hale dot ee>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164
_pkgname=ostt
pkgname=ostt-vulkan-release-bin
pkgver=0.0.20
pkgrel=1
pkgdesc='Terminal-native speech-to-text with Vulkan GPU acceleration'
arch=('x86_64')
url="https://github.com/kristoferlund/${_pkgname}"
license=('MIT')
depends=('alsa-lib' 'ffmpeg' 'openssl' 'vulkan-icd-loader')
optdepends=(
  'wl-clipboard: Wayland clipboard support'
  'xclip: X11 clipboard support'
)
conflicts=('ostt' ostt-{cuda,vulkan} ostt-{cuda,vulkan}-bin 'ostt-cuda-release-bin')
provides=('ostt' 'ostt-vulkan')
options=('!strip')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu-vulkan.tar.gz"
  "${pkgname}-${pkgver}-LICENSE::${url}/raw/v${pkgver}/LICENSE"
)
sha256sums=(
  'df97a08adf83810d9f27bd40456207e99ed53c2cc3e3c066e75730ca5aa4c7f0'
  '8bcb6bd9c06c2cce21a54db8e1455c1aa154275667828f772dd74d03272e65bd'
)

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Generate and install shell completions
  for _shell in bash zsh fish; do
    if _comp=$("${srcdir}/${_pkgname}" "completions" "${_shell}" 2>/dev/null); then
      install -Dm644 /dev/stdin "${pkgdir}/usr/share/${_shell}/completions/${_pkgname}" <<< "${_comp}"
    fi
  done
}
# vim:set ts=2 sw=2 et ft=PKGBUILD:
