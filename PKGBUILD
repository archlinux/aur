# Maintainer: Alexandre Bouvier <contact@amb.tf>
_reponame=dosbox-pure
_pkgname=libretro-$_reponame
pkgname=$_pkgname-git
pkgver=0.9.1.r0.g562869f
pkgrel=1
epoch=1
pkgdesc="MS-DOS core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/schellingb/dosbox-pure"
license=('GPL2')
groups=('libretro')
depends=('gcc-libs' 'libretro-core-info')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_reponame::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_reponame
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	sed -E \
		-e 's/^(\s*(CFLAGS|LDFLAGS)\s*):=/\1+=/' \
		-e 's/-Wno-format//' \
		-e 's/-O[0123s]//;s/-Ofast//' \
		-i $_reponame/Makefile
}

build() {
	make -C $_reponame
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro $_reponame/dosbox_pure_libretro.so
}
