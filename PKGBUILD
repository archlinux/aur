# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-minivmac
pkgname=$_pkgname-git
pkgver=r65.e7fcfef
pkgrel=1
pkgdesc="Apple Macintosh II core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/libretro-minivmac"
license=('GPL-2.0-only')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
makedepends=('git')
provides=("$_pkgname=${pkgver#r}")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+$url.git"
	'libretro-common::git+https://github.com/libretro/libretro-common.git'
)
b2sums=(
	'SKIP'
	'SKIP'
)

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	git config submodule.libretro-common.url ../libretro-common
	git -c protocol.file.allow=always submodule update
	sed -i 's/-O[0123s]//;s/-Ofast//' Makefile
}

build() {
	make -C $_pkgname
}

package() {
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro $_pkgname/minivmac_libretro.so
}
