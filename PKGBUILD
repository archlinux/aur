# Maintainer: schuay <jakob.gruber@gmail.com>
 
pkgname=pacman_sdl-ebuc99-git
_pkgbase=pacman
pkgver=v0.5.r205.g7cf259d
pkgdesc="Pacman clone using SDL. Guide Pacman through a maze and collect pac-dots while 
avoiding ghosts. (ebuc99 fork)"
pkgrel=1
arch=('i686' 'x86_64')
url="http://github.com/ebuc99/pacman/"
license=('GPLv2')
source=("git+https://github.com/ebuc99/pacman.git"
        'extra_life.patch')
md5sums=('SKIP'
         '61ea5932ff3bd98a5102d91e7dece69b')
depends=('sdl_ttf' 'sdl_gfx' 'sdl_mixer' 'sdl_image')
makedepends=('boost' 'sed')

pkgver() {
  cd "$_pkgbase"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/$_pkgbase"
  patch -p1 -i "${srcdir}/extra_life.patch"
  ./configure
  make
}
package() {
  cd "${srcdir}/$_pkgbase"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}/usr/local/bin/"pacman{,_sdl}
  sed -e 's/Exec=pacman/Exec=pacman_sdl/g' \
  -i "${pkgdir}/usr/local/share/applications/pacman.desktop"
}
