# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=tl
pkgbase=teal
pkgname=(teal "lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.24.4
pkgrel=1
pkgdesc='The compiler for Teal, a typed dialect of Lua'
arch=(any)
url=https://github.com/teal-language/$_rockname
license=(MIT)
_luadeps=(argparse
          filesystem)
makedepends=(lua
             lua51
             lua52
             lua53
             luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('b448a7aa85cb2a77779cc79ab46e6157c980af7f338412d66c1bfc7fe44e42e1')

_package() {
	cd "$_archive"
	depends=("${pkgname%-*}" "${_luadeps[@]/#/${pkgname%-*}-}")
	luarocks --lua-version $1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest -- "$_rockname-dev-1.rockspec"
	find "$pkgdir/usr/bin" -type f -execdir sed -i -e "s#$pkgdir##g" {} \;
	[[ -v 2 ]] &&
		rm -rf "$pkgdir/usr/"{lib,share} ||
		rm -rf "$pkgdir/usr/bin"
}

package_teal() {
	optdepends+=('cyan: The Teal build system and project manager')
	provides+=($_rockname)
	_package 5.4 bin
	depends=(lua lua-tl)
}

package_lua-tl() {
	_package 5.4
}

package_lua53-tl() {
	_package 5.3
}

package_lua52-tl() {
	_luadeps+=(compat53)
	_package 5.2
}

package_lua51-tl() {
	_luadeps+=(compat53)
	_package 5.1
}
