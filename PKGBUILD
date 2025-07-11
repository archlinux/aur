# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=prompt-style
pkgname=(lua{,51,52,53}-"$_pkgname")
pkgver=0.0.8
pkgrel=1
pkgdesc="Lua plugin for powerlevel10k style prompt and WakaTime time tracking"
arch=(any)
url=https://github.com/wakatime/$_pkgname.lua
license=(GPL3)
makedepends=(luarocks)
optdepends=('git: get project name')
_revision=1
source=("https://luarocks.org/manifests/freed-wu/$_pkgname-$pkgver-$_revision.src.rock")
sha256sums=('b54f88be075d91d0f076c5b47417953a8bf2e3980a97444f22c76b9b7ba169f7')
_lua_version=5.4

_package() {
	install -Dm644 ./*.rock -t $1
	luarocks install --lua-version=$1 --tree="$pkgdir/usr/" --deps-mode=none $1/*.rock
	rm ${pkgdir:?}/usr/lib/luarocks/rocks-*/manifest
	install -d "$pkgdir/usr/share/"{bash-completion/completions,zsh/site-functions,fish/vendor_completions.d}
	export LUA_PATH_${1/./_}="./share/lua/$1/?.lua;./?.lua;./?/init.lua;;/usr/share/lua/$1/?.lua;/usr/share/lua/$1.lua"
	export LUA_CPATH_${1/./_}="./lib/lua/$1/?.so;./?.so;./?/init.so;;/usr/lib/lua/$1/?.so;/usr/lib/lua/$1.so"
}

_complete() {
	lua="lua$1"
	shift
	pushd "$pkgdir/usr" || exit 1
	for program; do
		"$lua" "bin/$program" --completion bash | tee "$pkgdir/usr/share/bash-completion/completions/$program"
		"$lua" "bin/$program" --completion zsh | tee "$pkgdir/usr/share/zsh/site-functions/_$program"
		"$lua" "bin/$program" --completion fish | tee "$pkgdir/usr/share/fish/vendor_completions.d/$program.fish"
	done
	popd || exit 1
}

package_lua51-prompt-style() {
	# neovim uses lua5.1
	optdepends=(neovim)
	depends=(lua51-{ansicolors,filesystem,luaprompt})
	local version=5.1
	_package $version
	rm -r "${pkgdir:?}/usr/bin"
	install -D "$pkgdir/usr/lib/luarocks/rocks-$version/prompt-style/$pkgver-$_revision/bin/"nvimp -t "$pkgdir/usr/bin"
	# texluajit doesn't use $LUA_PATH_5_1
	_complete "$version" nvimp
}

package_lua52-prompt-style() {
	depends=(lua52-{ansicolors,filesystem,luaprompt})
	local version=5.2
	_package $version
	rm -r "${pkgdir:?}/usr/bin"
}

package_lua53-prompt-style() {
	# luatex, neomutt uses lua5.3
	optdepends=(texlive-bin neomutt texlua)
	depends=(lua53-{ansicolors,filesystem,luaprompt})
	local version=5.3
	_package $version
	rm -r "${pkgdir:?}/usr/bin"
	install -D "$pkgdir/usr/lib/luarocks/rocks-$version/prompt-style/$pkgver-$_revision/bin/"{texluap,neomuttp} -t "$pkgdir/usr/bin"
	_complete "$version" texluap neomuttp
}

package_lua-prompt-style() {
	# pandoc uses lua5.4
	optdepends=(pandoc-cli)
	depends=(lua-{ansicolors,filesystem,luaprompt})
	local version=$_lua_version
	_package $version
	rm -r "${pkgdir:?}/usr/bin"
	install -D "$pkgdir/usr/lib/luarocks/rocks-$version/prompt-style/$pkgver-$_revision/bin/pandocp" -t "$pkgdir/usr/bin"
	# pandoc lua CLI doesn't accpet arguments
	_complete "$version" pandocp
}
