# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_pkgname=libretro-snes9x
pkgname=$_pkgname-git
pkgver=r2653.5a40cd5
pkgrel=1
pkgdesc="Super Nintendo Entertainment System core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/snes9x"
license=('LicenseRef-Snes9x')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
makedepends=('git' 'libstdc++' 'zlib')
provides=("$_pkgname=1:${pkgver#r}")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd $_pkgname
	# remove hardcoded optimization flags
	sed -Ei 's/-O([0123s]|fast)//' libretro/Makefile
}

build() {
	cd $_pkgname
	make -C libretro LTO=
}

package() {
	depends+=('libstdc++.so' libz.so)

	cd $_pkgname
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro libretro/snes9x_libretro.so
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
