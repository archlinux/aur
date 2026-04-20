# shellcheck disable=SC2154
# Maintainer: Bas <hi@bas.sh>
pkgname=goat-cli-git
pkgver=0.2.3.r3.g77a943a
pkgrel=1
pkgdesc="Go AT protocol CLI tool"
arch=('x86_64')
url="https://github.com/bluesky-social/goat"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "goat" || exit 1
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "goat" || exit 1
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
	cd "goat" || exit 1
	install -Dm755 goat "$pkgdir/usr/bin/goat"
	install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
