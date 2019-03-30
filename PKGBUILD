# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinus.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=billreminder
pkgver=0.4.0
pkgrel=8
pkgdesc="Small and quick accounting application designed to allow for easy tracking of bills"
arch=('any')
url="http://ftp.acc.umu.se/pub/GNOME/sources/billreminder/"
license=('GPL3')
depends=('python2-dbus' 'desktop-file-utils' 'pygtk' 'python2-xdg'
         'xdg-utils' 'python2-gconf' 'python2-sqlalchemy' 'hicolor-icon-theme')
makedepends=('intltool')
source=(https://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('6a89584a1c90f661a7954a0c5c8bd392b8e2712d6cfd759fb6e588548ac8ff4e')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # python2 fix
  for file in billreminder.in billreminderd.in src/gui/widgets/*.py ; do
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
  done

  # fix python version check
  sed -i 's/"x$PYTHON_VERSION" = "x2.5"/"x$PYTHON_VERSION" > "x2.4"/' configure
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-schemas-install \
    --with-gconf-schema-file-dir=/usr/share/gconf/schemas

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
