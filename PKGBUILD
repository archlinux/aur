# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=passcualito
pkgver=0.1.0
pkgrel=3
pkgbin=passc
pkgdesc="Simple Command-Line Password Manager for Linux"
arch=('x86_64')
url="https://github.com/javiorfo/passcualito"
license=('MIT')
makedepends=('go' 'git')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha512sums=('c65e13475d1717b1fb387c0a9e5a7f3d02f047b2ad0f0f610cf12fcd37171dfb16913f850093bfa98d4b0acc3467d9b18c97038a6d78a5f996fba16083d871d4')
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
