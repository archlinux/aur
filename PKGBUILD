# Maintainer: Matthias Lisin <ml@visu.li>
pkgname=golangci-lint
pkgdesc="Linters Runner for Go. 5x faster than gometalinter."
pkgver=1.19.1
_commit=c427c61 # short commit hash of release
pkgrel=1
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url='https://github.com/golangci/golangci-lint'
license=('GPL3')
makedepends=('git' 'go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/golangci/golangci-lint/archive/v${pkgver}.tar.gz")
sha512sums=('099a3280c5d6764db6f53bd2a41d0547143b211650ffc93f2105d2a96c47473e3c933e1999f0cdd133a5f8f13bfcc9513b796b460e2967532ac5b35c178e7b43')

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
