# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=ov
pkgver=0.55.0
pkgrel=1
pkgdesc="Feature-rich terminal-based text viewer"
arch=('x86_64')
url="https://github.com/noborus/ov"
license=('MIT')
makedepends=('go' 'git')
_tag="v$pkgver"
source=("$pkgname::git+https://github.com/noborus/ov.git#tag=$_tag")
b2sums=('a4495bbbc8d16e7e241194c100a3be74e975a7955562143547a2c8126409693a4322b7de02d7b63adda0f9f82fee9e0fc47b6c469fd95b74f540883f55d9d734')

prepare() {
    cd "$pkgname"
    go mod vendor
    mkdir -p build/
}

build() {
    cd "$pkgname"

    local revision="$(git rev-parse --short HEAD)"

    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=vendor \
        -ldflags="-linkmode=external -X main.Version=$_tag -X main.Revision=$revision -extldflags '$LDFLAGS'" \
        -o build

    for _shell in bash zsh fish; do
        build/ov --completion "$_shell" > "build/completion.$_shell"
    done
}

check() {
    cd "$pkgname"
    go test
}

package() {
    cd "$pkgname"

    install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 ov.yaml ov-less.yaml ov-disable-default.yaml

    install -Dm644 build/completion.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 build/completion.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    install -Dm644 build/completion.fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
