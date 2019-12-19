# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=fox-devel
pkgver=1.7.67
pkgrel=1
pkgdesc="Free Objects for X: GUI Toolkit for C++, development version."
arch=('x86_64')
url="http://www.fox-toolkit.org/"
license=('LGPL' 'custom')
depends=('glu' 'libsm' 'libtiff' 'libxcursor' 'libxft' 'libxi' 'libxrandr')
makedepends=('mesa')
provides=("fox-devel=${pkgver}")
source=("http://www.fox-toolkit.org/ftp/fox-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/fox-devel-FXRex.patch")
sha512sums=('a45db7ea9453e2afe0ff61ed6608925e94f9202dc1fbee5e2b88a5a1c16310019cb4611090f8234ad6ebc46a6519a36085683c4553d47bc9c21b8ef0c13ab540'
            'ea88a33307a39f52e70b889d0458b233b4e0f22b87aa6bd0d6ec1fbc9c542ee5d26ab32e9dab9a2d002113f9c42e68f023deb5f5cd6325551780c24e9ea24023')

prepare() {
  cd "fox-${pkgver}"
  patch -p1 -i "${srcdir}/fox-devel-FXRex.patch"
}

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
