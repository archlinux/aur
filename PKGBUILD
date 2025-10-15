# Maintainer: Pierce <pierce.lopez@gmail.com>
# Maintainer: Sam S. <smls75@gmail.com>

pkgname=aquaria-ose-git
_installname=aquaria-ose
_gitname=Aquaria

pkgver=1.1.3+o1.002+g620.5f51dc4
_osever=1.002
_basever=1.1.3+o$_osever
pkgrel=2

pkgdesc="A 2D fantasy underwater action-adventure game (Open Source Edition engine = v1.1.3 + many improvements)"
url='https://github.com/AquariaOSE/Aquaria'
arch=('i686' 'x86_64')
license=('GPL')
depends=('sdl2' 'openal' 'gcc-libs')
makedepends=('cmake')
conflicts=('aquaria-hib-git' 'aquaria-hib-hg' 'aquaria' 'aquaria-hib' 'aquaria-git' 'aquaria-ose')
replaces=('aquaria-git' 'aquaria-hib-git' 'aquaria-hib-hg')
optdepends=('aquaria-data-hib: Game data from the Humble Bundle release')
install="$_installname.install"

source=("git+$url" "aquaria-ose.desktop")
sha256sums=('SKIP' '24ceb467f957fa045c5f824d6b9137a9f1bc7920b3dd3b96ae044a70556100a8')


pkgver() {
  cd Aquaria
  # Automatically generate package version from git commit number
  echo $_basever+g$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $_gitname
  
  cmake -DAQUARIA_DEFAULT_DATA_DIR=/usr/share/aquaria \
        -DAQUARIA_EXTRA_DATA_DIR=/usr/share/aquaria/override \
        -DAQUARIA_OVERRIDE_VERSION_STRING="Aquaria OSE $pkgver" \
        -DAQUARIA_USE_SDL2=1 \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5
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
