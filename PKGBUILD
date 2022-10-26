# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_commit=4c196bab9f9f89a4e6b51af4e6cc918ecea2cd1f
pkgname=flow-cli
pkgver=0.41.2
pkgrel=1
pkgdesc='A command-line interface that provides useful utilities for building Flow applications'
arch=('x86_64')
url='https://docs.onflow.org/flow-cli/'
license=('Apache-2.0')
makedepends=('go')
source=("flow-cli-$pkgver.tar.gz::https://github.com/onflow/flow-cli/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('d2529456bb188bb2ed4b751bf2c42606678dc4319d4df46752c15f612491bf818f9316d72eaa808e2d38f1d0b0c96845ac2041c8775d2fc5436b2c3049f407a2')

build() {
    cd flow-cli-$pkgver

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
    export GO111MODULE=on

    go build \
        -trimpath \
        -ldflags "-X github.com/onflow/flow-cli/build.commit=$_commit -X github.com/onflow/flow-cli/build.semver=v$pkgver" \
        -o ./cmd/flow/flow \
        ./cmd/flow
}

package() {
    cd flow-cli-$pkgver
    install -Dm755 cmd/flow/flow -t "$pkgdir/usr/bin"
}
