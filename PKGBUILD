# Maintainer: Will Furnass <will at thearete dot co dot uk>

pkgname='fn'
pkgver='0.5.86'
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
sha256sums=('8c7c5811595df2865437e1d2925aaa4eff78bc69a6a025e70252f86286f373df')

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
