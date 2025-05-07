# Maintainer: Elia Nitsche <nitscheelia at gmail dot com>
# Contributor: Mattéo Delabre <aur.matteo@delab.re>
pkgname=rmapi
pkgver=0.0.29
pkgrel=1
pkgdesc='Access reMarkable tablet files through the Cloud API'
arch=('x86_64')
url='https://github.com/ddvk/rmapi'
license=('AGPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0ee804dafe5b9fbdb1ece511c3135970106b2e006d21a4cd954d0445ad8a71ab')

prepare() {
    cd "$pkgname-$pkgver"
    sed -i "s/Version = \"dev\"/Version = \"$pkgver\"/" version/version.go
    mkdir -p build/
}

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
    go build -o build .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 build/"$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}
