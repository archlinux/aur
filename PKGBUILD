# Maintainer:
# Contributor: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=pass-cli
pkgver=0.17.21
pkgrel=1
pkgdesc='A secure, cross-platform, always-free, and open-source alternative to 1password, bitwarden, etc., Password and API key manager'
arch=(x86_64)
url='https://github.com/arimxyer/pass-cli'
license=(Apache-2.0)
depends=(glibc)
makedepends=(go)
source=("$url/archive/v$pkgver/pass-cli-v$pkgver.tar.gz")
b2sums=('cd0a32d420f61be00c49a90b311a22abbe23d331ac8c6a8cdb95c58a940fab74116178c703a75d7d8ab07113e714c17b29d74b078820685ed3b0709f94af9aa7')

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
