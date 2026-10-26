# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>
# Co-Maintainer: Pascal Reeb <pascal@reeb.io>
# Co-Maintainer: Kenneth Shaw <kenshaw at gmail dot com>

pkgname=talosctl-bin
pkgver=1.14.5
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

sha256sums=('cb44b8cfcb73d300f8d50d94f075d68cb072a8ebff6d4d4b6ef5c4355a57dfc0')
sha256sums_x86_64=('ff432b68986709e6b69c563a08a2ced4232d5196b0dccd6d2e783e9d714d7d7d')
sha256sums_aarch64=('dfd3aa33c3159810e216fc39afb685d4d120c8f2728e017d8c7f7635d3139382')
sha256sums_armv7h=('4927d08ddd2430c37bae9ba2c3124da2571b56bdbff454db2cda7649a056a8bf')
sha256sums_riscv64=('e14f17e0b6244dae81984b5fd0ae22212b1bf2824fe36a6fef06b6a699ee68aa')

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
