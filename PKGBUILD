# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: aimileus < me at aimileus dot nl >
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tiago Pierezan Camargo <tcamargo@gmail.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

set -u
pkgname=nestopia
pkgname+='-git'
pkgver=1.52.0.r3.g185d747
pkgrel=1
pkgdesc='An NES emulator featuring cycle exact emulation, a ridiculous number of mappers, and lots of custom sound chips.'
url='http://0ldsk00l.ca/nestopia/'
license=('GPL')
arch=('x86_64')
depends=('sdl2' 'fltk' 'zlib' 'libarchive' 'glu')
makedepends=('mesa' 'autoconf-archive')
makedepends+=('git')
conflicts=('nestopia')
provides=("nestopia=${pkgver%.r*}")
_srcdir="${pkgname%-git}"
source=("git+https://github.com/rdanbrook/nestopia.git")
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_srcdir}"
  git describe --long | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'configure' ]; then
  autoreconf -fi
  fi
  if [ ! -s 'Makefile' ]; then
    # build system normally disables this warning
    CXXFLAGS+=' -Wno-narrowing'
    ./configure --prefix='/usr' --enable-gui
  fi
  make -s
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -s -j1 install DESTDIR="${pkgdir}"
  set +u
}

set +u
