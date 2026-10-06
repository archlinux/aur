# Maintainer: Viktor Danov <orangeleaf12@gmail.com>
# SPDX-License-Identifier: 0BSD
pkgname=uah-bin
pkgver=1.9.11
pkgrel=1
pkgdesc='Terminal coding agent that works like Codex, built on unreal-agent'
arch=('x86_64' 'aarch64')
url='https://github.com/viktordanov/uah'
license=('Apache-2.0')
depends=('bubblewrap')
optdepends=('wl-clipboard: paste images on Wayland'
            'xclip: paste images on X11'
            'git: repository context for the agent')
provides=("uah=${pkgver}")
conflicts=('uah')
options=('!strip' '!debug')
_archive="uah-${pkgver}-${CARCH}-unknown-linux-gnu"
source_x86_64=("${url}/releases/download/v${pkgver}/uah-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/uah-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('01281c61dce8aa82975c05cd2b9e5a51ef2860cb55629f20fd6574c98dc45dc9')
sha256sums_aarch64=('1cb7d95b719570ac5873453256c25a96c6e3c438adc43c00bf5a35af8f53cc75')

build() {
  cd "${_archive}"
  ./uah completion bash > uah.bash
  ./uah completion zsh > _uah
  ./uah completion fish > uah.fish
}

check() {
  cd "${_archive}"
  [[ $(./uah --version) == "uah version v${pkgver}" ]]
  test -s uah.bash
  test -s _uah
  test -s uah.fish
}

package() {
  cd "${_archive}"
  install -Dm755 uah "${pkgdir}/usr/bin/uah"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
  install -Dm644 THIRD_PARTY_NOTICES.md "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.md"
  install -Dm644 uah.bash "${pkgdir}/usr/share/bash-completion/completions/uah"
  install -Dm644 _uah "${pkgdir}/usr/share/zsh/site-functions/_uah"
  install -Dm644 uah.fish "${pkgdir}/usr/share/fish/vendor_completions.d/uah.fish"
}
