# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=ov
pkgver=0.51.1
pkgrel=1
pkgdesc="Feature-rich terminal-based text viewer"
arch=('x86_64')
url="https://github.com/noborus/ov"
license=('MIT')
makedepends=('go' 'git')
_tag="v$pkgver"
source=("$pkgname::git+https://github.com/noborus/ov.git#tag=$_tag")
b2sums=('0cd85d554ccf61dbfbef89b89f4e3dc81610157b826588817165e770c67959d8672a1682bb597a5c23274988949630260b20c22ad532d3dfc3b96601574d5e97')

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
