# Maintainer: George Alexiou <goten002@gmail.com>

pkgname=nsc-bin
_pkgname=nsc
pkgver=2.15.0
pkgrel=1
pkgdesc="Tool for creating NATS operator, account and user access configurations (prebuilt binary)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/nats-io/nsc"
license=('Apache-2.0')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!debug')
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("${_pkgname}-${pkgver}-amd64.zip::${_release}/nsc-linux-amd64.zip")
source_aarch64=("${_pkgname}-${pkgver}-arm64.zip::${_release}/nsc-linux-arm64.zip")
source_armv7h=("${_pkgname}-${pkgver}-armv7.zip::${_release}/nsc-linux-armv7.zip")
# From upstream SHA256SUMS-nsc.txt
sha256sums_x86_64=('7d55eda757dc9f233675a3038fcf8779bcda99753b1603f7009fc8537e126b7e')
sha256sums_aarch64=('4556613503e2d3e91c970e2c78f17b3f369a3b987c00aa4ffe95d08ea5059a0c')
sha256sums_armv7h=('1ae3dfc8f3852127e19e51c892d19db550fbbf91088c88e891a1a69eb492f7f0')

build() {
  # Completions; nsc writes a config dir on first run, so keep it out of $HOME.
  local sh
  for sh in bash zsh fish; do
    HOME="${srcdir}/home" XDG_CONFIG_HOME="${srcdir}/home/.config" XDG_DATA_HOME="${srcdir}/home/.local/share" \
      ./nsc completion "$sh" > "nsc.${sh}"
  done
}

package() {
  install -Dm755 nsc -t "${pkgdir}/usr/bin/"
  install -Dm644 nsc.bash "${pkgdir}/usr/share/bash-completion/completions/nsc"
  install -Dm644 nsc.zsh "${pkgdir}/usr/share/zsh/site-functions/_nsc"
  install -Dm644 nsc.fish "${pkgdir}/usr/share/fish/vendor_completions.d/nsc.fish"
}
