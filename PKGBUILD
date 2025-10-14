# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=tl
pkgbase=teal
pkgname=(teal "lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.24.8
pkgrel=1
pkgdesc='The compiler for Teal, a typed dialect of Lua'
arch=(any)
url=https://github.com/teal-language/$_rockname
license=(MIT)
_luadeps=(argparse
          filesystem)
makedepends=(lua
             "${_luadeps[@]/#/lua-}" # needed to generate completions
             lua51
             lua52
             lua53
             luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('8d7a143fd67d71dca5dad132a0e1443be6c013c54de2884adf4f3ed3b2cef022')

_package() {
	cd "$_archive"
	depends=("${pkgname%-*}" "${_luadeps[@]/#/${pkgname%-*}-}")
	luarocks --lua-version $1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest -- "$_rockname-dev-1.rockspec"
	if [[ -v 2 ]]; then
		install -Dm0644 <(./tl completion bash) "$pkgdir/usr/share/bash-completion/completions/tl"
		install -Dm0644 <(./tl completion fish) "$pkgdir/usr/share/fish/vendor_completions.d/tl.fish"
		install -Dm0644 <(./tl completion zsh)  "$pkgdir/usr/share/zsh/site-functions/_tl"
		find "$pkgdir/usr/bin" -type f -execdir sed -i -e "s#$pkgdir##g" {} \;
		rm -rf "$pkgdir/usr/"{lib,share}/lua*
	else
		rm -rf "$pkgdir/usr/bin"
	fi
}

package_teal() {
	optdepends+=('cyan: The Teal build system and project manager')
	provides+=($_rockname)
	_package 5.4 bin
	depends=(lua "lua-tl=$pkgver")
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
