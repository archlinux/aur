# Maintainer: Matthias Lisin <ml@visu.li>
pkgname=golangci-lint
pkgdesc="Linters Runner for Go. 5x faster than gometalinter."
pkgver=1.16.0
_commit=97ea1cb # short commit hash of release
pkgrel=4
arch=('x86_64' 'i686')
url='https://github.com/golangci/golangci-lint'
license=('GPL3')
makedepends=('git' 'go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/golangci/golangci-lint/archive/v${pkgver}.tar.gz")
sha512sums=('1b0c63ca31c93761d24071cac8eb27278075230f9f93026d9b38e106069f9ecc5618621372ef4a4a886ef3791b50d953fd7c9889e7443960bff18a1d72cfcda9')

build() {
    cd "${pkgname}-${pkgver}"
    export GOPATH="$srcdir"
    # ISO-8601, like the official binary
    _date=$(date -u -Iseconds -d "@${SOURCE_DATE_EPOCH}" | sed 's/+00:00/Z/')
    LDFLAGS+=" -X 'main.version=${pkgver}'"
    LDFLAGS+=" -X 'main.commit=${_commit}'"
    LDFLAGS+=" -X 'main.date=${_date}'"
    go build -gcflags "all=-trimpath=${srcdir}" \
             -asmflags "all=-trimpath=${srcdir}" \
             -ldflags "-extldflags=${LDFLAGS}" \
             -buildmode=pie -o "$pkgname" ./cmd/"$pkgname"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}
