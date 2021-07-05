# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=libretro-fbneo
pkgname=$_pkgname-git
pkgver=1.0.0.02.r427.g8f6331c71
pkgrel=1
epoch=1
pkgdesc="FinalBurn Neo multi-arcade core"
arch=('arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/libretro/FBNeo"
license=('custom')
groups=('libretro')
depends=('gcc-libs' 'libretro-core-info')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=('libretro-fbalpha-git')
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_pkgname/src/burner/libretro
	make generate-files
	if [[ $CARCH == x86_64 ]] && false; then
		make USE_X64_DRC=1 # build fail
	else
		make
	fi
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro src/burner/libretro/fbneo_libretro.so
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$_pkgname src/license.txt
}
