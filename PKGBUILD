# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=cerulean
pkgver=1.9.1
pkgrel=1
_rockrel=1
pkgdesc='an opinionated code formatter for the Teal programming language'
arch=(any)
url="https://github.com/efredriksson/$pkgname"
license=(MIT)
_luadeps=(filesystem
          tl)
depends=(lua54
         "${_luadeps[@]/#/lua54-}"
         teal)
makedepends=(luarocks)
_archive="$pkgname-$pkgver"
_rock="$_archive-$_rockrel.all.rock"
_rockspec="$_archive-$_rockrel.rockspec"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz"
        "https://luarocks.org/manifests/efredriksson/$_archive-1.rockspec")
sha256sums=('f6d026884a5d48aaeecf6333e122bd1b060d92ba83ad9e87a4cb17a3a5c0ef37'
            '550638b29e5cd171bba5eee2b25bc499309dd2a2ba3320f298ccd1a39d02ac10')

build() {
	cd "$_archive"
	make compile
	luarocks --lua-version 5.4 \
		make --pack-binary-rock --deps-mode none -- ../$_rockspec
}

package() {
	cd "$_archive"
	luarocks --lua-version 5.4 --tree "$pkgdir/usr" \
		install --deps-mode none --no-manifest -- $_rock
	sed -i -e "s!$pkgdir!!" "$pkgdir/usr/bin/ceru"
}
