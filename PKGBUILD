# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_commit=71f721b956bf7530cbdc8ffaf4bb2168affc80ac
pkgname=flow-cli
pkgver=0.41.1
pkgrel=1
pkgdesc='A command-line interface that provides useful utilities for building Flow applications'
arch=('x86_64')
url='https://docs.onflow.org/flow-cli/'
license=('Apache-2.0')
makedepends=('go')
source=("flow-cli-$pkgver.tar.gz::https://github.com/onflow/flow-cli/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('8c9de5fbb4f8a8143aad9ba95191171064ed53c423524de6583e27101af092889acc5bd1bdbf1b2f5c9c961959095075c9675d17c995f4e9072731c107082eeb')

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
