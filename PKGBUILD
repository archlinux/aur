# Maintainer: Andres Morey <andres@kubetail.com>

pkgname=kubetail-bin
pkgver=0.8.2
pkgrel=3
pkgdesc="Real-time logging dashboard for Kubernetes"
arch=('x86_64' 'aarch64')
url="https://github.com/kubetail-org/kubetail"
license=('apache')
depends=()
provides=('kubetail')
conflicts=('kubetail')

source_x86_64=("https://github.com/kubetail-org/kubetail/releases/download/cli%2Fv${pkgver}/kubetail-linux-amd64")
source_aarch64=("https://github.com/kubetail-org/kubetail/releases/download/cli%2Fv${pkgver}/kubetail-linux-arm64")

sha256sums_x86_64=('67a483791d1f1190801008479c61f39a7346f8b83f5b3086eac931197d676ace')
sha256sums_aarch64=('bfc4a66fc1a0aedace46a69d8fc9dfd9da15039bd5dd03b40ab2116f62d132db')

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
