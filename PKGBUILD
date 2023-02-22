# Maintainer: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>

pkgname=dia-git
_pkgname=dia
pkgver=6728.df831435a
pkgrel=2
pkgdesc="A GTK+ based diagram creation program (GIT VERSION)"
arch=('x86_64')
license=('GPL')
url="http://live.gnome.org/Dia"
depends=('poppler' 'python' 'libxslt' 'gtk2' 'freetype2' 'graphene')
makedepends=('git' 'cmake' 'meson' 'intltool' 'dblatex' 'docbook-xsl')
provides=('dia')
conflicts=('dia')
options=('docs' '!emptydirs')
source=("git+https://gitlab.gnome.org/GNOME/dia.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  sed -i "s/cc.find_library('emf'/cc.find_library('EMF'/g" meson.build
  sed -i "s/cc.find_library('ogdf'/cc.find_library('OGDF'/g" meson.build
  sed -i '/  sheet,/d' sheets/meson.build
  sed -i 's/POPLLER/POPPLER/g' plug-ins/pdf/pdf-import.cpp
}

build() {
  cd "${srcdir}/${_pkgname}"

  arch-meson . build
  ninja -C build
}

package() {
  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
}
