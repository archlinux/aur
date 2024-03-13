# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubeshark
pkgdesc="Kubeshark is an API Traffic Analyzer for Kubernetes."
pkgver=52.1.66
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/kubeshark/kubeshark"
license=('apache')
makedepends=(
    'go'
)

# no idea why --flto=auto is added to the LDFLAGS with a format
# causing an issue with the compiler.
options=('!lto')

_latest() {
    curl -s https://api.github.com/repos/kubeshark/kubeshark/releases | jq -r '.[0].tag_name'
}

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/kubeshark/kubeshark/archive/v${pkgver}.tar.gz"
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
        -X 'github.com/kubeshark/kubeshark/misc.Ver=v${pkgver}' \
        -s -w" \
      -o bin/kubeshark kubeshark.go
}

package() {
    install -D -m0755 "${srcdir}/$pkgname-$pkgver/bin/kubeshark" "${pkgdir}/usr/bin/kubeshark"

    "${pkgdir}/usr/bin/kubeshark" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kubeshark"
    "${pkgdir}/usr/bin/kubeshark" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kubeshark"
}

sha256sums=(
    2f8af32a5f783ed7b89611811b83b2e667490ff1c1803d17323048d6af10114f
)
