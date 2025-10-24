# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>

pkgname=dia-git
_pkgname=dia
pkgver=6943.22534d16c
pkgrel=2
pkgdesc="A GTK+ based diagram creation program"
arch=('x86_64')
license=('GPL-2.0-or-later')
url="https://gitlab.gnome.org/GNOME/dia"
depends=('poppler' 'python-gobject' 'libxslt' 'gtk3' 'freetype2' 'graphene' 'libemf' 'xpm-pixbuf-git')
makedepends=('git' 'meson' 'intltool' 'dblatex' 'appstream-glib' 'glib2-devel')
provides=('dia')
conflicts=('dia')
options=('docs' '!emptydirs')
source=("git+https://gitlab.gnome.org/GNOME/dia.git"
         0001-fix-build-for-poppler-25.10.patch)
sha256sums=('SKIP'
            'a431c7792c28c16692d80afcf8ddbd294c03dd10a2dfca19be137561cb5c152e')

pkgver() {
  cd "${_pkgname}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  sed -i "s/cc.find_library('ogdf'/cc.find_library('OGDF'/g" meson.build
  git apply -3 ../0001-fix-build-for-poppler-25.10.patch
}

build() {
  arch-meson -Ddoc=enabled -Dtests=false build ${_pkgname}
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
