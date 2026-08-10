# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=cerulean
pkgver=1.8.1
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
sha256sums=('3125a1224e33fc4a83be3113f6aefac5f2bec7235f239b52318e991fca15986f'
            '520a979e9d8657e74e3e887340484e08b7a8ed73f1051f3bbe65d952e7de1185')

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
