# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>
# Co-Maintainer: Pascal Reeb <pascal@reeb.io>
# Co-Maintainer: Kenneth Shaw <kenshaw at gmail dot com>

pkgname=talosctl-bin
pkgver=1.14.3
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

sha256sums=('2488496631b4428ae06f4575f9f3ac58324aee1ce50dd44c80b1a7eae26f93be')
sha256sums_x86_64=('a81b58b5d30af849cb5565a13fbd4bb3ca6b623881fa15c4244c890081684d7b')
sha256sums_aarch64=('4ee491f125b88a262d8879fb1dcfa8bf211fecfd624bb5786588aa157326a14d')
sha256sums_armv7h=('c3c3d42f6adf4592acc359e8b6cf6665f86a6e569a0a0bfbe1b2db88425be81c')
sha256sums_riscv64=('d73b495f74ec428217a3bd9a593d296235c695da79fa8bcf0ea8e40e83de8e66')

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
