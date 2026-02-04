# Maintainer: Andres Morey <andres@kubetail.com>

pkgname=kubetail-bin
pkgver=0.11.1
pkgrel=1
pkgdesc="Real-time logging dashboard for Kubernetes"
arch=('x86_64' 'aarch64')
url="https://github.com/kubetail-org/kubetail"
license=('apache')
depends=()
provides=('kubetail')
conflicts=('kubetail')

source_x86_64=("https://github.com/kubetail-org/kubetail/releases/download/cli%2Fv${pkgver}/kubetail-linux-amd64")
source_aarch64=("https://github.com/kubetail-org/kubetail/releases/download/cli%2Fv${pkgver}/kubetail-linux-arm64")

sha256sums_x86_64=('013f7a4db526826b6ff39e0f7fe9356b0c1bff13a2ebf9740eaf47ab115f61b2')
sha256sums_aarch64=('60f0e82d328c3e149fd7245d54b12d653f64a0d11f214c884f94279d1a5eb9a5')

package() {
  # Map Arch → filename in release assets
  local _bin
  case "$CARCH" in
    x86_64)  _bin="kubetail-linux-amd64" ;;
    aarch64) _bin="kubetail-linux-arm64" ;;
    *) echo "Unsupported arch: $CARCH" >&2; return 1 ;;
  esac

  install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/usr/bin/kubetail"

  "${pkgdir}/usr/bin/kubetail" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kubetail"
  "${pkgdir}/usr/bin/kubetail" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kubetail"
}
