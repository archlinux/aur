# Maintainer: Sam S. <smls75@gmail.com>

pkgname=aquaria-ose-git
pkgver=1.1.3+g485.8d6b65c
_basever=1.1.3
pkgrel=1
pkgdesc="A 2D fantasy underwater action-adventure game (improved engine a.k.a. Open Source Edition)"
url='https://github.com/AquariaOSE/Aquaria'
arch=('i686' 'x86_64')
license=('GPL')
depends=('sdl2' 'openal' 'gcc-libs')
makedepends=('cmake')
conflicts=('aquaria-hib-git' 'aquaria-hib-hg' 'aquaria' 'aquaria-git')
replaces=('aquaria-hib-git' 'aquaria-hib-hg' 'aquaria' 'aquaria-git')
install="$pkgname.install"

source=('git://github.com/AquariaOSE/Aquaria.git' "aquaria-ose.desktop")
md5sums=('SKIP' '8677297d97cee364ca63652503ed6e62')

_gitname=Aquaria

pkgver() {
  cd $_gitname
  # Automatically generate package version from git commit number
  echo $_basever+g$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $_gitname
  cmake -DAQUARIA_DEFAULT_DATA_DIR=/usr/share/aquaria \
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
  install -Dm644 "$srcdir/$pkgname.desktop" usr/share/applications/$pkgname.desktop
}
