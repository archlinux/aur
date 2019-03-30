# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Andrew Conkling <andrewski@fr.st>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=scribes
pkgver=0.4.954
pkgrel=7
pkgdesc="An ultra minimalist text editor that combines simplicity with power"
arch=('any')
url='http://scribes.sourceforge.net'
license=('GPL')
depends=('python2-dbus' 'pygtksourceview2' 'python2-gtkspell' 'python2-xdg' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('intltool' 'gnome-doc-utils')
optdepends=('yelp: open manual') 
source=(http://launchpad.net/scribes/${pkgver%.*}/scribes-milestone1/+download/${pkgname}-${pkgver%.*}-dev-build${pkgver##*.}.tar.bz2)
sha256sums=('f4cb765d5690f7549eb0336ce23fd0648ba548b9a9e259876e5ee2c095a4b0f1')

prepare() {
  cd "${srcdir}"/${pkgname}-${pkgver%.*}-dev-build${pkgver##*.}

  # Python2 fix
  find . -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
  find . -type f | xargs sed -i 's/join(prefix, "bin", "python")/join(prefix, "bin", "python2")/'
  sed -i 's/python depcheck.py/python2 depcheck.py/' configure{,.ac}
  sed -i 's/python removepyc.py/python2 removepyc.py/
          s/python -OO compile.py/python2 -OO compile.py/' Makefile.{in,am}
}

build() {
  cd "${srcdir}"/${pkgname}-${pkgver%.*}-dev-build${pkgver##*.}

  PYTHON=python2 ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver%.*}-dev-build${pkgver##*.}

  make DESTDIR="${pkgdir}" install
}
