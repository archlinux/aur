# Maintainer: Evan Sosenko <razorx@evansosenko.com>

pkgname=sprites-bin
pkgver=2026.11.03
pkgrel=1
pkgdesc="Command-line client for managing Fly.io Sprites"
arch=('x86_64' 'aarch64')
url="https://sprites.dev/"
license=('LicenseRef-Proprietary')
provides=('sprites')
conflicts=('sprites')
options=('!strip' '!debug')
_release=${pkgver//./-}
_download="https://sprites.dev/dl/client/${_release}"
source=('LICENSE')
source_x86_64=("sprite-${_release}-linux-x86_64::${_download}/sprite-linux-x86_64")
source_aarch64=("sprite-${_release}-linux-aarch64::${_download}/sprite-linux-aarch64")
sha256sums=('b0886302042a3e96605770ac26268912fe226da9135dbc5a67740e05e0711bde')
sha256sums_x86_64=('731af477ecf7328fd188c67b3649874c9107b6f0097c25888d0dd17aad823527')
sha256sums_aarch64=('c82c83bfed28e4b67c2c6bf63b0aecb9addc4c568eccb6aef399f21bfcc6d486')

build() {
  local shell
  install -Dm755 "${srcdir}/sprite-${_release}-linux-${CARCH}" "${srcdir}/sprite"
  mkdir -p "${srcdir}/completion-home"
  for shell in bash zsh fish; do
    HOME="${srcdir}/completion-home" "${srcdir}/sprite" completion "$shell" > "${srcdir}/sprite.${shell}" || return 1
  done
}

package() {
  install -Dm755 "${srcdir}/sprite" "${pkgdir}/usr/bin/sprite"
  install -Dm644 "${srcdir}/sprite.bash" "${pkgdir}/usr/share/bash-completion/completions/sprite"
  install -Dm644 "${srcdir}/sprite.zsh" "${pkgdir}/usr/share/zsh/site-functions/_sprite"
  install -Dm644 "${srcdir}/sprite.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/sprite.fish"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
