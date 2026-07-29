# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=teal-language-server
pkgver=0.2.1
pkgrel=1
_rockrel=1
pkgdesc='A language server for Teal, a typed dialect of Lua'
arch=(any)
url="https://github.com/teal-language/$pkgname"
license=(MIT)
_luadeps=(argparse
          cjson
          filesystem
          luv
          lusc_luv
          ltreesitter
          tl)
depends=(lua54
         "${_luadeps[@]/#/lua54-}"
         teal)
makedepends=(luarocks)
_archive="$pkgname-$pkgver"
_rock="$_archive-$_rockrel.all.rock"
_rockspec="$_archive-$_rockrel.rockspec"
source=("$url/archive/refs/tags/$pkgver/$_archive.tar.gz")
sha256sums=('48fecc37cdbe20f0e87863fd40d25e54a7ef6aa3610a55a9f81aaf4805a63159')

build() {
	cd "$_archive"
	make compile
	luarocks --lua-version 5.4 \
		make --pack-binary-rock --deps-mode none -- $_rockspec
}

package() {
	cd "$_archive"
	luarocks --lua-version 5.4 --tree "$pkgdir/usr" \
		install --deps-mode none --no-manifest -- $_rock
	sed -i -e "s!$pkgdir!!" "$pkgdir/usr/bin/$pkgname"
}
