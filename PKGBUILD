# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=decasify
pkgname=("$pkgbase" "lua-$pkgbase" "lua53-$pkgbase" "lua52-$pkgbase" "lua51-$pkgbase")
pkgver=0.4.6
_rockrel=1
pkgrel=3
pkgdesc='cast strings to title-case according to locale specific style guides including Turkish'
arch=(x86_64)
url="https://github.com/alerque/$pkgbase"
license=(GPL-3.0-only)
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
source=("$url/releases/download/v$pkgver/$_archive.tar.zst"{,.asc})
sha256sums=('e64c6aeb20e4de3c28d2b15ad28c340b28ab3b0804393cfaf5e159d608f0e21d'
            'SKIP')
validpgpkeys=('9F377DDB6D3153A48EB3EB1E63CC496475267693') # Caleb Maclennan <caleb@alerque.com> (@alerque)

prepare() {
	cd "$_archive"
	sed Makefile.am -i \
		-e 's/cargo \(build\|install\|test\)/cargo --offline \1/'
	autoreconf
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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

_package() {
	cd "$_archive"
	luarocks --lua-version "$1" --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
}

package_lua-decasify() {
	depends=("${pkgname%%-*}")
	_package 5.4
}

package_lua51-decasify() {
	depends=("${pkgname%%-*}")
	_package 5.1
}

package_lua52-decasify() {
	depends=("${pkgname%%-*}")
	_package 5.2
}

package_lua53-decasify() {
	depends=("${pkgname%%-*}")
	_package 5.3
}
