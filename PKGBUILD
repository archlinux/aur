# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-atari800-git
pkgver=139.9d2874b
pkgrel=1
pkgdesc="libretro implementation of Atari800 v3.1.0 (Atari 5200/400/800/XL/XE) (WIP)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/libretro-atari800"
license=('GPL2')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info')
makedepends=('git')

_libname=atari800_libretro
_gitname=libretro-atari800
source=("git+https://github.com/libretro/${_gitname}.git"
	"cfg.patch"
	"joycfg.patch")
sha256sums=('SKIP'
	'41e0c608d07cdc3228d37a7a29fd40b6629e964c13d14ba413fa84e956ef3777'
	'd30794556b622c757dbafb5ce988547967004bd2d779c74e28802f9dd78a167f')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd ${_gitname}
  git submodule init
  git submodule update
  # rename config file to not interfere with original atari800
  patch -p0 < "../cfg.patch"
  patch -p0 < "../joycfg.patch"
  make -f Makefile
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
