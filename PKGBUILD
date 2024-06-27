# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Steffen Weber <-boenki-gmx-de->
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Rick Rein <jeebusroxors@gmail.com>
# Contributor: Stefano Esposito <ragnarok@email.it>

pkgname=brutalchess
pkgver=0.5.2
pkgrel=8
pkgdesc="Chess game inspired by 'Battle Chess'. Features full 3D graphics."
url="https://sourceforge.net/projects/$pkgname"
license=('GPL-2.0-or-later')
arch=('x86_64')
depends=('freetype2' 'glu' 'libglvnd' 'sdl12-compat' 'sdl_image')
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-alpha-$pkgver-src.tar.gz")
md5sums=('370476b63091b8d82a9ea57c604dcbab')

prepare() {
  cd $pkgname-$pkgver/src
  sed '/<time.h>/ a\#include <limits.h>' -i brutalplayer.cpp
  sed 's/GLvoid/void/g'                  -i {md3view,objview}.cpp
  sed '/<string>/ a\#include <unistd.h>' -i {xboardplayer,faileplayer}.cpp

  # Force pkg-config for the FreeType config program
  sed 's/FT2_CONFIG=$ac_cv_path_FT2_CONFIG/FT2_CONFIG="pkg-config freetype2"/' -i ../configure
  sed 's/7\.0\.1/2.0.5/' -i ../configure
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --libexecdir=/usr/lib/$pkgname
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
