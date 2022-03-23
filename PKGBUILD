# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=luacheck
pkgver=0.25.0
pkgrel=3
pkgdesc='A tool for linting and static analysis of Lua code'
arch=(any)
url="https://github.com/lunarmodules/$pkgname"
license=(MIT)
depends=(lua
         lua-filesystem
         lua-argparse)
makedepends=(luarocks)
optdepends=('lua-lanes: for parallel checking')
_archive="$pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('4507648bee9e67b2d30058f7befbbb58cd387a2503f4f348c2aae6e93417aaa1')

build() {
	cd "$_archive"
	luarocks make --pack-binary-rock --deps-mode=none --no-manifest -- $pkgname-*.rockspec
}

package() {
	cd "$_archive"
	luarocks install --tree="$pkgdir/usr" --deps-mode=none --no-manifest -- $pkgname-*.all.rock
	sed -i -e "s!$pkgdir!!" "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
