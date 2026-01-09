# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=passcualito
pkgver=0.1.0
pkgrel=1
pkgbin=passc
pkgdesc="Simple Command-Line Password Manager for Linux"
arch=('x86_64')
url="https://github.com/javiorfo/passcualito"
license=('MIT')
makedepends=('go' 'git')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha512sums=('f18ccb0da6b8ab0c0b2393da9a44acf5d8b88e38f1d94e6a17dde7c6040facc94dcf0c868051220f0ac9fc94ef0ee2679d04b272f8d8ac3d14eb56e56c4a495a')
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
