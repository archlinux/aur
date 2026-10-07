# Maintainer: Piero <biagini93@ik.me>
pkgname=nirilayout
pkgver=0.4.0
pkgrel=1
pkgdesc="Quickly switch niri output configuration between different layouts (GTK switcher)"
arch=('x86_64')
url="https://github.com/Piero-93/nirilayout"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'glib2' 'cairo' 'pango' 'gdk-pixbuf2' 'graphene' 'glibc')
makedepends=('go' 'gettext' 'gobject-introspection')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a48355c54e1e092632759594dc0dc919846ec0b867faaabf5d5f06196d733055')

prepare() {
	cd "$pkgname-$pkgver"
	go mod download
}

build() {
	cd "$pkgname-$pkgver"

	export CGO_ENABLED=1
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	# Recompile gettext catalogs (.po -> .mo) so the //go:embed picks up
	# freshly built ones rather than trusting the committed artifacts.
	for po in locales/*/LC_MESSAGES/*.po; do
		msgfmt --check -o "${po%.po}.mo" "$po"
	done

	go build -o nirilayout ./cmd/nirilayout
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 nirilayout "$pkgdir/usr/bin/nirilayout"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
