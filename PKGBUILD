# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: catalyst <catalyst@xaker.ru>
# Contributor: Jacob Winther <jacob.winther@gmail.com>

pkgname=cairo-compmgr-git
epoch=1
pkgver=0.3.1.35.g719a997
pkgrel=1
pkgdesc="Cairo based composite manager - Git version"
arch=(i686 x86_64)
url="http://cairo-compmgr.tuxfamily.org/"
license=(LGPL3)
conflicts=(cairo-compmgr)
provides=(cairo-compmgr)
makedepends=(gettext git gtk-doc "intltool>=0.41" gconf)
depends=("gtk2>=2.16.0" "vala>=0.22" libsm libgl)
options=(!makeflags
         !libtool)

source=('cairocompmgr::git+https://github.com/gandalfn/Cairo-Composite-Manager.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/cairocompmgr
  git describe --tags | sed 's|-|.|g'
}

build() {
  cd "$srcdir"/cairocompmgr

  #patch for compatibility with vala 0.22
  sed -i 's!libvala-0.18!libvala-0.22!' configure.ac
  sed -i 's!libvala-0.18!libvala-0.22!' vapi/cairo-compmgr.deps
  sed -i 's!include .libiberty.h.!include <libiberty/libiberty.h>!' src/ccm-debug.c

  ./autogen.sh --prefix=/usr LIBS="-ldl -lgmodule-2.0 -lm -lz"

  make
}

package() {
  cd "$srcdir"/cairocompmgr

  make DESTDIR="$pkgdir" install
  install -d "$pkgdir/usr/share/gconf/schemas/"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/cairo-compmgr.schemas" "$pkgdir/etc/gconf/schemas/*.schemas"
  rm -rf "$pkgdir/etc/gconf/schemas/"

}

# vim:set ts=2 sw=2 et:
