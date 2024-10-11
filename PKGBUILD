# Maintainer: Mattéo Delabre <aur.matteo@delab.re>
pkgname=rmapi
pkgver=0.0.27.1
pkgrel=1
pkgdesc='Access reMarkable tablet files through the Cloud API'
arch=('x86_64')
url='https://github.com/ddvk/rmapi'
license=('AGPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cfeac4e34c46d199f4c1fb59f089b32a848f1b9b8e31eb16891bec190f82f22b')

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
