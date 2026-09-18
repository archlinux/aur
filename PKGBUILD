# Maintainer: Kenneth Shaw <kenshaw at gmail dot com>
# Maintainer: codekoala <arch@cloudlery.com>


pkgname=omnictl-bin
pkgver=1.12.1
pkgrel=1
pkgdesc="CLI for Omni - SaaS-simple Kubernetes management platform by Sidero Labs"
arch=('x86_64' 'aarch64')
url="https://github.com/siderolabs/omni"
license=('BUSL-1.1')
provides=('omnictl')
conflicts=('omnictl')

source=("omni-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("omnictl-${pkgver}::${url}/releases/download/v${pkgver}/omnictl-linux-amd64")
source_aarch64=("omnictl-${pkgver}::${url}/releases/download/v${pkgver}/omnictl-linux-arm64")

sha256sums=('f5d19eb8ad5e3c1274fe22270be5603438512c343776927fa4b6e933a7f9ebee')
sha256sums_x86_64=('fd97de17981e4444efaeeae23cca8c5520bcd37a598e38227afe835038ef6860')
sha256sums_aarch64=('fd97de17981e4444efaeeae23cca8c5520bcd37a598e38227afe835038ef6860')

check() {
  chmod +x "omnictl-${pkgver}"
  "./omnictl-${pkgver}" --version
}

package() {
  install -Dm755 "omnictl-${pkgver}" "${pkgdir}/usr/bin/omnictl"
  install -Dm644 "omni-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/$pkgname"
  install -Dm644 "omni-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/$pkgname"

  # Generate and install shell completions
  install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
  install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"

  "${pkgdir}/usr/bin/omnictl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/omnictl"
  "${pkgdir}/usr/bin/omnictl" completion zsh  | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_omnictl"
  "${pkgdir}/usr/bin/omnictl" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/omnictl.fish"
}
