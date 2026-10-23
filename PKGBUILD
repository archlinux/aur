# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Kars Wang <jaklsy g-mail>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=moonscript
pkgver=0.8.0
pkgrel=1
_rockrel=1
pkgdesc='A programmer friendly language that compiles to Lua'
arch=(x86_64)
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
_rock="$_archive-$_rockrel.linux-$CARCH.rock"
_rockspec="$_archive-$_rockrel.rockspec"
source=("$_url/archive/refs/tags/v$pkgver/$_archive.tar.gz"
        "https://luarocks.org/manifests/leafo/$_archive-1.rockspec")
sha256sums=('0458ba86359c9089f823f81e4198ea3f7d57c2f2773fb8a1364940ebdd802ac5'
            '511deed7a87c31f36760e2bcc9fb856f0c0f0733e13d5ff05fadd58f8c87754c')

build() {
	cd "$_archive"
	luarocks make --pack-binary-rock --deps-mode none -- ../$_rockspec
}

package() {
	cd "$_archive"
	luarocks --tree "$pkgdir/usr" \
		install --deps-mode none --no-manifest -- $_rock
	sed -i -e "s!$pkgdir!!g" "$pkgdir/usr/bin/"{moon,moonc}
}
