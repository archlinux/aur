# Maintainer: javy

pkgname=passcualito
pkgver=0.1.0
pkgrel=1
pkgbin=passc
pkgdesc="Simple Command-Line Password Manager for Linux"
arch=('x86_64')
url="https://codeberg.org/javy/passcualito"
license=('MIT')
makedepends=('go' 'git')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha512sums=('859fe7cd826a489729754d148fc0c7d77fb11d1083c20e12eb38a9176390058ecd360a0e66356d2d80a222190b75d69a3b1a9241e58d9a8f6cbd99bd5f1509bf')
conflicts=("${pkgname}")

build() {
    cd "$srcdir/$pkgname"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -buildmode=pie \
        -trimpath \
        -ldflags="-linkmode=external -extldflags \"${LDFLAGS}\"" \
        -mod=readonly \
        -modcacherw \
        -o "bin/$pkgbin" .
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "bin/$pkgbin" "$pkgdir/usr/bin/passc"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
