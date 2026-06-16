# Maintainer: Andres Morey <andres@kubetail.com>

pkgname=kubetail-cli
pkgver=0.18.0
pkgrel=1
pkgdesc="Real-time logging dashboard for Kubernetes"
arch=('x86_64' 'aarch64')
url="https://github.com/kubetail-org/kubetail"
license=('apache')
makedepends=('go')
depends=()
provides=('kubetail')
conflicts=('kubetail')

source=("https://github.com/kubetail-org/kubetail/releases/download/cli%2Fv${pkgver}/kubetail-${pkgver}-vendored.tar.gz")
sha256sums=('d75eb044f98b8a3f507d7b08eda109f07346662e7e9f6dfa77a71aa39d4513b5')

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
