# Maintainer: Matthias Lisin <ml@visu.li>
pkgname=golangci-lint
pkgdesc="Linters Runner for Go. 5x faster than gometalinter."
pkgver=1.19.0
_commit=27ac4c7 # short commit hash of release
pkgrel=1
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url='https://github.com/golangci/golangci-lint'
license=('GPL3')
makedepends=('git' 'go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/golangci/golangci-lint/archive/v${pkgver}.tar.gz")
sha512sums=('629b6bbdc1da8d1460bfcaa4013d8c7f5fdeca05ffe6c4cda9ea3dba96f870214edb7bd1c81638ed6877677dd6e1fe12999e3e69dea85bc0632f9910a4a61a19')

build() {
    cd "${pkgname}-${pkgver}"
    export GOPATH="$srcdir"
    # ISO-8601, like the official binary
    _date=$(date -u -Iseconds -d "@${SOURCE_DATE_EPOCH}" | sed 's/+00:00/Z/')
    LDFLAGS+=" -X 'main.version=${pkgver}'"
    LDFLAGS+=" -X 'main.commit=${_commit}'"
    LDFLAGS+=" -X 'main.date=${_date}'"
    go build -trimpath \
             -ldflags "-extldflags=${LDFLAGS}" \
             -buildmode=pie -o "$pkgname" ./cmd/"$pkgname"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}
