# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=fox-devel
pkgver=1.7.64
pkgrel=2
pkgdesc="Free Objects for X: GUI Toolkit for C++, development version."
arch=('x86_64')
url="http://www.fox-toolkit.org/"
license=('LGPL' 'custom')
depends=('glu' 'libsm' 'libtiff' 'libxcursor' 'libxft' 'libxi' 'libxrandr')
makedepends=('mesa')
provides=("fox=${pkgver}")
source=("http://www.fox-toolkit.org/ftp/fox-${pkgver}.tar.gz")
sha512sums=('bbab5b11064017b7f2cf3030fc59fd6b991d8b427be7e6cb1577e0144317d73458b822c88f2592e8a7c36dafa82cb41c4ed7c8a880c3953b438d6c53d4a8f16b')

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
