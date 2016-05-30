# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=gsignond-plugin-oauth-git
pkgver=r77.af35860
pkgrel=2
pkgdesc='OAuth plugin for gSSO'
arch=('i686' 'x86_64')
url='https://01.org/gsso'
license=('LGPL2.1')
depends=('glib2' 'glibc' 'gnutls' 'gsignond' 'json-glib' 'libsoup' 'sqlite')
makedepends=('git' 'gobject-introspection' 'gtk-doc')
provides=('gsignond-plugin-oauth')
conflicts=('gsignond-plugin-oauth')
source=('git+https://gitlab.com/accounts-sso/gsignond-plugin-oa.git')
sha256sums=('SKIP')

pkgver() {
  cd gsignond-plugin-oa

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd gsignond-plugin-oa

  mkdir -p m4
  gtkdocize
  aclocal
  autoheader
  libtoolize --copy --force
  autoconf
  automake --add-missing --copy
}

build() {
  cd gsignond-plugin-oa

  export CFLAGS="$CFLAGS -Wno-deprecated-declarations"

  ./configure \
    --prefix='/usr' \
    --enable-gtk-doc
  make
}

package() {
  cd gsignond-plugin-oa

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
