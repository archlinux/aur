# Maintainer: Piero <biagini93@ik.me>
pkgname=nirilayout-git
pkgver=r41.5f2fd68
pkgrel=1
pkgdesc="Quickly switch niri output configuration between different layouts (GTK switcher)"
arch=('x86_64')
url="https://github.com/Piero-93/nirilayout"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell')
makedepends=('go' 'git' 'gettext')
provides=('nirilayout')
conflicts=('nirilayout')
source=("git+https://github.com/Piero-93/nirilayout.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/nirilayout"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/nirilayout"
	go mod download
}

build() {
	cd "$srcdir/nirilayout"

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

package() {
	cd "$srcdir/nirilayout"
	install -Dm755 nirilayout "$pkgdir/usr/bin/nirilayout"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
