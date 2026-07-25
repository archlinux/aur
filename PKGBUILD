# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Kars Wang <jaklsy g-mail>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=moonscript
pkgver=0.6.0
pkgrel=1
_rockrel=1
pkgdesc='A programmer friendly language that compiles to Lua'
arch=(any)
url="http://$pkgname.org"
_url="https://github.com/leafo/$pkgname"
license=(MIT)
_luadeps=(argparse
          filesystem
          lpeg)
depends=(lua
         "${_luadeps[@]/#/lua-}")
makedepends=(lua
             luarocks)
conflicts=(moon
           moonbit
           moonstone)
_archive="$pkgname-$pkgver"
_rock="$_archive-$_rockrel.all.rock"
_rockspec="$_archive-$_rockrel.rockspec"
source=("$_url/archive/refs/tags/v$pkgver/$_archive.tar.gz"
        "https://luarocks.org/manifests/leafo/$_archive-1.rockspec")
sha256sums=('b98e58f4657ffc2e730904da0b4034796ff16f08e4e6c47c681905fd56509037'
            'c5ac773ab9f9f76f033d34fa3c830b4b6e47921036c1b7beeb6b03de7851cf33')

build() {
	cd "$_archive"
	luarocks make --pack-binary-rock --deps-mode none -- ../$_rockspec
}

package() {
	cd "$_archive"
	luarocks --tree "$pkgdir/usr" \
		install --deps-mode none --no-manifest -- $_rock
	sed -i -e "s!$pkgdir!!" "$pkgdir/usr/bin/"{moon,moonc}
}
