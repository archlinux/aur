# Maintainer: Andres Morey <andres@kubetail.com>

pkgname=kubetail-bin
pkgver=0.10.0
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

sha256sums_x86_64=('bb9c078560e188aa79a1521c2d5b5ab83cc92f578588bccee9515116255edc60')
sha256sums_aarch64=('2c41c4ba799c8eb1f0588c5915daf9ead3870d253b6d249f27633fd3ec7313fa')

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
