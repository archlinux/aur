# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=cerulean
pkgver=1.9.2
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
sha256sums=('fcb46bc903aba73b6a5db013307e7ce1795d445a4776abb3b305f6aa16b8bb9a'
            'e2405b71c9d02dc969e84648856dedc347e08817e53c31f090a0ce4efefa4ca3')

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
