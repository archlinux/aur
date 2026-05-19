# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=passcualito
pkgver=0.1.1
pkgrel=5
pkgbin=passc
pkgdesc="Simple Command-Line Password Manager for Linux"
arch=('x86_64')
url="https://codeberg.org/caskstrength/passcualito"
license=('MIT')
makedepends=('go' 'git')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha512sums=('8c3c69e2b465e9d70bc2b84e277966ab0be08f97e84270bb6ff34e886b86e621af35e03f37b923e65497a64c3b028fce8e0d7109f4f1de05d6c9e961d5ba7ebf')
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
