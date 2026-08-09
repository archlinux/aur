# Maintainer: Gerhard Stein <gerstrong@steinzone.de>
# Contributor: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>

pkgname=commander-genius-git
_pkgname=Commander-Genius
pkgver=3.6.3.r3.gcee1931
pkgrel=1
pkgdesc="A modern implementation of the classic Commander Keen game series"
arch=('i686' 'x86_64')
url="https://clonekeenplus.sourceforge.io/"
license=(GPL-3.0-or-later)
depends=('sdl2' 'mesa' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer')
makedepends=('git' 'cmake')
provides=(commander-genius)
conflicts=(commander-genius)
source=(git+https://gitlab.com/Dringgstein/Commander-Genius.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd "$srcdir/$_pkgname"
  # Initialize and fetch submodules from inside the repo folder
  git submodule update --init --recursive
}

build() {
  mkdir -p "$srcdir/$_pkgname-build"
  cmake -S "$srcdir/$_pkgname" -B "$srcdir/$_pkgname-build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DAPPDIR=/usr/bin \
    -DFULL_GAMES_SHAREDIR:PATH=/usr/share \
    -DGAMES_SHAREDIR:PATH=/usr/share \
    -DDOCDIR=/usr/share/doc/commandergenius \
    -DBUILD_COSMOS=YES \
    -DUSE_BOOST=NO

  cmake --build "$srcdir/$_pkgname-build"
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/$_pkgname-build"
  # Icon needed for .desktop file
  mkdir -p "$pkgdir/usr/share/icons"
  ln -s /usr/share/commandergenius/CGLogo.svg "$pkgdir/usr/share/icons/cg.svg"
}
