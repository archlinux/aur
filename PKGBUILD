# $Id$
# Maintainer: Florian Begusch <florian.begusch@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Sergio A. Morales <sergiomorales@archlinux.cl>
# Contributor: soeren <nonick@posteo.de>

pkgname=gummi-gtk2-git
pkgver=0.6.7
pkgrel=3
pkgdesc='Simple LaTex editor for GTK users (addtions to the original Gummi include: commenting functionality, cut/duplicate/delete line, reopening previously open files)'
arch=('x86_64')
url='http://github.com/florianbegusch/gummi'
license=('MIT')
depends=('texlive-core' 'gtkspell' 'gtksourceview2' 'poppler-glib')
makedepends=('glib2' 'gtk2' 'pango' 'poppler' 'intltool' 'setconf' 'git')
source=("git+ssh://git@github.com/florianbegusch/gummi#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  mv "gummi" $pkgname
  cd $pkgname

  # TODO: Simplify
  setconf autogen.sh AM_VERSION ''
  ./autogen.sh
  setconf Makefile.in PACKAGE_VERSION "'"$pkgver"'"
  setconf data/misc/Makefile.in PACKAGE_VERSION "'"$pkgver"'"
  echo $pkgver > dev/latest
  autoreconf
  setconf configure PACKAGE_VERSION "'"$pkgver"'"
  setconf configure PACKAGE_STRING "'""Gummi $pkgver""'"
  setconf configure PACKAGE_BUGREPORT "'https://bugs.archlinux.org/'"
}

build() {
  cd "$pkgname"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:

