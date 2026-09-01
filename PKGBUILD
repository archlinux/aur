# shellcheck disable=SC2154
# Maintainer: Bas <hi@bas.sh>
pkgname=goat-cli
pkgver=0.2.4 # renovate: datasource=github-tags depName=bluesky-social/goat
pkgrel=2
pkgdesc="Go AT protocol CLI tool"
arch=('x86_64')
url="https://github.com/bluesky-social/goat"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bluesky-social/goat/archive/v$pkgver.tar.gz")
sha256sums=('0fa0e599bcc556f2dfde92beb2f63f4462ff74b2c695f1f5f8f35584607fde1c')

build() {
	cd "goat-$pkgver" || exit 1
	export GOPATH="${srcdir}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
	export GOEXPERIMENT="loopvar,nodwarf5"

	go build -ldflags "-compressdwarf=false -linkmode external" .
}

package() {
	cd "goat-$pkgver" || exit 1
	install -Dm755 goat "$pkgdir/usr/bin/goat"
	install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
