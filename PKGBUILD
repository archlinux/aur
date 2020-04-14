# Maintainer: David Birks <david@birks.dev>

pkgname=kubeval
pkgver=0.16.1
pkgrel=1
pkgdesc='Command line tool to validate your Kubernetes configuration files'
arch=(x86_64)
url='https://github.com/instrumenta/kubeval'
license=(Apache)
conflicts=('kubeval-bin')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/instrumenta/kubeval/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('6ed4603d6a754c5d256c68a113c3f53745c118f605f215125cebf9d17e4fef505c4011330abec40ce89be6724f13f093a0ed6b5a1bbda3484dcc303a9208bbc8')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=vendor -modcacherw"

    #export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

    cd $pkgname-$pkgver
    go mod vendor
    go build -ldflags "-X main.version=$pkgver" -o bin/kubeval .
}

package() {
    install -Dm 755 "$srcdir/$pkgname-$pkgver/bin/kubeval" "$pkgdir/usr/bin/kubeval"
}
