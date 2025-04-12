# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=ov
pkgver=0.40.0
pkgrel=1
pkgdesc="Feature-rich terminal-based text viewer"
arch=('x86_64')
url="https://github.com/noborus/ov"
license=('MIT')
makedepends=('go' 'git')
_tag="v$pkgver"
source=("$pkgname::git+https://github.com/noborus/ov.git#tag=$_tag")
b2sums=('94de2d0356418bc8fbdb6bde5e1e8bd7dd42abf717a66d31f67362413d907ea2d7ac3589c6db60bf114cf876a9be4631cb5976e3dc75f3b6da78b05d82c4771b')

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
