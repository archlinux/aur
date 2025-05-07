# Maintainer: ark <arkorty@gmail.com>
# Contributor: siers <wimuan@gmail.com>

pkgname='massren'
pkgver='1.5.7'
pkgrel='1'
pkgdesc='Easily rename multiple files using your text editor'
url='https://github.com/laurent22/massren'
license=('MIT')
arch=('x86_64')
conflicts=('massren')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7e7dd149bd3364235247268cc684b5a35badd9bee22f39960e075c792d037a8c')

prepare() {
    cd "$pkgname-$pkgver"
    mkdir -p build/

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
