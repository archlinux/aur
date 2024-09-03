# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=fox-devel
pkgver=1.7.85
pkgrel=1
pkgdesc="Free Objects for X: GUI Toolkit for C++, development version."
arch=(x86_64)
url="http://www.fox-toolkit.org/"
license=(LGPL 'custom')
depends=(libsm libtiff libxcursor libxft libxi libxrandr)
makedepends=(mesa glu)
source=("http://www.fox-toolkit.org/ftp/fox-${pkgver}.tar.gz")
sha512sums=('7a67d564c69ddac1a9dec62837943ec7aabd951c72715ac12300f728f0fad3365e39cdbf7fe1ab31e0ae8cf11381d62eaeb3edb64d1773d4cd2279db4fd280d8')

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
