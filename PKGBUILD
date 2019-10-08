# Maintainer: Matthias Lisin <ml@visu.li>
pkgname=golangci-lint
pkgdesc="Linters Runner for Go. 5x faster than gometalinter."
pkgver=1.20.0
_commit=cc98739 # short commit hash of release
pkgrel=1
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url='https://github.com/golangci/golangci-lint'
license=('GPL3')
makedepends=('git' 'go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/golangci/golangci-lint/archive/v${pkgver}.tar.gz")
sha512sums=('290842ec95d0a1868457e7e1ffb3ba6e73a98783b2ab1129a75df49d0a5c19f4184b52200a2441723fabe00a201ee9eda14877769e4445000e2879db74113f15')

build() {
    cd "${pkgname}-${pkgver}"
    export GOPATH="$srcdir"
    # ISO-8601, like the official binary
    _date=$(date -u -Iseconds -d "@${SOURCE_DATE_EPOCH}" | sed 's/+00:00/Z/')
    go build -trimpath \
             -ldflags "-X 'main.version=${pkgver}' \
                       -X 'main.commit=${_commit}' \
                       -X 'main.date=${_date}' \
                       -extldflags=${LDFLAGS}" \
             -buildmode=pie -o "$pkgname" ./cmd/"$pkgname"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}
