# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>
pkgname=storj-uplink
_basename=storj
pkgver=1.95.1
pkgrel=1
pkgdesc="Storj Tardigrade Uplink"
arch=('x86_64')
url="https://github.com/storj/storj"
license=(' AGPL-3.0')
source=("https://github.com/${_basename}/${_basename}/archive/v${pkgver}.tar.gz")
makedepends=('go')

sha512sums=('c08bf794b4b07553f4e7b065a00dfd02dd033b209bdd06bf72c89cff7adeee4a5f49ebc265c1ccab9da1acc309dd8a5bea43cf53ffb2bea3356aa823c6eda2f5')

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
