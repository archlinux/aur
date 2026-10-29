# Maintainer: RAMA <143774106+Nomadcxx@users.noreply.github.com>
pkgname=sysclet
pkgver=0.3.0
pkgrel=1
pkgdesc="Generate ANSI text headers from TheDraw TDF fonts"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/sysclet"
# The GPL applies to sysclet code; bundled TDF fonts have separate terms.
license=('GPL-3.0-only' 'custom')
makedepends=('go>=2:1.26.10')
optdepends=('wl-clipboard: copy snippets from Wayland sessions'
            'xclip: copy snippets from X11 sessions'
            'xsel: copy snippets from X11 sessions')
provides=('sysclet')
conflicts=('sysclet-git')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# After a new tag, bump pkgver and run updpkgsums; the source is the tag archive.
sha256sums=('dabb67510db298cbe9b431df1d45cf6e2702eb20ba01e8e3523c4ed6f4d3b774')

_goenv() {
	export CGO_ENABLED=0 GOTOOLCHAIN=local
	export GOFLAGS='-trimpath -mod=readonly -modcacherw'
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	_goenv
	go build -ldflags="-s -w -X main.version=v$pkgver" -o sysclet .
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	_goenv
	go test -p 2 ./...
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 sysclet "$pkgdir/usr/bin/sysclet"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 THIRD-PARTY-NOTICES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.md"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
