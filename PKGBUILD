# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=fox-devel
pkgver=1.7.83
pkgrel=1
pkgdesc="Free Objects for X: GUI Toolkit for C++, development version."
arch=(x86_64)
url="http://www.fox-toolkit.org/"
license=(LGPL 'custom')
depends=(glu libsm libtiff libxcursor libxft libxi libxrandr)
makedepends=(mesa)
source=("http://www.fox-toolkit.org/ftp/fox-${pkgver}.tar.gz")
sha512sums=('f62f39fb0c0e01edd9a722d921b6f0f559f5d64ffbfea046a98bf215baafbef9aa7bab467680bff82f517a8507ba9972507b516ea4930425dfc03eabb6dd4e38')

build() {
  cd "fox-${pkgver}"
  ./configure \
    --prefix=/usr \
    --enable-static=no \
    --enable-release \
    --with-xft=yes \
    --with-opengl=yes \
    --with-xim \
    --with-xshm \
    --with-shape \
    --with-xcursor \
    --with-xrender \
    --with-xrandr \
    --with-xfixes \
    --with-xinput
  make
}

package() {
  cd "fox-${pkgver}"
  make DESTDIR="${pkgdir}/" install

  # license
  install -vDm 644 LICENSE_ADDENDUM \
  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # rename files to prevent conflicts with fox
  for _binary in `find "${pkgdir}"/usr/bin -type f`; do
    mv ${_binary} "${_binary}-devel"
  done;
  for _man in `find "${pkgdir}"/usr/share/man -type f`; do
    mv ${_man} "$(dirname ${_man})/$(basename ${_man})-devel.1"
  done;
}
