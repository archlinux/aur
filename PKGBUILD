# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-chailove
pkgname=$_pkgname-git
pkgver=1.1.0.r17.ge300ec2
pkgrel=1
pkgdesc='ChaiScript core'
arch=('arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/libretro/$_pkgname"
license=('MIT')
groups=('libretro')
depends=('gcc-libs' 'libretro-core-info')
makedepends=('chaiscript' 'cppcodec' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"git+$url.git"
	'git+https://github.com/ChaiScript/ChaiScript_Extras.git'
	'git+https://github.com/libretro/libretro-common.git'
	'git+https://github.com/libretro/libretro-deps.git'
	'git+https://github.com/icculus/physfs.git'
	'git+https://github.com/effolkronium/random.git'
	'git+https://github.com/libretro/sdl-libretro.git'
	'git+https://github.com/Grumbel/SDL_tty.git'
	'git+https://github.com/DanielGibson/Snippets.git'
	'git+https://github.com/nothings/stb.git'
	'git+https://github.com/mohaps/TinySHA1.git'
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	git submodule init vendor/{ChaiScript_Extras,libretro-common,libretro-deps,physfs,random,sdl-libretro,SDL_tty,Snippets,stb,TinySHA1}
	git config submodule.vendor/ChaiScript_Extras.url ../ChaiScript_Extras
	git config submodule.vendor/libretro-common.url ../libretro-common
	git config submodule.vendor/libretro-deps.url ../libretro-deps
	git config submodule.vendor/physfs.url ../physfs
	git config submodule.vendor/random.url ../random
	git config submodule.vendor/sdl-libretro.url ../sdl-libretro
	git config submodule.vendor/SDL_tty.url ../SDL_tty
	git config submodule.vendor/Snippets.url ../Snippets
	git config submodule.vendor/stb.url ../stb
	git config submodule.vendor/TinySHA1.url ../TinySHA1
	git submodule update
}

build() {
	CFLAGS="$CFLAGS -Wa,--noexecstack" make -C $_pkgname
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	make DESTDIR="$pkgdir" install
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname COPYING
}
