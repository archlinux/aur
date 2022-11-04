# Maintainer: Will Furnass <will at thearete dot co dot uk>

pkgname='fn'
pkgver='0.6.22'
pkgrel='1'
epoch=
pkgdesc='fn: a container-native, cloud-agnostic tool for defining serverless functions.'
arch=('x86_64')
url='https://fnproject.io/'
license=('Apache')
groups=()
depends=('docker')
makedepends=('go-pie')
source=("https://github.com/fnproject/cli/archive/$pkgver.tar.gz")
noextract=("$pkgver.tar.gz")
sha256sums=('40581ee36aed8c570ce5dff63ac3dc291b5c0c17dcb92ded54626157d9db702b')

prepare() {
    tar -zxf ${pkgver}.tar.gz
}

build() {
    cd "cli-$pkgver"
    export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"
    GO111MODULE=on GOFLAGS="-mod=vendor $GOFLAGS" go mod vendor -v
    go build -o fn
}

check() {
    cd "cli-$pkgver"
    test "$(./fn --version) == 'fn version 0.5.86'"
#    go test -v $(go list ./... |  grep -Ev "^github.com/fnproject/cli/test$")
}

package() {
    cd "cli-$pkgver"
    install -Dm755 fn "$pkgdir"/usr/bin/fn
}
