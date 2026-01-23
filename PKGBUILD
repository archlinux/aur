# Maintainer: Dawood <Nurysso at proton.me>
pkgname=vanish
pkgver=0.9.4
pkgrel=1
pkgdesc="Modern safe file deletion tool with recovery - Never lose files again! Beautiful TUI, pattern restore, themes."
arch=('x86_64' 'aarch64')
url="https://github.com/nurysso/vanish"
license=('GPL3')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nurysso/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('37099ffb3fa07f893b261af4c84a7f2c562a02a4775ad9a24a78845faf9d6166')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    go mod download
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    # Build with trimpath to avoid $srcdir references
    go build -trimpath -ldflags="-linkmode=external" -o vx .
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install binary to /usr/bin (standard location for Arch packages, not /usr/local/bin which is used by MakeFile)
    # Note: We don't use 'make install' because it installs to /usr/local/bin
    # and PKGBUILD needs to install to $pkgdir for package manager tracking
    # The binary will be in build/bin/
    install -Dm755 vx "$pkgdir/usr/bin/vx"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
