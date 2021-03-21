# Maintainer: Tilla <carlosfritz@posteo.net>
pkgname=libretro-dosbox-svn
pkgver=4411.97425232
pkgrel=1
pkgdesc="Libretro implementation of DOSBox (SVN Version)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/dosbox-svn"
license=('GPL2')
groups=('libretro')
depends=('libretro-core-info' 'gcc-libs' 'sdl' 'sdl_net')
makedepends=('git')
_libname=dosbox_svn_libretro
_gitname=dosbox-svn
source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  git submodule update --init
  cd libretro
  if [ $CARCH == "i686" ]; then
    make -j8 WITH_DYNAREC=x86
  elif [[ $CARCH =~ ^(armv6h|armv7h)$ ]]; then
    make -j8 WITH_DYNAREC=arm
  else
    make -j8 WITH_DYNAREC=$CARCH
  fi
}

package() {
  install -Dm644 "${_gitname}/libretro/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
