# Maintainer: Kenneth Shaw <kenshaw at gmail dot com>
# Maintainer: codekoala <arch@cloudlery.com>


pkgname=omnictl-bin
pkgver=1.12.4
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

sha256sums=('23f0f4b5507e68e1a63e211105233e4a9fcd5787719210d6a9a4a5dac08d787d')
sha256sums_x86_64=('12b7498895ec79ac584e2ffc05f7918b9d5e987a3442be5d49525b431c7f0958')
sha256sums_aarch64=('12b7498895ec79ac584e2ffc05f7918b9d5e987a3442be5d49525b431c7f0958')

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
