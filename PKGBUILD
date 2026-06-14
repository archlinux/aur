# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>

pkgname=dia-git
_pkgname=dia
pkgver=6975.ad68cc378
pkgrel=1
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
         0001-fix-build-for-poppler-26.06.patch)
sha256sums=('SKIP'
            '294d1f1af6da509495f996c00864203031117d935fede11200655a8fe2210b13')

pkgver() {
  cd "${_pkgname}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  sed -i "s/cc.find_library('ogdf'/cc.find_library('OGDF'/g" meson.build
  patch -p1 < ../0001-fix-build-for-poppler-26.06.patch
}

build() {
  arch-meson -Ddoc=enabled -Dtests=false build ${_pkgname}
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
