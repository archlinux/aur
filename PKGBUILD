# Maintainer: Thomas Lange <thomas-lange2@gmx.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

# Set to 1 to use Meson build system
_use_meson=0
_buildstamp='Arch Linux'

_pkgname=audacious
pkgname="$_pkgname-git"
pkgver=4.2.beta1.r0.ge4755ce26
pkgrel=1
epoch=1
pkgdesc="Lightweight, advanced audio player focused on audio quality (git version)"
arch=('i686' 'x86_64')
url="https://audacious-media-player.org/"
license=('BSD')
depends=('glib2' 'gtk2' 'qt5-base' 'qt5-imageformats' 'qt5-svg')
makedepends=('git' 'python') # for gdbus-codegen
optdepends=('unzip: zipped skins support')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
source=("git+https://github.com/audacious-media-player/$_pkgname.git")
sha256sums=('SKIP')

if [ "$_use_meson" = 1 ]; then
  makedepends+=('meson')
fi

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^audacious-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  if [ "$_use_meson" = 1 ]; then
    arch-meson build -D buildstamp="$_buildstamp"
    meson compile -C build
  else
    autoreconf
    ./configure \
      --prefix=/usr \
      --with-buildstamp="$_buildstamp"
    make
  fi
}

package() {
  cd "$_pkgname"

  if [ "$_use_meson" = 1 ]; then
    meson install -C build --destdir "$pkgdir"
  else
    make DESTDIR="$pkgdir" install
  fi

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
