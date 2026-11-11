# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>
# Co-Maintainer: Pascal Reeb <pascal@reeb.io>
# Co-Maintainer: Kenneth Shaw <kenshaw at gmail dot com>

pkgname=talosctl-bin
pkgver=1.14.6
pkgrel=1
pkgdesc="talosctl - A modern OS for Kubernetes"
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
url="https://github.com/siderolabs/talos"
license=('MPL-2.0')
provides=('talosctl')
conflicts=('talosctl')
options=(!strip)

source=("talos-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("talosctl-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/talosctl-linux-amd64")
source_aarch64=("talosctl-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/talosctl-linux-arm64")
source_armv7h=("talosctl-${pkgver}-armv7h::${url}/releases/download/v${pkgver}/talosctl-linux-armv7")
source_riscv64=("talosctl-${pkgver}-riscv64::${url}/releases/download/v${pkgver}/talosctl-linux-riscv64")

sha256sums=('7c52caa465e64e04c124be7a7580d34cd7d0ab7a4a257b6785cfc2bb1d626380')
sha256sums_x86_64=('11acde7f7578ffe9cbe6fb8349b34595065f597de0842615982e350b365de987')
sha256sums_aarch64=('fd22e0678d783105646d824c23ee45cf7a57f737edae274ca41376d03a4def65')
sha256sums_armv7h=('ec84023eac9466bc75fa8f01a7e42c38c50c82e978620b71d153ce734108fcad')
sha256sums_riscv64=('118ffca1959e708d89285c49758103aa3a9ae373b65234d18d3a9d98fee49ff9')

check() {
  chmod +x "talosctl-${pkgver}-${CARCH}"
  "./talosctl-${pkgver}-${CARCH}" version --client
}

package() {
  install -Dm755 "talosctl-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/talosctl"
  install -Dm644 "talos-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/$pkgname"
  install -Dm644 "talos-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/$pkgname"

  # Generate and install shell completions
  install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
  install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"

  "${pkgdir}/usr/bin/talosctl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/talosctl"
  "${pkgdir}/usr/bin/talosctl" completion zsh  | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_talosctl"
  "${pkgdir}/usr/bin/talosctl" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/talosctl.fish"
}
