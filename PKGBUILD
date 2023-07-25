# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>
pkgname=storj-uplink
_basename=storj
pkgver=1.82.1
pkgrel=1
pkgdesc="Storj Tardigrade Uplink"
arch=('x86_64')
url="https://github.com/storj/storj"
license=(' AGPL-3.0')
source=("https://github.com/${_basename}/${_basename}/archive/v${pkgver}.tar.gz")
makedepends=('go')

sha512sums=('6d1eb55ad0a15f1e6f1ffdaca3b84833f19cae9041ade4777184e69770cf2c33c3df0ef0c451ce02864167171b43a1bd664b26a8aa5f8d6339447aae914f7804')

prepare(){
    cd "$_basename-$pkgver"
    mkdir -p build/
}

build() {
    cd "$_basename-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build ./cmd/uplink
}

package() {
    cd "$_basename-$pkgver"
    install -Dm755 build/uplink "${pkgdir}/usr/bin/uplink"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
