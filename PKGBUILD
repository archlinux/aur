# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>
# Co-Maintainer: Pascal Reeb <pascal@reeb.io>
# Co-Maintainer: Kenneth Shaw <kenshaw at gmail dot com>

pkgname=talosctl-bin
pkgver=1.14.4
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

sha256sums=('17b5c3b2dd2b318d51ef392aaa4b5ae025b2b0b694884067e54ea90990b9ebde')
sha256sums_x86_64=('0a69e3f9b682c5cd844b78dae305f6056ceb86c5fcc6913dcea78c527ed97cee')
sha256sums_aarch64=('a4430fad81b8dc54d99e0dc7b7ea5d0741b93645bc612cbeadf12855c4ec60bb')
sha256sums_armv7h=('d0452ed2ce9aea2ef5daaab9f450027c1c13bf79bb0466ab5c1a18ab5f940401')
sha256sums_riscv64=('529c414504bcf9777bc5d0af4d3c9eed3bc87f826ea33988b593f3df7818c8ad')

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
