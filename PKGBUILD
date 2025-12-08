# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=ov
pkgver=0.50.2
pkgrel=1
pkgdesc="Feature-rich terminal-based text viewer"
arch=('x86_64')
url="https://github.com/noborus/ov"
license=('MIT')
makedepends=('go' 'git')
_tag="v$pkgver"
source=("$pkgname::git+https://github.com/noborus/ov.git#tag=$_tag")
b2sums=('d3e962827f3ca9286854dd5e68f502dbc7792b76bf7b5da56facc68063bfebb91cb8da4e13d9665325a9047d6ed9342eb7b4eb501d9087c6c791c0048bba8c21')

prepare() {
    cd "$pkgname"
    mkdir build/
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
        -ldflags="-linkmode=external -X main.Version=$_tag -X main.Revision=$revision -extldflags '$LDFLAGS'" \
        -o build
}

check() {
    cd "$pkgname"
    go test
}

package() {
    cd "$pkgname"
    install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 ov.yaml ov-less.yaml ov-disable-default.yaml ov.plugin.zsh
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
