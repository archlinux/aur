# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=passcualito
pkgver=0.1.0
pkgrel=5
pkgbin=passc
pkgdesc="Simple Command-Line Password Manager for Linux"
arch=('x86_64')
url="https://codeberg.org/caskstrength/passcualito"
license=('MIT')
makedepends=('go' 'git')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha512sums=('d92f7e6d07abf631340950dbe5ab5c287cf2623945a910c4b2938909c550d6279cd614285de13dd532e83bdded10cd2c2d95f1401d72173fdf1924d4703bb2d3')
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
