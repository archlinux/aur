# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>
pkgname=chainsaw
pkgver=0.2.14
pkgrel=1
pkgdesc='Declarative Kubernetes end-to-end testing framework'
arch=('x86_64' 'aarch64')
url='https://github.com/kyverno/chainsaw'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
conflicts=('chainsaw-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kyverno/chainsaw/archive/v$pkgver.tar.gz"
        'go1.26-modulepath.patch')
sha256sums=('8d80b9d4bed3a158e1fb0a01d1321c1b5c6a0dab565b036b1404859a8d4602bf'
            '2375256721fedf3cdd0b7a8032dcd9c9a01b4cc48c35f3b55f6de154f7b57024')
options=(!lto)

prepare() {
    cd chainsaw-$pkgver
    # Backport upstream fix for Go 1.26 testing.testDeps ModulePath() requirement.
    patch -p1 -i "$srcdir/go1.26-modulepath.patch"
    export GOFLAGS="-mod=readonly -modcacherw"
    go mod download -x
}

build() {
    cd chainsaw-$pkgver

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
    cd chainsaw-$pkgver
    ./chainsaw version
}

package() {
    cd chainsaw-$pkgver
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
