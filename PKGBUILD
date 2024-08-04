# Maintainer: Araaha <ara.ahady@gmail.com>

pkgname=tb.go
pkgver=1.0.2
pkgrel=1
pkgdesc="Tasks, boards & notes for the terminal"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://github.com/araaha/tb.go"
license=('GPL3')
makedepends=('go' 'git')
_tag="v$pkgver-$pkgrel"
source=("$pkgname::git+https://github.com/araaha/tb.go.git#tag=$_tag")
b2sums=('SKIP')

prepare() {
    cd "$pkgname"
}

build() {
    cd "$pkgname"

    local revision="$(git rev-parse --short "$_tag")"

    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags="-linkmode=external -X github.com/araaha/tb.go/cmd.Version=$_tag -X github.com/araaha/tb.go/cmd.Revision=$revision -extldflags '$LDFLAGS'" \
        -o tb
}

check() {
    cd "$pkgname"
    go test ./...
}

package() {
    cd "$pkgname"
    install -Dm755 tb "$pkgdir/usr/bin/tb"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
