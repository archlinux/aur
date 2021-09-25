# Maintainer: Gerhard Stein <gerstrong@steinzone.de>
# Contributor: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>

pkgname=commander-genius-git
_pkgname=Commander-Genius
pkgver=3.0.4.r0.gdf0b19966
pkgrel=1
pkgdesc="A modern implementation of the classic Commander Keen game series"
arch=('i686' 'x86_64')
url="https://clonekeenplus.sourceforge.io/"
license=('GPL')
depends=('sdl2' 'mesa' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer')
makedepends=('git' 'cmake' 'glu')
provides=(commander-genius)
conflicts=(commander-genius)
source=(git+https://gitlab.com/Dringgstein/Commander-Genius.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
    -DUSE_BOOST=NO

  make -C "$_pkgname-build"
}

package() {
  cd "$srcdir/$_pkgname-build"
  make DESTDIR="$pkgdir/" install

  # Icon needed for .desktop file
  mkdir -p "$pkgdir/usr/share/icons"
  ln -s /usr/share/commandergenius/CGLogo.svg "$pkgdir/usr/share/icons/cg.svg"
}
