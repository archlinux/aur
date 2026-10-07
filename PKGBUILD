# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=giq
pkgver=0.1.4
pkgrel=1
pkgdesc="Git CLI with AI-powered commit messages and insights; drop-in git replacement"
arch=('x86_64' 'aarch64')
url="https://github.com/doganarif/giq"
license=('MIT')
depends=('git')
makedepends=('go>=1.23.5')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d66f7b67138527c087c9a1b421d9717fa9fa91f673e6a12a02aaa571a85bdd9f')

prepare() {
	cd "$pkgname-$pkgver"
	go mod download
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "-s -w" -o "giq" .
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "giq" "$pkgdir/usr/bin/giq"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
