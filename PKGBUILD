# Maintainer: Daniel Peukert <daniel@peukert.cc>
_pkgname='orbterm'
pkgname="$_pkgname-git"
pkgver='0.3.6.r13.gf1ca2c8'
pkgrel='1'
pkgdesc='The default terminal for RedoxOS, compatible with Linux - git version'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.redox-os.org/redox-os/$_pkgname"
license=('MIT')
depends=('sdl2')
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$pkgname::git+$url"
	'update-orbfont.diff'
)
sha512sums=('SKIP'
            '252bfe7afd4aab9e495030894d3bbe904eb4af8946c7869b17bf9a4777d69716cf9220b26d30968ff492ffaed7e5d2cecf25d9e06798ac2639b8cebf73a5cbf2')

_sourcedirectory="$pkgname"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < "$srcdir/update-orbfont.diff"
}

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	git describe --long --tags | sed -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	cargo build --release --locked --all-features
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
