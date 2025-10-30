# Maintainer: Andres Morey <andres@kubetail.com>

pkgname=kubetail-cli
pkgver=0.10.0
pkgrel=1
pkgdesc="Real-time logging dashboard for Kubernetes"
arch=('x86_64' 'aarch64')
url="https://github.com/kubetail-org/kubetail"
license=('apache')
makedepends=('go')
depends=()
provides=('kubetail')
conflicts=('kubetail')

source=("https://github.com/kubetail-org/kubetail/releases/download/cli%2Fv${pkgver}/kubetail-cli.orig.tar.xz")
sha256sums=('2295159a9197eeb9b91a46739644d848b72b10f070f71f6a8629a196af213cb8')

build() {
    export GOWORK="off"

    cd "$srcdir/kubetail-$pkgver"

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
  install -Dm755 "${srcdir}/kubetail-$pkgver/bin/kubetail" "${pkgdir}/usr/bin/kubetail"

  "${pkgdir}/usr/bin/kubetail" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kubetail"
  "${pkgdir}/usr/bin/kubetail" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kubetail"
}
