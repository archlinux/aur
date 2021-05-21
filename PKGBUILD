# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Jeremy Asuncion <jeremyasuncion808@gmail.com>

pkgname=lab
pkgver=0.22.0
pkgrel=2
pkgdesc='A hub-like tool for GitLab'
arch=('x86_64')
url="https://zaquestion.github.io/$pkgname"
license=('custom:CC0')
depends=('git')
optdepends=('hub')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zaquestion/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('ff5b184db71818d0c342788fd5b38ab7c7af8d8561c683b5d08ffd4075116a0d')

prepare() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir"
    go mod download
}

build () {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir"
    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-extldflags \"$LDFLAGS\" -X main.version=$pkgver" \
        .
    ./lab completion bash > completion.bash
    ./lab completion fish > completion.fish
    ./lab completion zsh > completion.zsh
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" $pkgname
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 completion.bash "$pkgdir/usr/share/bash-completion/completions/lab"
    install -Dm644 completion.fish "$pkgdir/usr/share/fish/vendor_completions.d/lab.fish"
    install -Dm644 completion.zsh "$pkgdir/usr/share/zsh/site-functions/_lab"
}
