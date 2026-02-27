# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Oliver Jaksch <arch-aur at com-in dot de>
# Contributor: Mike Polvere <mic.tjs@gmail.com>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>
# Contributor: Lauri Niskanen <ape@ape3000.com>
_pkgname=libretro-gambatte
pkgname=$_pkgname-git
pkgver=r1082.9fe223d
pkgrel=1
epoch=1
pkgdesc="Nintendo Game Boy/Game Boy Color core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/gambatte-libretro"
license=('GPL-2.0-only')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
makedepends=('git' 'libstdc++')
provides=("$_pkgname=${pkgver#r}")
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
	sed -Ei 's/-O([0123s]|fast)//' Makefile.libretro
}

build() {
	cd $_pkgname
	make
}

package() {
	depends+=('libstdc++.so')

	cd $_pkgname
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro gambatte_libretro.so
}
