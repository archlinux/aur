# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Pantelis Panayiotou <p.panayiotou@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: nesl247 <nesl247@gmail.com>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>

pkgname=fusion-icon
epoch=1
pkgver=0.2.2
pkgrel=2
pkgdesc="Simple tray icon for Compiz 0.8"
arch=('any')
url="http://www.compiz.org/"
license=('GPL')
conflicts=('fusion-icon0.9')
depends=('compizconfig-python' 'hicolor-icon-theme' 'xorg-utils' 'mesa-demos')

# Note to anyone who builds this: Make sure you install the appropriate
# dependencies for the user interfaces you want to use! Otherwise, it'll appear
# like it's not working!
optdepends=(
	'python2-pyqt5: For the Qt Interface'
	'python2-gobject: For the GTK+ Interface'
	'libappindicator-gtk3: For the GTK+ Interface'
)

install="$pkgname.install"
source=("https://github.com/compiz-reloaded/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # python2 fix
  sed -i 's_@python_@python2_' Makefile
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Workaround until upstream autofills out main.py for each interface
  make PREFIX=/usr
  make PREFIX=/usr DESTDIR=$pkgdir install
}

sha256sums=('2a63e11163dca4eee05cb0835e632393d4acc0a315530e2e65df18e76f586024')
