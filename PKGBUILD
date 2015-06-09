# Maintainer: Thomas Schneider <maxmusterm@gmail.com>

pkgname=libretro-mupen64plus-git
_gitname=mupen64plus-libretro
pkgver=3064.a0158bd
pkgrel=1
pkgdesc="libretro implementation of mupen64plus with dynarec (even for rpi)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/mupen64plus-libretro"
license=('custom' 'GPL' 'LGPL')
makedepends=('git')
source=("${_gitname}::git://github.com/libretro/${_gitname}.git"
	"https://raw.github.com/libretro/libretro-super/master/dist/info/mupen64plus_libretro.info")

md5sums=('SKIP'
	 'SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  if [ $CARCH == "armv6h" ];then
  platform=rpi make WITH_DYNAREC=arm
  elif [ $CARCH == "i686" ];then
  make WITH_DYNAREC=x86
  else
  make WITH_DYNAREC=$CARCH
  fi
}

package() {
  install -Dm644 "${srcdir}/mupen64plus_libretro.info" "${pkgdir}/usr/lib/libretro/libretro-mupen64plus.info"
  install -Dm644 "${_gitname}/mupen64plus_libretro.so" "${pkgdir}/usr/lib/libretro/libretro-mupen64plus.so"
}
