# Maintainer: hyperpuncher
pkgname=pi-ui-git
pkgver=0.65.2.r0.g533cc4f
pkgrel=1
pkgdesc='Keyboard-first minimal GUI for pi'
arch=('x86_64' 'aarch64')
url='https://github.com/hyperpuncher/pi-ui'
license=('MIT')
depends=('glibc' 'icu')
makedepends=('bun>=1.4.4' 'git')
provides=("pi-ui=$pkgver" "pi-ui-server=$pkgver")
conflicts=('pi-ui' 'pi-ui-server')
options=('!strip' '!debug')
source=("pi-ui::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/pi-ui"
	git describe --tags --long --match 'v[0-9]*' --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./g'
}

prepare() {
	cd "$srcdir/pi-ui"
	bun ci
}

build() {
	cd "$srcdir/pi-ui"
	bun run build
}

check() {
	cd "$srcdir/pi-ui"
	bun run test
}

package() {
	cd "$srcdir/pi-ui"
	install -Dm755 dist/pi-ui "$pkgdir/usr/bin/pi-ui"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
