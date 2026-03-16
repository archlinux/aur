# Maintainer: Insidious Fiddler <aur[at]codycody31[dot]dev>
pkgname=hister-git
pkgver=0.9.0.r3.gbece25c
pkgrel=1
pkgdesc="Web history on steroids - blazing fast, content-based search for visited websites (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/asciimoo/hister"
license=('AGPL-3.0-or-later')
depends=('sqlite')
makedepends=('go' 'npm' 'git')
provides=("hister=$pkgver")
conflicts=('hister')
install=hister.install
options=(!lto)
source=("$pkgname::git+https://github.com/asciimoo/hister.git"
        "hister.service")
sha256sums=('SKIP'
            'c1f3851a79baf1eab7d5d40ee9aaffa53fef4a2938e5a293c542f73134e645da')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags --abbrev=7 --match 'v[0-9]*' 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.g%s" \
            "$(git rev-list --count HEAD)" \
            "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    export GOPATH="$srcdir"
    go mod download
    go generate
}

build() {
    cd "$srcdir/$pkgname"

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
    cd "$srcdir/$pkgname"
    install -Dm755 hister "$pkgdir/usr/bin/hister"
    install -Dm644 "$srcdir/hister.service" "$pkgdir/usr/lib/systemd/user/hister.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 hister.bash "$pkgdir/usr/share/bash-completion/completions/hister"
    install -Dm644 hister.zsh "$pkgdir/usr/share/zsh/site-functions/_hister"
    install -Dm644 hister.fish "$pkgdir/usr/share/fish/vendor_completions.d/hister.fish"
}
