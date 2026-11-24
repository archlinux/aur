# Maintainer: Pierre Mavro <pmavro@qovery.com>
pkgname=qovery-cli
pkgver=1.187.0
pkgrel=1
pkgdesc="Qovery Command Line Interface"
arch=(x86_64)
url="https://github.com/Qovery/qovery-cli"
license=('GPL')
makedepends=(git go)
source=("https://github.com/Qovery/qovery-cli/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    export CGO_ENABLED=0
    # Skip mise configs in the source (.mise.toml) so a mise `go` shim does not prompt for trust
    export MISE_IGNORED_CONFIG_PATHS="$srcdir${MISE_IGNORED_CONFIG_PATHS:+:$MISE_IGNORED_CONFIG_PATHS}"
    go build -ldflags "-X github.com/qovery/qovery-cli/utils.Version=$pkgver" -o $pkgname main.go
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/qovery"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
md5sums=('686625835087c8eec79a31ea6ca4ba22')
