# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=cerulean
pkgver=1.8.2
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
sha256sums=('f3a7f1cbb8e5caee5b12a5b5945b0752bcb1eb36ad6158e7874aa56373942e53'
            '2f74d5949ca71c69879790bb396579ef6d193e18e5e151d794932dff90b54581')

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
