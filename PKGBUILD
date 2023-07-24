# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubeshark
pkgdesc="Kubeshark is an API Traffic Analyzer for Kubernetes."
pkgver=41.3
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/kubeshark/kubeshark"
license=('apache')
makedepends=(
    'go'
)

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/kubeshark/kubeshark/archive/${pkgver}.tar.gz"
)

sha256sums=(
    "2aa777e4f2718353937f993e47b247dc1c3c5aee215956e8cad5616baf94e3c1"
)

build() {
    export GOPATH="$srcdir"/gopath
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=1

    cd "$srcdir/$pkgname-$pkgver"

    platform=$(go version | sed -r 's/go version go.+\s(.+)/\1/' | sed -e 's/\//-/g')

    go build ${GCLFAGS} \
      -ldflags="\
        -X 'github.com/kubeshark/kubeshark/misc.GitCommitHash=' \
        -X 'github.com/kubeshark/kubeshark/misc.Branch=' \
        -X 'github.com/kubeshark/kubeshark/misc.Platform=${platform}' \
        -X 'github.com/kubeshark/kubeshark/misc.Ver=${pkgver}' \
        -s -w" \
      -o bin/kubeshark kubeshark.go
}

package() {
    install -D -m0755 "${srcdir}/$pkgname-$pkgver/bin/kubeshark" "${pkgdir}/usr/bin/kubeshark"

    "${pkgdir}/usr/bin/kubeshark" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kubeshark"
    "${pkgdir}/usr/bin/kubeshark" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kubeshark"
}
