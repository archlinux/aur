# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Fernando Carmona Varo <ferkiwi @t gmail dot com>
# Contributor: BenObiWan <benobiwan @t gmail dot com>

pkgname=solarus-git
pkgver=1.5.3.r380.gfd4a0e295
pkgrel=1
pkgdesc="An open-source adventure 2D game engine (development version)"
arch=('i686' 'x86_64')
url="http://www.solarus-games.org/"
license=('GPL3')
depends=('sdl2_image' 'sdl2_ttf' 'luajit' 'physfs' 'openal' 'libmodplug' 'libvorbis'
         'hicolor-icon-theme' 'qt5-base')
makedepends=('git' 'cmake' 'ninja' 'qt5-tools' 'glm')
optdepends=('zsdx-git: Free 2D Zelda fangame'
            'zsxd-git: Parodic Zelda fangame'
            'zelda-mercuris-chest: Zelda fangame (in development)'
            'zelda-xd2: April Fools game'
            'zelda-roth-se: Remake of Zelda Return of the Hylian'
            'zelda-olb-se: Remake of Zelda Oni Link Begins')
provides=('solarus-engine' 'solarus')
conflicts=('solarus')
source=($pkgname::'git+https://gitlab.com/solarus-games/solarus.git')
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  local _tag=$(git tag -l 'v*' | sort -r | head -n1 | tr -cd 0-9.)
  local _rev=$(git rev-list --count v${_tag}..HEAD)
  local _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash"  
}

prepare() {
  cd $pkgname

  rm -rf build
  mkdir build
}

build() {
  cd $pkgname/build

  cmake .. -GNinja -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release
  ninja
}

check() {
  ninja -C $pkgname/build test
}

package() {
  DESTDIR="$pkgdir/" ninja -C $pkgname/build install
}
