# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hein (Warky Devs) <hein@warky.dev>

pkgname=pgtidy
pkgver=1.0.0
pkgrel=1
pkgdesc="PostgreSQL SQL formatter and linter"
arch=(x86_64 aarch64)
url="https://git.warky.dev/wdevs/pgtidy"
license=(MIT)
depends=(glibc)
makedepends=(git go)
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('c2adbe9b94bb586acbfa0722a20c76433781696df9f077cf9474d5faafabb7c7')

prepare() {
    cd "$pkgname"
    export GOPATH="$srcdir"
    go mod download -modcacherw
    mkdir -p build
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    cd "$pkgname"
    go build -o build -ldflags "-linkmode=external -X main.version=$pkgver" ./cmd/pgtidy
}

check() {
    cd "$pkgname"
    go test ./...
}

package() {
    cd "$pkgname"
    install -Dm755 build/pgtidy -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md CLAUDE.md AGENTS.md AI_USE.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

