# Maintainer: quellen <lodgerz@gmail.com>

pkgname=libretro-fsuae-git
pkgver=1712.7990f7ad
pkgrel=1
pkgdesc="A port of the Commodore Amiga Emulator to libretro (WIP)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/libretro-fsuae"
license=('GPL3')
groups=('libretro')
depends=('zlib' 'libretro-core-info' 'libmpeg2')
makedepends=('git')

_libname=fsuae_libretro
_gitname=libretro-fsuae
source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  CFLAGS="-march=${CARCH/_/-} -mtune=generic -O2 -pipe"
  CXXFLAGS="-march=${CARCH/_/-} -mtune=generic -O2 -pipe"
  ./autogen.sh
  ./configure
  make gen
  make clean
  make
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}