# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dia-nopoppler-git
_pkgname=dia
pkgver=6731.b903dd83a
pkgrel=1
pkgdesc="A GTK+ based diagram creation program (GIT checkout without poppler)"
arch=('x86_64')
license=('GPL')
url="http://live.gnome.org/Dia"
depends=('python' 'libxslt' 'gtk2' 'freetype2' 'graphene')
makedepends=('git' 'cmake' 'meson' 'intltool' 'dblatex' 'docbook-xsl')
provides=('dia')
conflicts=('dia')
options=('docs' '!emptydirs')
source=("git+https://gitlab.gnome.org/GNOME/dia.git" no_poppler.patch)
sha256sums=('SKIP'
            'e2e057ca83b0bedcf7e56aad396c6e8a498775ed7f7246b3c271db92e7375ffb')

pkgver() {
  cd ${_pkgname}
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_pkgname}
  patch -Np1 < "$srcdir"/no_poppler.patch
}

build() {
  cd ${_pkgname}

  arch-meson . build
  ninja -C build
}

package() {
  cd ${_pkgname}
  DESTDIR="${pkgdir}" ninja -C build install
}
