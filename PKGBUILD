# Maintainer: Chinmay Dalal <w5vwg64uy@relay.firefox.com>
pkgname=twf-git
pkgver=r47.8eddca9
pkgrel=3
pkgdesc="Standalone tree view file explorer, inspired by fzf."
arch=('x86_64')
url="https://github.com/wvanlint/${pkgname%-git}"
makedepends=("go")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::"git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    export GOPATH="$srcdir/go"
    cd "$srcdir/$pkgname/cmd/twf"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -o "${pkgname%-git}" .
}


package() {
    cd "$srcdir/$pkgname"
    export GOPATH="$srcdir/go"
    echo $PWD
    install -Dm755 "$srcdir/$pkgname/cmd/twf/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
