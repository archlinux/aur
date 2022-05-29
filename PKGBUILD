# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>
pkgname=storj-uplink
_basename=storj
pkgver=1.55.1
pkgrel=1
pkgdesc="Storj Tardigrade Uplink"
arch=('x86_64')
url="https://github.com/storj/storj"
license=(' AGPL-3.0')
source=("https://github.com/${_basename}/${_basename}/archive/v${pkgver}.tar.gz")
makedepends=('go')

sha512sums=('fdc9c7283622b6e68b4ea8df0c9f1929c8233a06911354113d20a357a110e2c3e816a7817f06a8f61e1da8b5dc5a3951859829a995160a51f254e03b4c2bbd2d')

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
