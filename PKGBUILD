# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubebuilder
pkgdesc="SDK for building Kubernetes APIs"
pkgver=3.11.1
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/kubernetes-sigs/kubebuilder"
license=('apache')
makedepends=(
    'go'
)

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/kubernetes-sigs/kubebuilder/archive/v${pkgver}.tar.gz"
)

sha256sums=(
    "a7d96f6dfcc8ac176076ba7d0939585bce97b18a27728dc3fcd0b06f84a4af3c"
)

build() {
    export GOPATH="$srcdir"/gopath
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=1

    cd "$srcdir/$pkgname-$pkgver"
    make build
}

package() {
    install -D -m0755 "${srcdir}/$pkgname-$pkgver/bin/kubebuilder" "${pkgdir}/usr/bin/kubebuilder"

    "${pkgdir}/usr/bin/kubebuilder" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kubebuilder"
    "${pkgdir}/usr/bin/kubebuilder" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kubebuilder"
}
