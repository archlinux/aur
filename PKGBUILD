# Maintainer: Arkaprabha Chakraborty <arkorty@gmail.com>
# Contributor: siers <wimuan@gmail.com>

pkgname='massren'
pkgver='1.5.6'
pkgrel='1'
pkgdesc='Easily rename multiple files using your text editor'
url='https://github.com/laurent22/massren'
license=('MIT')
arch=('x86_64')
conflicts=('massren')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('49758b477a205f3fbf5bbe72c2575fff8b5536f8c6b45f8f6bd2fdde023ce874')

prepare() {
    cd "$pkgname-$pkgver"
    mkdir -p build/

    go mod init "${url#https://}"
    go mod tidy
}

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build .
}

package() {
    cd "$pkgname-$pkgver"
    sed -n '/## License/,$p' README.md > LICENSE
    install -Dm755 "build/$pkgname" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
