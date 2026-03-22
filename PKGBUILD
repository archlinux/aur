# Maintainer: Marco "MegaDrive" Matos <marco.ufs@gmail.com>
# Contributor: Johan PONIN <johan.ponin.pro at gmail dot com>
# Contributor: Yamashita Ren
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=libbpg
pkgver=0.9.8
pkgrel=4
pkgdesc='BPG Image Encoder and Decoder'
arch=('x86_64' 'i686')
url='http://bellard.org/bpg/'
license=('BSD' 'LGPL')
depends=('libpng' 'libjpeg-turbo' 'sdl_image')
makedepends=('yasm' 'cmake')
_x265url='https://bitbucket.org/multicoreware/x265_git/get/'
_x265commit='8be7dbf'
source=(
  "$url$pkgname-$pkgver.tar.gz"
  "x265.zip::$_x265url$_x265commit.zip"
)
md5sums=('1c8258bc6de26bbae7c688944a2023ac'
         '76dabfa04fe3be1b0e1801dba9952589')

prepare() {
  sed -i 's/$(CMAKE_OPTS)/$(CMAKE_OPTS) -DENABLE_LIBNUMA=OFF/' "$pkgname-$pkgver/Makefile"
  sed -i 's/^CFLAGS+=-I.$/CFLAGS+=-I. -fPIC/' "$pkgname-$pkgver/Makefile"

  cd "$srcdir"

  rm -rf "$pkgname-$pkgver/x265"
  cp -a $(find ./ -maxdepth 1 -mindepth 1 -type d -name "multicoreware-x265_git-${_x265commit}*" | head -n1) "$pkgname-$pkgver/x265"

  if ! grep -q '^#include <string.h>$' "$pkgname-$pkgver/bpgdec.c"; then
    sed -i '/^#include <png.h>/a #include <string.h>\n#include <strings.h>' \
      "$pkgname-$pkgver/bpgdec.c"
  fi
}

build() {
  make USE_JCTVC=Y -C "$pkgname-$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 bpgdec "$pkgdir/usr/bin/bpgdec"
  install -Dm755 bpgenc "$pkgdir/usr/bin/bpgenc"
  install -Dm755 bpgview "$pkgdir/usr/bin/bpgview"
  install -Dm644 libbpg.a "$pkgdir/usr/lib/libbpg.a"
  install -Dm644 libbpg.h "$pkgdir/usr/include/libbpg.h"
  install -Dm644 bpgenc.h "$pkgdir/usr/include/bpgenc.h"
}
