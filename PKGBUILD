# Maintainer: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: schuay <jakob.gruber@gmail.com>
 
pkgname=pacman_sdl-ebuc99-git
_pkgbase=pacman
pkgver=0.9.r57.gb6241a3
pkgdesc="Pacman clone using SDL. Guide Pacman through a maze and collect pac-dots while 
avoiding ghosts. (ebuc99 fork)"
pkgrel=2
arch=('i686' 'x86_64')
url="http://github.com/ebuc99/pacman/"
license=('GPL2')
source=("git+https://github.com/ebuc99/pacman.git"
        'extra_life.patch')
depends=('sdl2_ttf' 'sdl2_mixer' 'sdl2_image')
makedepends=('boost')
sha256sums=('SKIP'
            'a0e58a6ca3294c4c6fe8e2c8222430889286bc2b0d8046ed3a13febbcb7ff413')

pkgver() {
  cd $_pkgbase
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48
}

build() {
  cd ${srcdir}/$_pkgbase
  patch -p1 -i ${srcdir}/extra_life.patch
  ./autogen.sh 
  ./configure --prefix=/usr
  make
}
package() {
  cd ${srcdir}/$_pkgbase
  make DESTDIR=${pkgdir} install
  mv ${pkgdir}/usr/bin/pacman{,_sdl}
  sed -e 's/Exec=pacman/Exec=pacman_sdl/g' \
  -i ${pkgdir}/usr/share/applications/pacman.desktop
}
