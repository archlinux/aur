# Maintainer: Chinmay Dalal <w5vwg64uy@relay.firefox.com>
pkgname=gotktrix-git
license=('AGPL3')
pkgver=r362.a1876b4
pkgrel=1
pkgdesc="Matrix client in Go and GTK4"
arch=('x86_64')
url="https://github.com/diamondburned/${pkgname%-git}"
makedepends=('go' 'git' 'cairo' 'gobject-introspection' 'graphene' 'pango' 'gdk-pixbuf2')
depends=('gobject-introspection-runtime' 'gtk4')
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
    cd "$pkgname"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o "${pkgname%-git}" .
}


package() {
    cd "$pkgname"
    install -Dm755 "$srcdir/$pkgname/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
    install -Dm644 .nix/com.github.diamondburned.gotktrix.desktop "$pkgdir//usr/share/applications/${pkgname%-git}.desktop"
}
