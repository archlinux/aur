# Maintainer: typechecks

pkgname=anitui
pkgver=0.1.0
pkgrel=1
pkgdesc='a tui for browsing and streaming anime'
arch=('x86_64' 'aarch64')
url='https://github.com/typechecks/anitui'
license=('GPL-3.0-only')
makedepends=('go')
optdepends=(
    'mpv: media player for streaming'
    'vlc: media player for streaming'
    'haruna: media player for streaming'
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/typechecks/anitui/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir"
    go mod download -modcacherw
}

build() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags "-s -w -X github.com/anitui/anitui/internal/tui.Version=$pkgver" -o anitui ./cmd/anitui
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 anitui "$pkgdir/usr/bin/anitui"
}
