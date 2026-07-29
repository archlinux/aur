# Maintainer: Caleb Maclennan <caleb@alerque.com>

_treesitter=0.26.8

_rockname=ltreesitter
_project=$_rockname-lua
pkgname=("lua-$_rockname" "lua54-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.3.0
_rockrel=1
pkgrel=1
pkgdesc='Standalone tree sitter bindings for the Lua language'
arch=(x86_64)
url="https://github.com/euclidianAce/$_rockname"
license=(MIT)
makedepends=(git
             lua
             lua54
             lua53
             lua52
             lua51
             luarocks
             tree-sitter)
_archive="$_rockname-$pkgver"
_rock="$_archive-$_rockrel.linux-$CARCH.rock"
_rockspec="$_archive-$_rockrel.rockspec"
source=("git+$url.git#tag=v$pkgver"
        "git+https://github.com/tree-sitter/tree-sitter.git#tag=v$_treesitter")
sha256sums=('6c8c647f97cc1ebfdac7e1592bbe4969c850983c395354e158c0a6ec35ae9c56'
            '22e3f1f4bce1df2ea73d3bdc2b29713ce319b66538c03c4927e144bbf187d34f')

prepare() {
	pushd "$_rockname"
	git submodule init
	git config submodule.tree-sitter.url "$srcdir/tree-sitter"
	git -c protocol.file.allow=always submodule update
	popd
	cp -a "$_rockname"{,-5.5}
	cp -a "$_rockname"{,-5.4}
	cp -a "$_rockname"{,-5.3}
	cp -a "$_rockname"{,-5.2}
	cp -a "$_rockname"{,-5.1}
}

build() {
	for luaver in 5.1 5.2 5.3 5.4 5.5; do
		pushd "$_rockname-$luaver"
			luarocks make --pack-binary-rock --deps-mode none -- rockspec/$_rockspec
		popd
	done
}

_package() {
	cd "$_rockname-$1"
	luarocks --tree "$pkgdir/usr" \
		install --deps-mode none --no-manifest -- $_rock
}

package_lua-ltreesitter() {
	_package 5.5
}

package_lua54-ltreesitter() {
	_package 5.4
}

package_lua53-ltreesitter() {
	_package 5.3
}

package_lua52-ltreesitter() {
	_package 5.2
}

package_lua51-ltreesitter() {
	_package 5.1
}
