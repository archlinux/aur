# Maintainer: Alexandre Bouvier <contact@amb.tf>
_reponame=dosbox-pure
_pkgname=libretro-$_reponame
pkgname=$_pkgname-git
pkgver=1.0.preview5.r3.gf587236
pkgrel=1
epoch=1
pkgdesc="MS-DOS core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/schellingb/dosbox-pure"
license=('GPL-2.0-or-later')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
makedepends=('git' 'libgcc' 'libstdc++')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_reponame::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_reponame
	git describe --long --tags --abbrev=7 | sed 's/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd $_reponame
	# remove hardcoded optimization flags
	sed -Ei 's/-O([0123s]|fast)//' Makefile
	# use makepkg.conf flags
	sed -Ei 's/^(\s*(CFLAGS|LDFLAGS)\s*):=/\1+=/' Makefile
	# fix build with -Werror=format-security
	sed -i 's/-Wno-format//' Makefile
}

build() {
	cd $_reponame
	make
}

package() {
	depends+=('libgcc_s.so' 'libstdc++.so')

	cd $_reponame
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro dosbox_pure_libretro.so
}
