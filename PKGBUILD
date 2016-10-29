# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Fernando Carmona Varo <ferkiwi @t gmail dot com>
# Contributor: BenObiWan <benobiwan @t gmail dot com>

pkgname=solarus-git
pkgver=1.5.0.r81.gd0601b4
pkgrel=1
pkgdesc="An open-source Zelda-like 2D game engine used by the games zsxd and zsdx (development version)"
arch=('i686' 'x86_64')
url="http://www.solarus-engine.org/"
license=('GPL3')
depends=('sdl2_image' 'sdl2_ttf' 'luajit' 'physfs' 'openal' 'libmodplug' 'libvorbis')
makedepends=('git' 'cmake')
optdepends=('zsxd-git: Free 2D Zelda fangame Quest'
            'zsdx-git: Free 2D Zelda fangame Quest with humoristic characters')
provides=('solarus-engine' 'solarus')
conflicts=('solarus')
source=($pkgname::'git+https://github.com/christopho/solarus.git')
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

  cmake .. -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release
  make
}

check() {
  make -C $pkgname/build test
}

package() {
  make -C $pkgname/build DESTDIR="$pkgdir/" install
}
