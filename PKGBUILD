# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>
# This package builds and installs all cores for RetroArch via
# libretro-super.
# Alternatively, use the core update in RetroArch.

pkgname=libretro-super
pkgver=20160910
pkgrel=1
#epoch=1
pkgdesc='Reference frontend for the libretro API (Git-latest)'
arch=('i686' 'x86_64')
url='http://www.libretro.com/'
license=('GPL')
groups=('libretro')
depends=('libxml2' 'freetype2' 'ffmpeg' 'nvidia-cg-toolkit' 'libgudev' 'zlib' 'xdg-utils-git')
makedepends=('git')
optdepends=('retroarch-git')
source=('git+https://github.com/libretro/libretro-super.git')
sha256sums=('SKIP')

build() {

  cd libretro-super

  # Disable fetches and cores we don't want
  # sed -i 's|register_core "bsnes"|#register_core "bsnes"|g' "rules.d/core-rules.sh"

  # Don't register or fetch RetroArch
  sed -i 's|\. \"$BASE_DIR\/rules\.d/player-rules\.sh\"|#\. \"$BASE_DIR\/rules\.d/player-rules\.sh\"|g' "libretro-fetch.sh"
  sed -i 's/libretro_players=\"retroarch\"/#libretro_players=\"retroarch\"/g' "libretro-fetch.sh"

  # fetch cores
  ./libretro-fetch.sh 

  #  build cores
  ./libretro-build.sh

}

package() {

  cd libretro-git

  make DESTDIR="${pkgdir}" install

  install -m 644 *.{so} "${pkgdir}"/usr/lib/libretro/

}

# vim: ts=2 sw=2 et:

