# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

_pkgbase=cabrio
pkgname=$_pkgbase-git
pkgver=0.8.r227.7f00726
pkgrel=1
pkgdesc="Emulator front-end primarily designed for use with arcade cabinets (development version)"
url="http://cabrio-fe.org"
license=('GPL')
arch=('i686' 'x86_64')
depends=('zlib' 'sdl_gfx' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'ffmpeg' 'ffmpeg-compat' 'glu')
makedepends=('mesa')
source=($_pkgbase::"git+https://github.com/SteveMaddison/cabrio.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgbase
  # needs to be updated later, when repo has tags
  printf "0.8.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgbase

  # allow setting folders for install
  sed "s/^BIN_DIR=/#&/;s/^DATA_DIR=/#&/" -i Makefile
  # fix use of ffmpeg macro
  sed 's|AVCODEC_MAX_AUDIO_FRAME_SIZE|192000|' -i video.c
}

build() {
  cd $_pkgbase

  make BIN_DIR=/usr/bin DATA_DIR=/usr/share/cabrio
}

package() {
  cd $_pkgbase

  make BIN_DIR="$pkgdir/usr/bin" DATA_DIR="$pkgdir/usr/share/cabrio" install
}
