# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>
_pkgname=libretro-fbneo
pkgname=$_pkgname-git
pkgver=1.0.0.02.r1918.gfb4d2c261
pkgrel=1
epoch=1
pkgdesc="FinalBurn Neo multi-arcade core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/FBNeo"
license=('custom')
groups=('libretro')
depends=('gcc-libs' 'libretro-core-info' 'zlib')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname/src/burner/libretro
	sed -i 's/-O[0123s]//;s/-Ofast//' Makefile
	make generate-files
}

build() {
	make -C $_pkgname/src/burner/libretro EXTERNAL_ZLIB=1
}

package() {
	cd $_pkgname/src
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro burner/libretro/fbneo_libretro.so
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname license.txt
}
