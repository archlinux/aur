# Maintainer: Matthias Lisin <ml@visu.li>
pkgname=golangci-lint
pkgdesc="Linters Runner for Go. 5x faster than gometalinter."
pkgver=1.18.0
_commit=31afdf8 # short commit hash of release
pkgrel=1
arch=('x86_64' 'i686')
url='https://github.com/golangci/golangci-lint'
license=('GPL3')
makedepends=('git' 'go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/golangci/golangci-lint/archive/v${pkgver}.tar.gz")
sha512sums=('f8ead30abee9216387c730a00a09171e5c90486f95dbde083a59703a8047bd26bbf666b80b50f0f36f5dc352248320b725336f5cabb9d8b61c22efa0ce23a7d9')

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
