# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=fox-devel
pkgver=1.7.65
pkgrel=1
pkgdesc="Free Objects for X: GUI Toolkit for C++, development version."
arch=('x86_64')
url="http://www.fox-toolkit.org/"
license=('LGPL' 'custom')
depends=('glu' 'libsm' 'libtiff' 'libxcursor' 'libxft' 'libxi' 'libxrandr')
makedepends=('mesa')
provides=("fox-devel=${pkgver}")
source=("http://www.fox-toolkit.org/ftp/fox-${pkgver}.tar.gz")
sha512sums=('80e9668804619b03350d67e5a20eaf09a325c00950a78deae2d663a7efc0818ade33932efd14dcc36211675c76ec4631700452c92afda43f1c1decbbd705c060')

build() {
  cd "fox-${pkgver}"
  ./configure   --prefix=/usr \
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
