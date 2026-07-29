# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=cerulean
pkgver=1.8.0
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
sha256sums=('6f591ab7b45ffcfcd3b0d7e942cf85abdbb1618792adaee2e592ef64a93ed4cc'
            '8b0942f26b001d1b344906374b18cc7461944deb89cdc67d48412f7cde9459ab')

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
