# Maintainer: Andres Morey <andres@kubetail.com>

pkgname=kubetail-bin
pkgver=0.11.0
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

sha256sums_x86_64=('1185d0a2b7522f4dc6f6a98d42c85b9288b27292e71aaac235a14fdef2003cea')
sha256sums_aarch64=('a869f90d4711f0e32a6917891ee1daa24af42a4a1841d9b8218837bf70f4b122')

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
