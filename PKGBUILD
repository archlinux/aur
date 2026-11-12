# Maintainer: agony <27015 at riseup dot net>

pkgname=opencrabs-bin
pkgver=0.5.15
pkgrel=1
pkgdesc='Autonomous, self-improving AI agent in a single Rust binary (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/opencrabs/opencrabs'
license=('MIT')
depends=('glibc' 'libgcc' 'libgomp' 'libstdc++' 'openssl-3')
optdepends=('rtk: filter shell command output to save tokens')
provides=("opencrabs=${pkgver}")
conflicts=('opencrabs')
install=opencrabs.install
_release="${url}/releases/download/v${pkgver}"
source=("opencrabs-${pkgver}-LICENSE.md::https://raw.githubusercontent.com/opencrabs/opencrabs/v${pkgver}/LICENSE.md")
source_x86_64=("${_release}/opencrabs-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${_release}/opencrabs-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('f996b971825089bcd77a5dedda20ecfe7f0bd44f73238caa8467a21c1ed4e44c')
sha256sums_x86_64=('5b261d86e06c281862029fe797d851a6b60f4f6a5a775e9b1d994ce5ba5cd7e4')
sha256sums_aarch64=('ae0a5d3db06b51071e06fd8f15477245d2b4c241f67b58e51d57b62e41ebdeeb')

_home_env() {
  export HOME="${srcdir}/home"
  export XDG_CONFIG_HOME="${HOME}/.config"
  export XDG_DATA_HOME="${HOME}/.local/share"
  mkdir -p "${HOME}"
}

build() {
  _home_env
  for shell in bash fish zsh; do
    ./opencrabs completions "${shell}" > "completion.${shell}"
  done
}

package() {
  install -Dm755 opencrabs -t "${pkgdir}/usr/bin"
  install -Dm644 opencrabs.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 opencrabs.png -t "${pkgdir}/usr/share/pixmaps"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/opencrabs"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/opencrabs.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_opencrabs"
  install -Dm644 "opencrabs-${pkgver}-LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
