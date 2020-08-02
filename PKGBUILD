# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dia-git
_pkgname=dia
pkgver=6576.793f0966
pkgrel=1
pkgdesc="A GTK+ based diagram creation program (GIT VERSION)"
arch=('x86_64')
license=('GPL')
url="http://live.gnome.org/Dia"
depends=('libxslt' 'gtk2' 'freetype2' 'python2')
makedepends=('git' 'cmake' 'meson' 'intltool' 'dblatex' 'docbook-xsl')
optdepends=('python2')
provides=('dia')
conflicts=('dia')
options=('docs' '!emptydirs')
source=("git+https://gitlab.gnome.org/GNOME/dia.git")
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_pkgname}
  for file in ./plug-ins/python/gtkcons.py ./plug-ins/python/doxrev.py; do
      sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' "$file"
  done
}

build() {
  cd ${_pkgname}
  meson --prefix /usr --buildtype=plain  . build 
  ninja -j1 -C build
}

package() {
  cd ${_pkgname}
  DESTDIR="${pkgdir}" ninja -C build install
}
