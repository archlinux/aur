# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=ov
pkgver=0.35.0
pkgrel=1
pkgdesc="Feature-rich terminal-based text viewer"
arch=('x86_64')
url="https://github.com/noborus/ov"
license=('MIT')
makedepends=('go' 'git')
_tag="v$pkgver"
source=("$pkgname::git+https://github.com/noborus/ov.git#tag=$_tag")
b2sums=('ae32745fd09b7d25a18af6c2ef0b736e033e7c8b020d9d813e347b35bdb48eac7976043323034f5978e401831664c2c08b916cf90fec744eb35d822bd5bb7816')

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
    install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 ov.yaml ov-less.yaml ov-disable-default.yaml
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
