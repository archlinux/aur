# Maintainer: Insidious Fiddler <aur[at]codycody31[dot]dev>
pkgname=hister
pkgver=0.10.0
pkgrel=1
pkgdesc="Web history on steroids - blazing fast, content-based search for visited websites"
arch=('x86_64' 'aarch64')
url="https://github.com/asciimoo/hister"
license=('AGPL-3.0-or-later')
depends=('sqlite')
makedepends=('go' 'npm')
install=hister.install
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "hister.service")
sha256sums=('970e79f364c59641e6818f7d2ec1710b85de590862187156d1d4db855682f6d4'
            'c1f3851a79baf1eab7d5d40ee9aaffa53fef4a2938e5a293c542f73134e645da')

_ghrepo="asciimoo/hister"

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export GOPATH="$srcdir"
    export GOFLAGS="-modcacherw"
    go mod download
    go generate
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    export CGO_ENABLED=1
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="$srcdir"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o hister -tags netgo,osusergo \
        -ldflags "-s -w -X main.version=$pkgver" .

    ./hister completion bash > hister.bash
    ./hister completion zsh > hister.zsh
    ./hister completion fish > hister.fish
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 hister "$pkgdir/usr/bin/hister"
    install -Dm644 "$srcdir/hister.service" "$pkgdir/usr/lib/systemd/user/hister.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 hister.bash "$pkgdir/usr/share/bash-completion/completions/hister"
    install -Dm644 hister.zsh "$pkgdir/usr/share/zsh/site-functions/_hister"
    install -Dm644 hister.fish "$pkgdir/usr/share/fish/vendor_completions.d/hister.fish"
}
