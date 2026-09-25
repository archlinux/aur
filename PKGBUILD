# Maintainer: Viktor Danov <orangeleaf12@gmail.com>
# SPDX-License-Identifier: 0BSD
pkgname=uah-bin
pkgver=1.0.2
pkgrel=1
pkgdesc='Terminal coding agent that works like Codex, built on unreal-agent'
arch=('x86_64' 'aarch64')
url='https://github.com/viktordanov/uagent-harness'
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
sha256sums_x86_64=('617ab6d196cb4c2bd03e1d492ae1bf9969b71ea3bf7cb845661514eaffdea2de')
sha256sums_aarch64=('50ed0104fb1e82b90ca7f299d9d028be2c88ef31e3f06a85df70316c5fca5d4a')

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
