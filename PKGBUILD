# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fontproof
pkgver=3.0.3
pkgrel=1
_rockrel=1
pkgdesc='A font design testing class and CLI tool for SILE'
arch=(any)
url="https://github.com/sile-typesetter/$pkgname"
license=(MIT)
depends=(lua51-cliargs
         luajit
         sile)
makedepends=(luarocks)
_rock="$pkgname-$pkgver-$_rockrel.src.rock"
source=("$url/releases/download/v$pkgver/$_rock"{,.asc})
sha256sums=('31d01f1806d68254bec1c060e3c426ff6ea92c1022cc355af5758523fa5de3af'
            'SKIP')
validpgpkeys=('9F377DDB6D3153A48EB3EB1E63CC496475267693') # Caleb Maclennan <caleb@alerque.com> (@alerque)

prepare() {
	local _luaver="$(sile-lua -q <<< 'SILE.lua_version')"
	local _luabin="$(sile-lua -q <<< 'arg[-1]')"
	luarocks --local init
	luarocks config --scope project lua_version "$_luaver"
	luarocks config --scope project variables.LUA "$_luabin"
}

package() {
	luarocks --tree "$pkgdir/usr/" install --deps-mode none --no-manifest -- $_rock
	sed -i -E -e 's#package.c?path="[^"]+"[^;]+;##g' -e "s#$pkgdir##g" "$pkgdir/usr/bin/$pkgname"
	local _licensedir="$pkgdir/usr/share/licenses/$pkgname/"
	install -d "$_licensedir"
	ln -s /usr/lib/luarocks/rocks-5.1/$pkgname/$pkgver-$_rockrel/doc/LICENSE.md "$_licensedir/"
}
