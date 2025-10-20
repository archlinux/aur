# Maintainer: Andres Morey <andres@kubetail.com>

pkgname=kubetail-cli
pkgver=0.9.0
pkgrel=3
pkgdesc="Real-time logging dashboard for Kubernetes"
arch=('x86_64' 'aarch64')
url="https://github.com/kubetail-org/kubetail"
license=('apache')
makedepends=('go')
depends=()
provides=('kubetail')
conflicts=('kubetail')

source=("https://github.com/kubetail-org/kubetail/releases/download/cli%2Fv${pkgver}/kubetail-cli_${pkgver}.orig.tar.xz")
sha256sums=('a0a4ab9f6aa1c0a3e3e79b9cb1eb0379dd0c84d0d258f4327b509608c93d887a')

build() {
    export GOWORK="off"

    cd "$srcdir/kubetail-cli-$pkgver"

    cd modules/cli
    go build \
      -mod=vendor \
      -ldflags "\
        -s \
        -w \
        -X github.com/kubetail-org/kubetail/modules/cli/cmd.version=${pkgver} \
      " \
      -o ../../bin/kubetail .
}

package() {
  install -Dm755 "${srcdir}/kubetail-cli-$pkgver/bin/kubetail" "${pkgdir}/usr/bin/kubetail"

  "${pkgdir}/usr/bin/kubetail" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kubetail"
  "${pkgdir}/usr/bin/kubetail" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kubetail"
}
