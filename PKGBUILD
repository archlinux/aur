
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=nfm-git
_pkgname=${pkgname%-*}
pkgver=r231.2b7b3e4
pkgrel=1
pkgdesc='Neat terminal file manager.'
arch=('x86_64')
url='https://sr.ht/~leon_plickat/nfm'
license=('GPL3')
makedepends=('zig' 'git')
provides=('nfm')
conflicts=('nfm')
source=(
	"git+https://git.sr.ht/~leon_plickat/nfm"
	'git+https://github.com/tiehuis/zig-regex'
	'git+https://git.sr.ht/~leon_plickat/zig-spoon'
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
)

prepare() {
	cd "$srcdir/$_pkgname"
	git submodule init
	for dep in regex spoon; do
		git config "submodule.deps/zig-$dep.url" "$srcdir/zig-$dep"
	done
	git -c protocol.file.allow=always submodule update
}

pkgver() {
	cd "$srcdir/$_pkgname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	DESTDIR="$pkgdir" zig build -Drelease-safe --prefix '/usr'
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
	install -d "$pkgdir/usr/share/$_pkgname"
	cp -fR example "$pkgdir/usr/share/$_pkgname"
}
