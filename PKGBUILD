# Maintainer: Sam S. <smls75@gmail.com>

pkgname=aquaria-ose-git
_installname=aquaria-ose
pkgver=1.1.3+o1.002+g611.96206dd
_osever=1.002
_basever=1.1.3+o$_osever
pkgrel=1
pkgdesc="A 2D fantasy underwater action-adventure game (Open Source Edition of the engine = original v1.1.3 + many improvements)"
url='https://github.com/AquariaOSE/Aquaria'
arch=('i686' 'x86_64')
license=('GPL')
depends=('sdl2' 'openal' 'gcc-libs')
makedepends=('cmake')
conflicts=('aquaria-hib-git' 'aquaria-hib-hg' 'aquaria' 'aquaria-hib' 'aquaria-git' 'aquaria-ose')
replaces=('aquaria-git' 'aquaria-hib-git' 'aquaria-hib-hg')
optdepends=('aquaria-data-hib: Game data from the Humble Bundle release')
install="$_installname.install"

source=('git://github.com/AquariaOSE/Aquaria.git' "aquaria-ose.desktop")
md5sums=('SKIP' '0d1457aa0fae8ded40c011a7d766e46f')

_gitname=Aquaria

pkgver() {
  cd $_gitname
  # Automatically generate package version from git commit number
  echo $_basever+g$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $_gitname
  _ver="$_osever revision $(git rev-parse --short HEAD)"
  
  # Make it compile with GCC 6.x
  export CXXFLAGS="$CXXFLAGS -fpermissive"
  
  cmake -DAQUARIA_DEFAULT_DATA_DIR=/usr/share/aquaria \
        -DAQUARIA_EXTRA_DATA_DIR=/usr/share/aquaria/override \
        -DAQUARIA_OVERRIDE_VERSION_STRING="Aquaria OSE $_ver (based on Aquaria v1.1.3)" \
        -DAQUARIA_USE_SDL2=1
  make
}

package() {
  cd $pkgdir

  # Install executable
  install -Dm755 "$srcdir/$_gitname/aquaria" usr/bin/aquaria

  # Install some additional game files needed by the executable
  mkdir -p usr/share/aquaria/override
  cp -r "$srcdir/$_gitname"/{game_scripts,files}/* usr/share/aquaria/override

  # Install desktop entry
  install -Dm644 "$srcdir"/$_installname.desktop \
                 usr/share/applications/$_installname.desktop
}
