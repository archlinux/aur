# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: maz-1 <ohmygod19993 at gmail dot com>

pkgname=onscripter-gbk
_pkgname=${pkgname%-gbk}
pkgver=8.951935b
_ons_version="20130317"
pkgrel=2
epoch=1
pkgdesc="A game engine compatible to NScripter with GBK patch, which is used to create and perform visual novel games"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://github.com/natdon/ONScripter-CN"
license=('GPL2')
depends=('bzip2'
         'sdl_image'
         'sdl_mixer'
         'sdl_ttf'
         'lua51'
         'fontconfig'
         'libjpeg-turbo'
         'libvorbis'
         'smpeg')
source=("${pkgname}::git://github.com/natdon/ONScripter-CN.git#commit=951935b05a")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"

  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$pkgname"/jni/app_onscripter-32bpp
  target=$(ls | grep '^onscripter-' | grep -v 'tar.gz' | sort | tail -n1)
  cd "$target"

  echo "LIBS = `sdl-config --libs` `smpeg-config --libs` -lSDL_ttf -lSDL_image -lSDL_mixer -lbz2 -ljpeg -lm -logg -lvorbis -lvorbisfile
LIBS += -llua5.1 -lfontconfig
CFLAGS += -c -DLINUX -DUSE_OGG_VORBIS -DUSE_LUA -DUSE_FONTCONFIG
CFLAGS += `sdl-config --cflags` `smpeg-config --cflags` -I/usr/include/lua5.1
OBJSUFFIX = .o
#EXT_OBJS = LUAHandler.o
CC = g++
LD = g++ -o
TARGET = onscripter
include Makefile.onscripter" > Makefile

  make
  mv ${_pkgname} "$srcdir/$pkgname/"
}

package() {
  cd "$pkgname"

  install -Dm755 ${_pkgname} $pkgdir/usr/bin/${pkgname}
}

# vim: set sw=2 ts=2 et:

