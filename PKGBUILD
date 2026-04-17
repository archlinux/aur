# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=joker-git
pkgver=1.7.1.r2.g8b553a03
pkgrel=1
pkgdesc="A Clojure interpreter and linter written in Go"
arch=('x86_64')
url="https://github.com/candid82/joker"
license=('EPL-1.0')
depends=('glibc')
makedepends=('go' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
    export GOPATH="$srcdir"
    cd "$pkgname"
    go mod download -modcacherw
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "$pkgname"
    ## from build.sh
    go generate ./...
    go vet ./...
    go build
}

check() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "$pkgname"
    go test
}

package() {
    cd "$pkgname"
    install -Dvm755 joker -t "$pkgdir/usr/bin/"
    install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dvm644 README.md DEVELOPER.md LIBRARIES.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
