# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>

pkgname=dia-git
_pkgname=dia
pkgver=6867.9c28c29ed
pkgrel=1
pkgdesc="A GTK+ based diagram creation program"
arch=('x86_64')
license=('GPL-2.0-or-later')
url="http://live.gnome.org/Dia"
depends=('poppler' 'python-gobject' 'libxslt' 'gtk3' 'freetype2' 'graphene' 'libemf')
makedepends=('git' 'cmake' 'meson' 'intltool') # 'dblatex' 'docbook-xsl')
provides=('dia')
conflicts=('dia')
options=('docs' '!emptydirs')
source=("git+https://gitlab.gnome.org/GNOME/dia.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  sed -i "s/cc.find_library('ogdf'/cc.find_library('OGDF'/g" meson.build
}

build() {
  arch-meson -Ddoc=false build ${_pkgname}
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
