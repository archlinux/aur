# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=prompt-style
pkgname=(lua{,51,52,53}-"$_pkgname")
pkgver=0.0.11
pkgrel=1
pkgdesc="Lua plugin for powerlevel10k style prompt and WakaTime time tracking"
arch=(any)
url=https://github.com/wakatime/$_pkgname.lua
license=(GPL3)
makedepends=(luarocks)
optdepends=('git: get project name' 'python-lupa')
_revision=1
source=("https://luarocks.org/manifests/freed-wu/$_pkgname-$pkgver-$_revision.src.rock")
sha256sums=('f9c331b2eeb3bfeec2ee999238c2e0065b47252df0748c9cf22d13635c09c7d0')
_lua_version=5.4

_package() {
	install -Dm644 ./*.rock -t $1
	luarocks install --no-manifest --lua-version=$1 --tree="$pkgdir/usr/" --deps-mode=none $1/*.rock
	install -d "$pkgdir/usr/share/"{bash-completion/completions,zsh/site-functions,fish/vendor_completions.d}
	rm -r "${pkgdir:?}/usr/bin"
	export LUA_PATH_${1/./_}="./share/lua/$1/?.lua;./?.lua;./?/init.lua;;/usr/share/lua/$1/?.lua;/usr/share/lua/$1.lua"
	export LUA_CPATH_${1/./_}="./lib/lua/$1/?.so;./?.so;./?/init.so;;/usr/lib/lua/$1/?.so;/usr/lib/lua/$1.so"
	local v
	if [[ "$version" != "$_lua_version" ]]; then
		v="$version"
	fi
	install -D "$pkgdir/usr/lib/luarocks/rocks-$version/prompt-style/$pkgver-$_revision/bin/"lupa "$pkgdir/usr/bin/lupa$v"
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
	optdepends+=(neovim)
	depends=(lua51-{warna,filesystem,luaprompt})
	local version=5.1
	_package $version
	install -D "$pkgdir/usr/lib/luarocks/rocks-$version/prompt-style/$pkgver-$_revision/bin/"nvimp -t "$pkgdir/usr/bin"
	rm -r "$pkgdir/usr/lib/luarocks/rocks-$version/prompt-style/$pkgver-$_revision/bin/"
	_complete "$version" nvimp
}

package_lua52-prompt-style() {
	depends=(lua52-{warna,filesystem,luaprompt})
	local version=5.2
	_package $version
	rm -r "$pkgdir/usr/lib/luarocks/rocks-$version/prompt-style/$pkgver-$_revision/bin/"
}

package_lua53-prompt-style() {
	depends=(lua53-{warna,filesystem,luaprompt})
	local version=5.3
	_package $version
	rm -r "$pkgdir/usr/lib/luarocks/rocks-$version/prompt-style/$pkgver-$_revision/bin/"
}

package_lua-prompt-style() {
	# pandoc, neomutt uses lua5.4
	optdepends+=(pandoc-cli neomutt)
	depends=(lua-{warna,filesystem,luaprompt})
	local version=$_lua_version
	_package $version
	install -D "$pkgdir/usr/lib/luarocks/rocks-$version/prompt-style/$pkgver-$_revision/bin/"{pandocp,neomuttp} -t "$pkgdir/usr/bin"
	rm -r "$pkgdir/usr/lib/luarocks/rocks-$version/prompt-style/$pkgver-$_revision/bin/"
	# pandoc lua CLI doesn't accpet arguments
	_complete "$version" pandocp neomuttp
}
