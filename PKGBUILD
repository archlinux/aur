# Maintainer: Araaha <ara.ahady@gmail.com>

pkgname=tb.go
pkgver=1.0.0
pkgrel=2
pkgdesc="Tasks, boards & notes for the terminal"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://github.com/araaha/tb.go"
license=('GPL3')
makedepends=('go' 'git')
_tag="v$pkgver-$pkgrel"
source=("$pkgname::git+https://github.com/araaha/tb.go.git#tag=$_tag")
b2sums=('58abee7e850c1dc24e1f47c9202e384d6f39f644b7f8cfe5d0e2b884e43a7d9da195dc1118dbb2659f544163c0c672c9c1e91915b7977bb40017a14b3f197784')

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
