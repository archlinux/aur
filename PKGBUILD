# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Kars Wang <jaklsy g-mail>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=moonscript
pkgver=0.7.0
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
sha256sums=('98fcf86d47694c81ccf9012e310f86d443ddf516e90b267ea33eb7ff1b0747c4'
            'fd17e182432124f6a1f4f5a6ab714a544ba99791825bfc400723fd5baac330b8')

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
