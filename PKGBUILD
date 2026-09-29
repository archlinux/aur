# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>
pkgname=chainsaw
pkgver=0.2.15
pkgrel=2
_commit=e166f7755b0d6098476c5c6677082203c877bfef
pkgdesc='Declarative Kubernetes end-to-end testing framework'
arch=('x86_64' 'aarch64')
url='https://github.com/kyverno/chainsaw'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
conflicts=('chainsaw-bin')
source=("$pkgname-$pkgver-${_commit}.tar.gz::https://github.com/kyverno/chainsaw/archive/${_commit}.tar.gz")
sha256sums=('11a94984ed6c4feb414e31305b3e226cd761a0dcc72aad7385fd547ead10fad9')
options=(!lto)

prepare() {
    cd chainsaw-${_commit}
    export GOFLAGS="-mod=readonly -modcacherw"
    go mod download -x
}

build() {
    cd chainsaw-${_commit}

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-mod=readonly -modcacherw"

    LDFLAGS="-extldflags '$LDFLAGS' \
        -X github.com/kyverno/chainsaw/pkg/version.BuildVersion=v$pkgver"

    go build \
        -buildmode=pie \
        -trimpath \
        -ldflags "-compressdwarf=false -linkmode external $LDFLAGS" \
        -o chainsaw \
        .
}

check() {
    cd chainsaw-${_commit}
    ./chainsaw version
}

package() {
    cd chainsaw-${_commit}
    install -Dm755 chainsaw "$pkgdir/usr/bin/chainsaw"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    ./chainsaw completion bash | install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/bash-completion/completions/chainsaw"
    ./chainsaw completion zsh | install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/zsh/site-functions/_chainsaw"
    ./chainsaw completion fish | install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/fish/vendor_completions.d/chainsaw.fish"
}
