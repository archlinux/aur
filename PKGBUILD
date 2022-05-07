# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

_pkgname=penlight
pkgname=("lua-$_pkgname-git" "lua53-$_pkgname-git" "lua52-$_pkgname-git" "lua51-$_pkgname-git")
pkgver=1.12.0.r9.ga7b9f88
pkgrel=1
pkgdesc='Lua libraries for on input data handling, functional programming, and OS interface'
url="https://github.com/lunarmodules/${_pkgname^}"
arch=(any)
license=(MIT)
_luadeps=(filesystem)
makedepends=(git
             lua
             lua51
             lua52
             lua53
             luarocks)
options=(debug)
_rockspec="$_pkgname-dev-1.rockspec"
_rock="${_rockspec%.rockspec}.all.rock"
source=("$_pkgname::git+https://github.com/lunarmodules/Penlight.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 HEAD |
		sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	for LUAVER in 5.{1,2,3,4}; do
		luarocks --lua-version "$LUAVER" \
			make --pack-binary-rock --deps-mode none -- "$_rockspec"
		install -Dm0644 -t "lua-$LUAVER/" "$_rock"
	done
}

_package() {
	cd "$_pkgname"
	depends=("${pkgname%-*}" "${_luadeps[@]/#/${pkgname%-*}-}")
	provides=("${pkgname/%-git}")
	conflicts=("${pkgname/%-git}")
	luarocks --lua-version "$1" --tree "$pkgdir/usr/" \
		install --deps-mode none --no-manifest -- "lua-$1/$_rock"
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" CONTRIBUTING.md CHANGELOG.md README.md
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/manual/" docs/manual/*
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/examples/" examples/*
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}

package_lua-penlight-git() {
	_package 5.4
}

package_lua51-penlight-git() {
	_package 5.1
}

package_lua52-penlight-git() {
	_package 5.2
}

package_lua53-penlight-git() {
	_package 5.3
}
