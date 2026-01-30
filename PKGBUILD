# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=pass-cli
pkgver=0.17.1
pkgrel=1
pkgdesc='A secure, cross-platform, always-free, and open-source alternative to 1password, bitwarden, etc., Password and API key manager'
arch=(x86_64)
url='https://github.com/arimxyer/pass-cli'
license=(Apache-2.0)
depends=(glibc)
makedepends=(go)
source=("$url/archive/v$pkgver/pass-cli-v$pkgver.tar.gz")
b2sums=('8c70d67f97720614648ff06897f8eb4346b987089eec01448c36679824489b0f0145bd9285bec6d60b8b470d376e3e22adb85bb815e95c1b0581bf0b9eb21a3f')

prepare() {
    cd $pkgname-$pkgver
    export GOPATH="${srcdir}"
    go mod download -modcacherw
}

build() {
    cd $pkgname-$pkgver
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags "-compressdwarf=false \
                       -linkmode external \
                       -X pass-cli/cmd.version=$pkgver" .
}

check() {
    cd $pkgname-$pkgver
    CI=true go test ./...
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 pass-cli -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
