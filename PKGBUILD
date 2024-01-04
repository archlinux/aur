# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=lxrad-git
_gitname=${pkgname%-git}
pkgver=v0.8.9.r39.g21838bc
pkgrel=3
pkgdesc="linux x11 rad tools"
arch=('x86_64' 'aarch64')
url='https://github.com/lcgamboa/lxrad'
license=('GPL2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('doxygen'
             'git'
             'openal'
             'wxwidgets-gtk3')
source=("git+https://github.com/lcgamboa/lxrad")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_gitname"

  sed -i '31s|#include<lxrad/lxrad.h>|#include "../include/lxrad.h"|' layout/layout2.h
}


build() {
  cd "$_gitname"

  sh make_deps.sh
  autoupdate
  autoreconf --install

  ./configure --prefix=/usr
  make all
  make -C layout
}

package() {
  cd "$_gitname"

  install -dm755 ${pkgdir}/usr/lib \
                  ${pkgdir}/usr/bin

  make install prefix="$pkgdir/usr"
  make install prefix="$pkgdir/usr" -C layout
}
# vim: set sw=2 ts=2 et:
