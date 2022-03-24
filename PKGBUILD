# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=luacheck
pkgver=0.26.0
pkgrel=1
_rockrel=1
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
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('78b74cae0e94155e500755c8e60d921ee7250cfec2acd8ab4df480625c425594')

build() {
	cd "$_archive"
	luarocks make --pack-binary-rock --deps-mode=none --no-manifest -- rockspecs/$pkgname-$pkgver-$_rockrel.rockspec
}

package() {
	cd "$_archive"
	luarocks install --tree="$pkgdir/usr" --deps-mode=none --no-manifest -- $pkgname-$pkgver-$_rockrel.all.rock
	sed -i -e "s!$pkgdir!!" "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
