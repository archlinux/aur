# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Oliver Jaksch <arch-aur at com-in dot de>
_pkgname=libretro-neocd
pkgname=$_pkgname-git
pkgver=r167.5eca2c8
pkgrel=1
pkgdesc="SNK Neo Geo CD core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/neocd_libretro"
license=('LGPL-3.0-only')
groups=('libretro')
depends=('gcc-libs' 'glibc' 'libretro-core-info')
makedepends=('git' 'libchdr' 'libvorbis' 'zlib')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+$url.git"
	"use-system-libs.patch"
)
b2sums=(
	'SKIP'
	'6ed7fe918b2c2f35c587d1cdf4ca08fa0ca9362f64a32e4d1b8619645ead675d6beee30841ec0711002f68b898da8568a51520fbab8e4102630895e07cda870a'
)

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	mv deps/{libchdr/include/dr_libs,}
	patch -Np1 < ../use-system-libs.patch
	sed -i 's/-Ofast//' Makefile
}

build() {
	make -C $_pkgname
}

package() {
	depends+=('libchdr.so' 'libvorbisfile.so' 'libz.so')
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro $_pkgname/neocd_libretro.so
}
