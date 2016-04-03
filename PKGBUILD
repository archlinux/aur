# Maintainer:  Alain Kalker <a.c.kalker@gmail.com>
_pkgname=fluxus
pkgname=${_pkgname}-git
pkgver=v0.17rc5.r224.gd06cb52
pkgrel=2
pkgdesc="A 3D game engine for livecoding worlds into existence"
arch=('i686' 'x86_64')
url="http://www.pawfal.org/fluxus/"
license=('GPL')
depends=('ode' 'fftw' 'liblo' 'glew' 'jack' 'freeglut' 'openal' 'racket')
makedepends=('git' 'scons')
provides=('fluxus')
conflicts=('fluxus')
source=(git://git.savannah.nongnu.org/fluxus.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"

  # Fix boot script path
  sed -i -e 's,/usr/local,/usr,' src/Interpreter.cpp
}

build() {
  cd "$srcdir/$_pkgname"

  scons Prefix=/usr RacketPrefix=/usr
}

package() {
  cd "$srcdir/$_pkgname"

  scons DESTDIR="$pkgdir/" Prefix=/usr RacketPrefix=/usr install

  # Install icon and desktop file
  install -d "$pkgdir"/usr/share/pixmaps
  install -m 644 modules/material/textures/fluxus-icon.png "$pkgdir"/usr/share/pixmaps
  install -d "$pkgdir"/usr/share/applications
  install -m 644 debian/fluxus.desktop "$pkgdir"/usr/share/applications
}

# vim:set ts=2 sw=2 et:
