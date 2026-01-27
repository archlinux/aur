# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=pass-cli
pkgver=0.16.2
pkgrel=1
pkgdesc='A secure, cross-platform, always-free, and open-source alternative to 1password, bitwarden, etc., Password and API key manager'
arch=(x86_64)
url='https://github.com/arimxyer/pass-cli'
license=(Apache-2.0)
depends=(glibc)
makedepends=(go)
source=("$url/archive/v$pkgver/pass-cli-v$pkgver.tar.gz")
b2sums=('97c86cdd02ce90f7e2bf985d26a3fad69a45e2c2286a6405663b53ab58aaaec61980cf51d4f69acec0e33975c459d28127eab40dbfe62fb5ec37261e03339835')

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
