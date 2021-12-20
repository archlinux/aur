# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>
pkgname=storj-uplink
_basename=storj
pkgver=1.45.3
pkgrel=1
pkgdesc="Storj Tardigrade Uplink"
arch=('x86_64')
url="https://github.com/storj/storj"
license=(' AGPL-3.0')
source=("https://github.com/${_basename}/${_basename}/archive/v${pkgver}.tar.gz")
makedepends=('go')

sha512sums=('3bf59c5ee32443a32a88cf4165d997edc67c54bcf5af600530b3b4d4ceabe472be0bd6f28eaae10c50e2d7e1e2b4eec95b78c6f7aec537748c9ddb0f2631e9e0')

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
