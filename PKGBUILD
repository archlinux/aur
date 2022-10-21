# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=luacheck-git
pkgver=1.0.0.r2.g81bb2f2
pkgrel=1
_rockrel=1
pkgdesc='A tool for linting and static analysis of Lua code'
arch=(any)
url="https://github.com/lunarmodules/${pkgname%-git}"
license=(MIT)
depends=(lua
         lua-filesystem
         lua-argparse)
makedepends=(luarocks
             git)
provides=("${pkgname%-git}=$pkgver")
conflicts=(${pkgname%-git})
optdepends=('lua-lanes: for parallel checking')
_archive="${pkgname%-git}"
_rock="$_archive-dev-$_rockrel.all.rock"
_rockspec="$_archive-dev-$_rockrel.rockspec"
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_archive"
	git describe --long --tags --abbrev=7 --match="v*.*.*" HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_archive"
	luarocks make --pack-binary-rock --deps-mode none -- $_rockspec
}

package() {
	cd "$_archive"
	luarocks --tree "$pkgdir/usr" \
		install --deps-mode none --no-manifest -- $_rock
	sed -i -e "s!$pkgdir!!" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
