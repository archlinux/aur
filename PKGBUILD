# Maintainer: UnCO <undercooled _at_ lavabit DOT com>
# Contributor: Army
# Contributor: Bastien Dejean <baskerville _at_ lavabit DOT com>

_pkgname=sxiv
pkgname=sxiv-bskv-manga-git
pkgver=v1.3.1.13.g5dc7993.g5dc7993
pkgrel=1
pkgdesc="Simple (or small or suckless) X Image Viewer with manga view mode (-m) (baskerville xft fork)"
arch=('i686' 'x86_64')
url="https://github.com/muennich/sxiv"
license=('GPL2')
depends=('imlib2' 'giflib' 'libxft' 'libexif')
makedepends=('git')
optdepends=(
  'imagemagick: for the example commands in config.def.h'
  'libjpeg-turbo: for the example commands in config.def.h'
  'gimp: for the example commands in config.def.h')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/muennich/${_pkgname}.git"
        'manga.patch'
        'xft.patch')
md5sums=('SKIP'
         '0d03671bf9237bec4f7a3092f1d39675'
         '35595aaa1f9344f4e1f26ec723c2e33f')

pkgver() {
  cd $_pkgname
  echo $(git describe --always | sed 's|-|.|g').g$(git rev-parse --short HEAD)
}

build() {
  cd $_pkgname

  patch -p1 -i "$srcdir"/manga.patch
  patch -p1 -i "$srcdir"/xft.patch
  if [ -e "$startdir"/config.h ]; then
    msg "Using custom config.h."
    cp "$startdir"/config.h .
  fi

  make PREFIX="/usr"
}

package() {
  cd $_pkgname
  make PREFIX="/usr" DESTDIR="$pkgdir" install
  install -Dm644 sxiv.desktop "$pkgdir/usr/share/applications/sxiv.desktop"
}

# vim:set ts=2 sw=2 et:
