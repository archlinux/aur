# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>
# Co-Maintainer: Pascal Reeb <pascal@reeb.io>
# Co-Maintainer: Kenneth Shaw <kenshaw at gmail dot com>

pkgname=talosctl-bin
pkgver=1.14.7
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

sha256sums=('e27a9541d19d6276c6beb82f7af9cf8638fd40105da04ea8dbbf15a707ad9a35')
sha256sums_x86_64=('823deb86e20d79f08d000b266e63e4bffc772ee80364ce405bad5659bcacfb18')
sha256sums_aarch64=('b5537c9e59ab60c763bee9ab476bf936ecd400799ff670e1f1e8e19182f8233a')
sha256sums_armv7h=('f2300f760adad444b89719bafa049a6dc591f583f89dbaef779a0d684b086cdd')
sha256sums_riscv64=('c9304264a0e5c4bbad044ffe06a4dc23cf048531f991fe7bf6c2703a1221e3b5')

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
