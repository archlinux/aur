# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>

pkgname=dia-git
_pkgname=dia
pkgver=6942.180eea0da
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
        "${pkgname}-pdf-import-fix.patch::https://gitlab.gnome.org/GNOME/dia/-/merge_requests/140.patch")
sha256sums=('SKIP'
            '6475a57959cf4bc4c317df2ba9d5016ad5b4dba2f516377bfa09c13b5162ba09')

pkgver() {
  cd "${_pkgname}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  sed -i "s/cc.find_library('ogdf'/cc.find_library('OGDF'/g" meson.build
  patch -p1 < ../${pkgname}-pdf-import-fix.patch
}

build() {
  arch-meson -Ddoc=enabled -Dtests=false build ${_pkgname}
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
