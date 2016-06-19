# Maintainer: Sam S. <smls75@gmail.com>

pkgname=aquaria-ose
_osever=1.002
pkgver=1.1.3+o$_osever
pkgrel=1
pkgdesc="A 2D fantasy underwater action-adventure game (Open Source Edition of the engine = original v1.1.3 + many improvements)"
url='http://www.bit-blot.com/forum/index.php?topic=4313.0'
arch=('i686' 'x86_64')
license=('GPL')
depends=('sdl2' 'openal' 'gcc-libs')
makedepends=('cmake')
conflicts=('aquaria-hib-git' 'aquaria-hib-hg' 'aquaria' 'aquaria-hib' 'aquaria-git' 'aquaria-ose-git')
replaces=('aquaria')
optdepends=('aquaria-data-hib: Game data from the Humble Bundle release')
install="$pkgname.install"

_repo=Aquaria
_tag="OSE-v$_osever"
source=("https://github.com/AquariaOSE/$_repo/archive/$_tag.tar.gz"
        "aquaria-ose.desktop")
md5sums=('edb90261243611a20130b4bd9c2d6a13'
         '0d1457aa0fae8ded40c011a7d766e46f')

_folder="$_repo-$_tag"
build() {
  cd $_folder
  
  # Patch (TODO: remove post 1.002, it's already fixed in master)
  awk -i inplace '{ print (102 == NR ? "// " : ""), $0; }' Aquaria/Main.cpp
  
  # Make it compile with GCC 6.x
  export CXXFLAGS="$CXXFLAGS -fpermissive"
  
  # Compile
  cmake -DAQUARIA_DEFAULT_DATA_DIR=/usr/share/aquaria \
        -DAQUARIA_EXTRA_DATA_DIR=/usr/share/aquaria/override \
        -DAQUARIA_OVERRIDE_VERSION_STRING="Aquaria OSE $_osever (based on Aquaria v1.1.3)" \
        -DAQUARIA_USE_SDL2=1
  make
}

package() {
  cd "$pkgdir"

  # Install executable
  install -Dm755 "$srcdir/"$_folder/aquaria usr/bin/aquaria

  # Install some additional game files needed by the executable
  mkdir -p usr/share/aquaria/override
  cp -r "$srcdir"/$_folder/{game_scripts,files}/* usr/share/aquaria/override

  # Install desktop entry
  install -Dm644 "$srcdir"/$pkgname.desktop usr/share/applications/$pkgname.desktop
}
