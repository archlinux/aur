# Maintainer: hacel <arch at sammar dot sa>
pkgname=jfsh
pkgver=0.1.17
pkgrel=1
pkgdesc="A terminal-based client for Jellyfin"
arch=("x86_64")
url="https://github.com/hacel/jfsh"
license=("Unlicense")
depends=("mpv")
makedepends=("go>=1.23.1")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hacel/jfsh/archive/v$pkgver.tar.gz")
sha256sums=('3c177ff96ac458317d3cee09129cb834d39059c48794397ed3043d1940d845cd')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOENV=off
    export GOPATH="$srcdir/gopath"
    export GOFLAGS="-trimpath -buildmode=pie -mod=readonly -modcacherw -buildvcs=false"
    local _build_date
    _build_date="$(date --utc --date="@${SOURCE_DATE_EPOCH}" +%Y-%m-%dT%H:%M:%SZ)"
    go build -ldflags "-X main.version=${pkgver} -X main.date=${_build_date}" -o jfsh
}

check() {
    cd "$srcdir/$pkgname-$pkgver"

    export GOENV=off
    export GOPATH="$srcdir/gopath"
    export GOFLAGS="-trimpath -mod=readonly -modcacherw -buildvcs=false"
    go test ./...
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 jfsh "${pkgdir}/usr/bin/jfsh"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/jfsh/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/jfsh/README.md"
}
