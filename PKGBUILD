# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_commit=c82e69a8b97898d583e8c1d8d6dace15924ba70c
pkgname=flow-cli
pkgver=0.41.0
pkgrel=1
pkgdesc='A command-line interface that provides useful utilities for building Flow applications'
arch=('x86_64')
url='https://docs.onflow.org/flow-cli/'
license=('Apache-2.0')
makedepends=('go')
source=("flow-cli-$pkgver.tar.gz::https://github.com/onflow/flow-cli/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('6d9ca6c0540350032e4a51de0c014a9e51af08c3ee0dc1fd6ee07cb4dcb96d9c31d1ce2c01e2a0d4a308f663acb165a23fde6fef600d6724316c83ae1c512530')

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
