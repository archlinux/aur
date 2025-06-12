# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=decasify-git
_pkgbase=${pkgbase%-git}
pkgname=("$pkgbase" "lua-$pkgbase" "lua53-$pkgbase" "lua52-$pkgbase" "lua51-$pkgbase" "neovim-$pkgbase" "python-$pkgbase" "sile-$pkgbase" "vim-$pkgbase" )
pkgver=0.10.1.r20.g356000d
_rockrel=1
pkgrel=1
pkgdesc='cast strings to title-case according to locale specific style guides including Turkish'
arch=(x86_64)
url="https://github.com/alerque/$_pkgbase"
license=(LGPL-3.0-only)
depends=(gcc-libs
         glibc)
makedepends=(cargo
             git
             lua{,-luarocks-build-rust-mlua}
             lua51{,-luarocks-build-rust-mlua}
             lua52{,-luarocks-build-rust-mlua}
             lua53{,-luarocks-build-rust-mlua}
             luarocks
             python-{build,installer,wheel}
             python-maturin
             jq)
source=("git+$url.git")
sha256sums=('SKIP')
validpgpkeys=('9F377DDB6D3153A48EB3EB1E63CC496475267693') # Caleb Maclennan <caleb@alerque.com> (@alerque)

prepare() {
	cd "$_pkgbase"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
	cd "$_pkgbase"
	git describe --long --tags --abbrev=7 --match="v*" HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgbase"
	./bootstrap.sh
	export CARGO_FEATURE_FLAGS==--offline
	./configure --prefix /usr
	make
	python -m build -wn
}

check() {
	cd "$_pkgbase"
	./$_pkgbase -l tr -c title 'ılIk ilkİ' | grep -Fx 'Ilık İlki'
	# export CARGO_FEATURE_FLAGS==--offline
	# check requires lua & python developer tooling, needs to be reworked for a simple selfcheck
	# make check
}

package_decasify-git() {
	cd "$_pkgbase"
	pkgdesc+=' (CLI tool)'
	provides=("${pkgname%-git}=$pkgver")
	conflicts=("${pkgname%-git}")
	make DESTDIR="$pkgdir" install
}

_package() {
	cd "$_pkgbase"
	pkgdesc+=" (Rock for Lua $1)"
	provides=("${pkgname%-git}=$pkgver")
	conflicts=("${pkgname%-git}")
	luarocks --lua-version "$1" --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "$_pkgbase-dev-$_rockrel.rockspec"
}

package_lua-decasify-git() {
	_package 5.4
}

package_lua51-decasify-git() {
	_package 5.1
}

package_lua52-decasify-git() {
	_package 5.2
}

package_lua53-decasify-git() {
	_package 5.3
}

package_neovim-decasify-git() {
	cd "$_pkgbase"
	pkgdesc+=' (Neovim plugin)'
	depends=("lua51-$pkgbase=$pkgver"
	         neovim)
	provides=("${pkgname%-git}=$pkgver")
	conflicts=("${pkgname%-git}")
	install -Dm0644 -t "$pkgdir/usr/share/nvim/site/pack/dist/start/$_pkgbase/" plugin/*
}

package_python-decasify-git() {
	cd "$_pkgbase"
	pkgdesc+=' (Python module)'
	depends=(python)
	provides=("${pkgname%-git}=$pkgver")
	conflicts=("${pkgname%-git}")
	python -m installer -d "$pkgdir" dist/*.whl
}

package_sile-decasify-git() {
	cd "$_pkgbase"
	pkgdesc+=' (SILE package)'
	depends=("lua51-$pkgbase=$pkgver"
	         sile)
	provides=("${pkgname%-git}=$pkgver")
	conflicts=("${pkgname%-git}")
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "$_pkgbase.sile-dev-$_rockrel.rockspec"
}

package_vim-decasify-git() {
	cd "$_pkgbase"
	pkgdesc+=' (VIM plugin)'
	depends=("$pkgbase=$pkgver"
	         vim)
	provides=("${pkgname%-git}=$pkgver")
	conflicts=("${pkgname%-git}")
	install -Dm0644 -t "$pkgdir/usr/share/vim/vimfiles/$_pkgbase/" plugin/*
}
