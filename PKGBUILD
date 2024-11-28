# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=prompt-style
pkgname=(lua{,51,52,53}-"$_pkgname")
pkgver=0.0.2
pkgrel=1
pkgdesc="Lua plugin for powerlevel10k style prompt and WakaTime time tracking"
arch=(any)
url=https://github.com/wakatime/$_pkgname.lua
license=(GPL3)
makedepends=(luarocks)
optdepends=('git: get project name')
_revision=1
source=("https://luarocks.org/manifests/Freed-Wu/$_pkgname-$pkgver-$_revision.src.rock")
sha256sums=('debb145a7de3643b2f790e29bb7e04b2b385423af8086dbbf6c57a97e003ae69')
_lua_version=5.4

_package() {
	install -Dm644 ./*.rock -t $1
	luarocks install --lua-version=$1 --tree="$pkgdir/usr/" --deps-mode=none $1/*.rock
	rm $pkgdir/usr/lib/luarocks/rocks-*/manifest
}

package_lua51-prompt-style() {
	# neovim uses lua5.1
	optdepends=(neovim)
	depends=(lua51-{ansicolors,filesystem,luaprompt})
	local version=5.1
	_package $version
	rm -r "${pkgdir:?}/usr/bin"
	install -D "$pkgdir/usr/lib/luarocks/rocks-$version/prompt-style/$pkgver-$_revision/bin/nvimp" -t "$pkgdir/usr/bin"
}

package_lua52-prompt-style() {
	depends=(lua52-{ansicolors,filesystem,luaprompt})
	local version=5.2
	_package $version
	rm -r "${pkgdir:?}/usr/bin"
}

package_lua53-prompt-style() {
	# luatex, neomutt uses lua5.3
	optdepends=(texlive-bin neomutt)
	depends=(lua53-{ansicolors,filesystem,luaprompt})
	local version=5.3
	_package $version
	rm -r "${pkgdir:?}/usr/bin"
	install -D "$pkgdir/usr/lib/luarocks/rocks-$version/prompt-style/$pkgver-$_revision/bin/"{texluap,neomuttp} -t "$pkgdir/usr/bin"
}

package_lua-prompt-style() {
	# pandoc uses lua5.4
	optdepends=(pandoc-cli)
	depends=(lua-{ansicolors,filesystem,luaprompt})
	local version=$_lua_version
	_package $version
	rm -r "${pkgdir:?}/usr/bin"
	install -D "$pkgdir/usr/lib/luarocks/rocks-$version/prompt-style/$pkgver-$_revision/bin/pandocp" -t "$pkgdir/usr/bin"
}
