# Maintainer: Matthias Lisin <ml@visu.li>
pkgname=golangci-lint
pkgdesc="Linters Runner for Go. 5x faster than gometalinter."
pkgver=1.17.1
_commit=4ba2155 # short commit hash of release
pkgrel=1
arch=('x86_64' 'i686')
url='https://github.com/golangci/golangci-lint'
license=('GPL3')
makedepends=('git' 'go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/golangci/golangci-lint/archive/v${pkgver}.tar.gz")
sha512sums=('de7272eb47e4e9ecc7559dd55d5f75eadcddcb2013eb577596f7c2fb6f823578d5c54c74b9368293cf6dd4d2dfe06781ca588673f3eaf733f63f3240ea155556')

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
