# Maintainer: UnCO <undercooled _at_ lavabit DOT com>
# Contributor: Army
# Contributor: Bastien Dejean <baskerville _at_ lavabit DOT com>

pkgname=sxiv-manga-git
_pkgname=sxiv
pkgver=v1.3.1.13.g5dc7993.g5dc7993
pkgrel=1
pkgdesc="Simple (or small or suckless) X Image Viewer with manga view mode (-m)"
arch=('i686' 'x86_64')
url="https://github.com/muennich/sxiv"
license=('GPL2')
depends=('imlib2' 'desktop-file-utils' 'libexif')
makedepends=('git')
optdepends=(
  'imagemagick: for the example commands in config.def.h'
  'libjpeg-turbo: for the example commands in config.def.h'
  'gimp: for the example commands in config.def.h')
provides=('sxiv')
conflicts=('sxiv')
source=("git+https://github.com/muennich/${_pkgname}.git"
        'manga.patch')
md5sums=('SKIP'
         '0d03671bf9237bec4f7a3092f1d39675')
install=sxiv.install

pkgver() {
  cd $_pkgname
  echo $(git describe --always | sed 's|-|.|g').g$(git rev-parse --short HEAD)
}

build() {
  cd $_pkgname

  patch -p1 -i $startdir/manga.patch
  if [ -e "$startdir"/config.h ]; then
    msg "Using custom config.h."
    cp "$startdir"/config.h .
    touch .depend
  fi

  make PREFIX="/usr"
}

package() {
  cd $_pkgname
  make PREFIX="/usr" DESTDIR="$pkgdir" install
  install -Dm644 sxiv.desktop "$pkgdir/usr/share/applications/sxiv.desktop"
}

