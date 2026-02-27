# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>
_pkgname=libretro-fbneo
pkgname=$_pkgname-git
pkgver=1.0.0.02.r7631.g8d2b25c
pkgrel=1
epoch=1
pkgdesc="FinalBurn Neo multi-arcade core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/FBNeo"
license=('LicenseRef-FBNeo')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
makedepends=('git' 'libgcc' 'libstdc++' 'zlib')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd $_pkgname/src/burner/libretro
	# remove hardcoded optimization flags
	sed -Ei 's/-O([0123s]|fast)//' Makefile
	make generate-files
}

build() {
	cd $_pkgname/src/burner/libretro
	make EXTERNAL_ZLIB=1
}

package() {
	depends+=('libgcc_s.so' 'libstdc++.so' 'libz.so')

	cd $_pkgname/src
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro burner/libretro/fbneo_libretro.so
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname license.txt
}
