# Maintainer: Sam S. <smls75@gmail.com>

pkgname=aquaria-ose
pkgver=1.002
pkgrel=1
_gitrev=b86133f
pkgdesc="A 2D fantasy underwater action-adventure game (Open Source Edition of the engine = official v1.1.3 + many improvements)"
url='http://www.bit-blot.com/forum/index.php?topic=4313.0'
arch=('i686' 'x86_64')
license=('GPL')
depends=('sdl2' 'openal' 'gcc-libs')
makedepends=('cmake')
optdepends=('aquaria-data-hib: Game data from the Humble Bundle release')
conflicts=('aquaria-hib-git' 'aquaria-hib-hg' 'aquaria' 'aquaria-git' 'aquaria-ose-git')
replaces=('aquaria-hib-git' 'aquaria-hib-hg' 'aquaria' 'aquaria-git')
install="$pkgname.install"

source=("$_gitrev.tar.gz::https://github.com/AquariaOSE/Aquaria/tarball/$_gitrev"
        "aquaria-ose.desktop")
md5sums=('970fb36585114c9b0ac6d34dfdc3de65'
         '0d1457aa0fae8ded40c011a7d766e46f')

_folder=AquariaOSE-Aquaria-$_gitrev
build() {
  cd $_folder
  cmake -DAQUARIA_DEFAULT_DATA_DIR=/usr/share/aquaria \
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
