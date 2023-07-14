# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=decasify
pkgname=("$pkgbase" "lua-$pkgbase" "lua53-$pkgbase" "lua52-$pkgbase" "lua51-$pkgbase")
pkgver=0.3.0
_rockrel=1
pkgrel=1
pkgdesc='cast strings to title-case according to locale specific style guides including Turkish'
arch=(x86_64)
url="https://github.com/alerque/$pkgbase"
license=(GPL3)
depends=(gcc-libs
         glibc)
makedepends=(cargo
             lua{,-luarocks-build-rust-mlua}
             lua51{,-luarocks-build-rust-mlua}
             lua52{,-luarocks-build-rust-mlua}
             lua53{,-luarocks-build-rust-mlua}
             luarocks
             jq)
_archive="$pkgbase-$pkgver"
source=("$url/releases/download/v$pkgver/$_archive.tar.xz")
sha256sums=('60410dd313230569e16d8205bd1b4d317d6740b0815cecc2a6a98b0aad27d3b3')

prepare() {
	cd "$_archive"
	sed Makefile.am -i \
		-e 's/cargo \(build\|install\|test\)/cargo --offline \1/'
	autoreconf
	cargo fetch --locked
}

build() {
	cd "$_archive"
	./configure --prefix /usr
	make
}

check() {
	cd "$_archive"
	make check
}

package_decasify() {
	cd "$_archive"
	make DESTDIR="$pkgdir" install
}

_package_helper() {
	cd "$_archive"
	luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "rockspecs/$pkgbase-$pkgver-$_rockrel.rockspec"
}

package_lua-decasify() {
	depends=(lua "${_luadeps[@]/#/lua-}")
	_package_helper 5.4
}

package_lua51-decasify() {
	depends=(lua51 "${_luadeps[@]/#/lua51-}")
	_package_helper 5.1
}

package_lua52-decasify() {
	depends=(lua52 "${_luadeps[@]/#/lua52-}")
	_package_helper 5.2
}

package_lua53-decasify() {
	depends=(lua53 "${_luadeps[@]/#/lua53-}")
	_package_helper 5.3
}
