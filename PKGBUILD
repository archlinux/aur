# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubeshark
pkgdesc="Kubeshark is an API Traffic Analyzer for Kubernetes."
pkgver=50.4
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
    "334a28382a800f0d2f6c934f04b6f0e826cbe3f96a52e052f2cef877a5319e15"
)

build() {
    export GOPATH="$srcdir"/gopath
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=1

    cd "$srcdir/$pkgname-$pkgver"

    platform=$(go env GOOS)-$(go env GOARCH)

    go build ${GCLFAGS} \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags="\
        -linkmode=external \
        -buildid=''
        -extldflags=\"${LDFLAGS}\" \
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
