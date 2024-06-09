# Maintainer: Alex Palaistras <alex at deuill dot org>
pkgname=tuiarchiver-git
pkgver=0.2.1.r0.g6e04b0c
pkgrel=1
pkgdesc="TUI archive manager"
arch=('x86_64' 'i686' 'arm' 'aarch64' 'armv6h' 'armv7h')
url="https://codeberg.org/dnalor/tuiarchiver"
license=('EUPL-1.2-or-later')
makedepends=('git' 'go')
depends=('glibc')
optdepends=('chafa: inline image previews')
provides=('tuiarchiver')
conflicts=('tuiarchiver')
source=("${pkgname}::git+https://codeberg.org/dnalor/tuiarchiver")
sha512sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$pkgname"
	mkdir -p build
}

build() {
	cd "$srcdir/$pkgname"
	go build -trimpath -buildmode=pie -mod=readonly -modcacherw \
	   -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
	   -o build .
}

check() {
	cd "$srcdir/$pkgname"
	go test ./...
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 "build/tuiarchiver" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
