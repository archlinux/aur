# Maintainer: Zack Bartel <zack@bartel.com>
pkgname=yoro-git
pkgver=0.3.3
pkgrel=1
pkgdesc="A yazi-inspired terminal UI for local calendars and contacts"
arch=('x86_64' 'aarch64')
url="https://github.com/zackb/yoro"
license=('MIT')
depends=()
makedepends=('git' 'go')
provides=('yoro')
conflicts=('yoro')
source=("git+https://github.com/zackb/yoro.git")
sha256sums=('SKIP')

pkgver() {
	cd yoro
	git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
		|| printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd yoro
	export CGO_ENABLED=0
	export GOFLAGS="-trimpath -mod=readonly -modcacherw"
	make build VERSION="$pkgver"
}

package() {
	cd yoro
	install -Dm755 build/yoro "$pkgdir/usr/bin/yoro"
	install -Dm644 man/yoro.1 "$pkgdir/usr/share/man/man1/yoro.1"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
