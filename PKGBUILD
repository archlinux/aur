# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='orbterm'
pkgver='0.3.6'
pkgrel='4'
pkgdesc='The default terminal for RedoxOS, compatible with Linux'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.redox-os.org/redox-os/$pkgname"
license=('MIT')
depends=('sdl2')
makedepends=('cargo')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
	"$pkgname-$pkgver-$pkgrel-fix-cargo-lock.diff::$url/-/commit/4ffdd272dbb4a2a3961ba817c3946562d9029fcc.diff"
	'update-orbfont.diff'
)
sha512sums=('de215ee7044f1bbc7fa33f505b1e956714dc949b32bc8a063f73955b4c40ef7b69dcc83bfdc4655c4a8175f8aecfaf8b69546c864e2d180952758b28a65b5a01'
            'cdbcea62e396268329b80d77b84bb3f26682f544cb1363da66e70aa65ca432e73279dc2f506fba114431e69065d9db92837ae8b7031db23c0b4be6f847046425'
            '6240c49fcc614e20c207f84f4d13e822c6760d23760012bf3e3e70165775eb1cab5c4e10d92d10551ff89c4b9cdc153f732af2490e8f6c1e558685d7978236fe')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < "../$pkgname-$pkgver-$pkgrel-fix-cargo-lock.diff"
	patch --forward -p1 < "$srcdir/update-orbfont.diff"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	cargo build --release --locked --all-features
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
