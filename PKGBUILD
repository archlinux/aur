# Maintainer: RAMA <143774106+Nomadcxx@users.noreply.github.com>
pkgname=sysclet-git
pkgver=0.3.0.r0.gbe80e64
pkgrel=1
pkgdesc="Generate ANSI text headers from TheDraw TDF fonts"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/sysclet"
# The GPL applies to sysclet code; bundled TDF fonts have separate terms.
license=('GPL-3.0-only' 'custom')
makedepends=('git' 'go>=2:1.26.10')
optdepends=('wl-clipboard: copy snippets from Wayland sessions'
            'xclip: copy snippets from X11 sessions'
            'xsel: copy snippets from X11 sessions')
provides=('sysclet')
conflicts=('sysclet')
options=('!debug')
source=('sysclet::git+https://github.com/Nomadcxx/sysclet.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/sysclet"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_goenv() {
	export CGO_ENABLED=0 GOTOOLCHAIN=local
	export GOFLAGS='-trimpath -mod=readonly -modcacherw'
}

build() {
	cd "$srcdir/sysclet"
	_goenv
	go build -ldflags="-s -w -X main.version=$(git describe --tags --always)" -o sysclet .
}

check() {
	cd "$srcdir/sysclet"
	_goenv
	go test -p 2 ./...
}

package() {
	cd "$srcdir/sysclet"
	install -Dm755 sysclet "$pkgdir/usr/bin/sysclet"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 THIRD-PARTY-NOTICES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.md"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
