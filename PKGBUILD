# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_commit=4fbbc12dbe54e0ffbc1288e2d238f967d9f4e474
pkgname=flow-cli
pkgver=0.37.1
pkgrel=1
pkgdesc='A command-line interface that provides useful utilities for building Flow applications'
arch=('x86_64')
url='https://docs.onflow.org/flow-cli/'
license=('Apache-2.0')
makedepends=('go')
source=("https://github.com/onflow/flow-cli/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('2dfcccd4ed72a9448bb1c44e6b332f1a7b4d8bf6b0fe6c6ddbf54032c525b00914c832c4f7a013510319d89af1d941d0795333ba86d546f4c2b38995524fd3d0')

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
