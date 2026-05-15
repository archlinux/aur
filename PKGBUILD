# Maintainer: Andy Jeffries <andy@andyjeffries.co.uk>
pkgname=nzbgrab
pkgver=0.1.0
pkgrel=1
pkgdesc="Fast parallel NZB downloader with PAR2 and extraction"
arch=('x86_64' 'aarch64')
url="https://github.com/andyjeffries/nzbgrab"
license=('MIT')
depends=('glibc')
optdepends=(
    'par2cmdline: PAR2 verification and repair'
    'unrar: RAR extraction'
    'p7zip: 7z extraction'
    'unzip: ZIP extraction'
)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andyjeffries/nzbgrab/archive/v$pkgver.tar.gz")
sha256sums=('cd5eca02985b89a40d1b81b372c22ade3d6530897fbce093f349d53ff528a435')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags "-s -w -X main.version=$pkgver -linkmode=external" -o nzbgrab ./cmd/nzbgrab
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 nzbgrab "$pkgdir/usr/bin/nzbgrab"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
