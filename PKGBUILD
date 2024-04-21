# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=apotris
pkgname=$_pkgname-git
pkgver=3.4.6.r788.g73c0cd8
pkgrel=1
pkgdesc="A block stacking puzzle game for the Game Boy Advance (Linux port)"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://apotris.com/"
license=('GPL-3.0-only')
depends=('bash' 'glibc' 'sdl2')
makedepends=(
	'git'
	'libogg'
	'libopenmpt'
	'meson'
	'opus'
	'python'
	'sdl2_mixer'
	'xxd'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+https://gitea.com/akouzoukos/apotris.git#branch=ports"
	'soloud::git+https://github.com/akouzoukos/soloud.git'
	'Tilengine::git+https://github.com/akouzoukos/Tilengine.git'
	"$_pkgname.sh"
	"$_pkgname-install.patch"
	"$_pkgname-use-system-libs.patch"
	'soloud-use-system-libs.patch'
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'6a5b652537461135895820391beb20bb2e64e312f08ddbd9ea8d313047118693556df26e89019e81b26c6650388597eebbc8ae4cf824739aadb41121d728ed80'
	'9da61fbb68d966d4ec46becf53da1cb6c55b0a6f105f6cc8145c11b2a081bdcbdc522bff6b213fa2a7ab21aea12db11d77dae0468521ad3d1ee2117863d42b23'
	'ec4ed45e01dc83a518b84cbfdba9d271c5f366981fce2e6e624b7e112b9645340132d0ab72b50f1876c2ff712e36a1efd45205f1bdb1de211af1301a4c4163a4'
	'497d9ed7ed0c5d3bce10d23a14e5a6d4b39125045290048f8a4b813fd81767f9a459636c5e84fd17b3b0802fee6fd0afa0bddb0dbda7c04484a39a2bc176a0ba'
)

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	git config submodule.subprojects/SoLoud.url ../soloud
	git config submodule.tilengine.url ../Tilengine
	git -c protocol.file.allow=always submodule update
	patch -Np1 < ../$_pkgname-use-system-libs.patch
	patch -Np1 < ../$_pkgname-install.patch
	sed -i 's/data_/apotris_&/' tools/callBin2S.py
	cd subprojects/SoLoud
	patch -Np1 < ../../../soloud-use-system-libs.patch
}

build() {
	arch-meson -D b_lto=false build-linux $_pkgname
	meson compile -C build-linux
}

package() {
	depends+=('libopenmpt.so')
	# shellcheck disable=SC2154
	meson install -C build-linux --destdir "$pkgdir"
	install -Dm755 $_pkgname.sh "$pkgdir"/usr/bin/$_pkgname
}
