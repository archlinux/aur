# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Fernando Carmona Varo <ferkiwi @t gmail dot com>
# Contributor: BenObiWan <benobiwan @t gmail dot com>

pkgname=solarus-git
pkgver=1.3.0.r610.g227aa56
pkgrel=1
pkgdesc="An open-source Zelda-like 2D game engine used by the games zsxd and zsdx (development version)"
arch=('i686' 'x86_64')
url="http://www.solarus-engine.org/"
license=('GPL3')
depends=('sdl2_image' 'sdl2_ttf' 'luajit' 'physfs' 'openal' 'libmodplug' 'libvorbis')
makedepends=('git' 'cmake')
optdepends=('zsxd-git: Default Quest'
            'zsdx-git: Another Quest')
provides=('solarus-engine' 'solarus')
conflicts=('solarus')
source=($pkgname::'git+https://github.com/christopho/solarus.git')
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd $pkgname

  rm -rf build
  mkdir build

  # small fix
  sed 's/"${SDL2MAIN_LIBRARY}"//' -i tests/CMakeLists.txt
}

build() {
  cd $pkgname/build

  cmake .. -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release \
    -DDEFAULT_QUEST=/usr/share/solarus/zsdx
  make
}

check() {
  make -C $pkgname/build test
}

package() {
  make -C $pkgname/build DESTDIR="$pkgdir/" install

  # provide compatibility with old quest packages
  ln -s solarus_run "$pkgdir"/usr/bin/solarus
}
