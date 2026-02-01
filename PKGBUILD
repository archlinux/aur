# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=pass-cli
pkgver=0.17.2
pkgrel=1
pkgdesc='A secure, cross-platform, always-free, and open-source alternative to 1password, bitwarden, etc., Password and API key manager'
arch=(x86_64)
url='https://github.com/arimxyer/pass-cli'
license=(Apache-2.0)
depends=(glibc)
makedepends=(go)
source=("$url/archive/v$pkgver/pass-cli-v$pkgver.tar.gz")
b2sums=('a1d170630eee925e1de5576a917907a4487df6a4ac3ecef5ffbe6f475e7273e7019768f7c0c34acc7c22129f3e6ffb4db3e0a5a0bdeef3b200b73cd7c87e160e')

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
