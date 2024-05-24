# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=decasify
pkgname=("$pkgbase" "lua-$pkgbase" "lua53-$pkgbase" "lua52-$pkgbase" "lua51-$pkgbase")
pkgver=0.5.1
_rockrel=1
pkgrel=1
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
sha256sums=('4ba23a7d4be6356fa02250cf37b493bd70e7ed64fe5ecb4f4794ad46129b1a04'
            'SKIP')
validpgpkeys=('9F377DDB6D3153A48EB3EB1E63CC496475267693') # Caleb Maclennan <caleb@alerque.com> (@alerque)

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_archive"
	export CARGO_FEATURE_FLAGS==--offline
	./configure --prefix /usr
	make
}

check() {
	cd "$_archive"
	export CARGO_FEATURE_FLAGS==--offline
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
