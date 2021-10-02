# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>
_pkgname=libretro-fbneo
pkgname=$_pkgname-git
pkgver=1.0.0.02.r901.g9278b650f
pkgrel=1
epoch=1
pkgdesc="FinalBurn Neo multi-arcade core"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/libretro/FBNeo"
license=('custom')
groups=('libretro')
depends=('gcc-libs' 'libretro-core-info')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=('libretro-fbalpha-git')
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_pkgname/src/burner/libretro
	make generate-files
	if [[ $CARCH == x86_64 ]]; then
		make USE_X64_DRC=1
	else
		make
	fi
}

package() {
	cd $_pkgname/src
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro burner/libretro/fbneo_libretro.so
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname license.txt
}
