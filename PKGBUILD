# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-genesis-plus-gx-wide
pkgname=$_pkgname-git
pkgver=r1609.04e9a4d
pkgrel=1
pkgdesc="Sega CD/Game Gear/Master System/Mega Drive/SG-1000 core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/Genesis-Plus-GX-Wide"
license=('custom')
groups=('libretro')
depends=('glibc' 'libretro-core-info' 'zlib')
makedepends=('git' 'libchdr' 'libvorbis')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+$url.git"
	'unbundle-libs.patch'
)
b2sums=(
	'SKIP'
	'ee0018de6c38382e4b6b95e71224d13001b9d13f808d09515c1f168f7255b5983b34842aeadb0fa0c9c47fac00c1196add9fd401f46b6e884b18fa26173a9419'
)

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	patch -Np1 < ../unbundle-libs.patch
	sed -i 's/-O[0123s]//;s/-Ofast//' Makefile.libretro
}

build() {
	make -C $_pkgname -f Makefile.libretro SHARED_LIBVORBIS=1
}

package() {
	depends+=('libchdr.so' 'libvorbisfile.so')
	cd $_pkgname
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro genesis_plus_gx_wide_libretro.so
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE.txt
}
