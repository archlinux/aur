# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=luacheck-git
pkgver=0.25.0.r42.gca770a4
pkgrel=1
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
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_archive"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_archive"
	luarocks make --pack-binary-rock --deps-mode=none --no-manifest -- ${pkgname%-git}-*.rockspec
}

package() {
	cd "$_archive"
	luarocks install --tree="$pkgdir/usr" --deps-mode=none --no-manifest -- ${pkgname%-git}-*.all.rock
	sed -i -e "s!$pkgdir!!" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
