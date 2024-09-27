# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fontproof
pkgver=2.2.2
pkgrel=2
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
sha256sums=('73dd9bae627c484e91d3101a2db8b2a89d46b098a51adac1877347d3b73821c9'
            'SKIP')
validpgpkeys=('9F377DDB6D3153A48EB3EB1E63CC496475267693') # Caleb Maclennan <caleb@alerque.com> (@alerque)

prepare() {
	luarocks --local init
	luarocks --local config --scope project lua_version 5.1
	luarocks --local config --scope project lua_interpreter luajit
	luarocks --local config --scope project variables.LUA "$(command -v luajit)"
}

package() {
	luarocks --tree "$pkgdir/usr/" install --deps-mode none --no-manifest -- $_rock
	sed -i -E -e 's#package.c?path="[^"]+"[^;]+;##g' -e "s#$pkgdir##g" "$pkgdir/usr/bin/$pkgname"
	local _licensedir="$pkgdir/usr/share/licenses/$pkgname/"
	install -d "$_licensedir"
	ln -s /usr/lib/luarocks/rocks-5.1/$pkgname/$pkgver-$_rockrel/doc/LICENSE.md "$_licensedir/"
}
