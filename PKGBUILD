# Maintainer: Michael Healy <horsemanoffaith@gmail.com>
# Original Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: thn81 <root@scrat>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=libdbusmenu, repo=xenial
# vercheck-launchpad: name=dbusmenu, tarname=libdbusmenu

pkgbase=libdbusmenu-ubuntu
pkgname=(libdbusmenu-glib-ubuntu libdbusmenu-gtk2-ubuntu libdbusmenu-gtk3-ubuntu)
_actual_ver=12.10.3
_extra_ver=+16.04.20160223.1
pkgver=${_actual_ver}${_extra_ver/\+/.}
pkgrel=1
pkgdesc="A small little library that was created by pulling out some common code out of indicator-applet"
arch=(i686 x86_64)
url="https://launchpad.net/dbusmenu"
license=(LGPL)
makedepends=(json-glib gtk2-ubuntu gtk3-ubuntu intltool gtk-doc gobject-introspection vala
             python2 valgrind)
groups=(unity)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/libdbusmenu_${_actual_ver}${_extra_ver}.orig.tar.gz"
        0001_autoconf.patch)
sha512sums=('66ee5b2ca113a3cd295bf18517a190ecc27b9bdf019212a851343933509eabf09cd7d7b1749d0f7b7d16bec9f0c41c1d37ce52d1881eb8cc3ee47364d539339d'
            '233865822a6280dbd536db131511648bdf40af042ae8afa1ed813cd2538c4e9f5f1ada8868de27bf60f1bed8830ace9916c097ba3d8d698744a2fac95a6dbabf')

prepare() {
  cd "libdbusmenu-${_actual_ver}${_extra_ver}"

  patch -p1 -i ../0001_autoconf.patch
}

build() {
  cd "libdbusmenu-${_actual_ver}${_extra_ver}"

  gtkdocize
  autoreconf -vfi
  intltoolize -f

  # Python2 fix
  sed -i "s|^\(#!.*python\)$|\12|" tools/dbusmenu-bench

  # libdbusmenu-gtk2 won't install if libdbusmenu-glib is missing
  sed -i 's|$(DBUSMENUGTK_CFLAGS)|$(DBUSMENUGTK_CFLAGS) -L../libdbusmenu-glib/.libs|' libdbusmenu-gtk/Makefile.{am,in}

  [[ -d build-gtk2 ]] || mkdir build-gtk2
  pushd build-gtk2
  ../configure --prefix=/usr --libexecdir=/usr/lib/libdbusmenu --disable-scrollkeeper --with-gtk=2 --disable-static
  make -j1
  popd

  [[ -d build-gtk3 ]] || mkdir build-gtk3
  pushd build-gtk3
  ../configure --prefix=/usr --libexecdir=/usr/lib/libdbusmenu --disable-scrollkeeper --with-gtk=3 --disable-static
  make
  popd

}

package_libdbusmenu-glib-ubuntu() {
  depends=(json-glib)
  provides=(libdbusmenu-glib)
  replaces=(libdbusmenu-glib)
  conflicts=(libdbusmenu-glib)

  cd "libdbusmenu-${_actual_ver}${_extra_ver}/build-gtk3"

  make -j1 -C libdbusmenu-glib DESTDIR="${pkgdir}/" install
  make -j1 -C tools DESTDIR="${pkgdir}/" install
  make -j1 -C tests DESTDIR="${pkgdir}/" install
  make -j1 -C docs/libdbusmenu-glib DESTDIR="${pkgdir}/" install
  make -j1 -C po DESTDIR="${pkgdir}/" install
}

package_libdbusmenu-gtk2-ubuntu() {
  pkgdesc+=" (GTK+ 2 library)"
  depends=(gtk2-ubuntu libdbusmenu-glib-ubuntu)
  provides=(libdbusmenu-gtk2)
  replaces=(libdbusmenu-gtk2)
  conflicts=(libdbusmenu-gtk2)

  cd "libdbusmenu-${_actual_ver}${_extra_ver}/build-gtk2"

  make -j1 -C libdbusmenu-gtk DESTDIR="${pkgdir}/" install
  make -j1 -C docs/libdbusmenu-gtk DESTDIR="${pkgdir}/" install
}

package_libdbusmenu-gtk3-ubuntu() {
  pkgdesc+=" (GTK+ 3 library)"
  depends=(gtk3-ubuntu libdbusmenu-glib-ubuntu)
  provides=(libdbusmenu-gtk3)
  replaces=(libdbusmenu-gtk3)
  conflicts=(libdbusmenu-gtk3)

  cd "libdbusmenu-${_actual_ver}${_extra_ver}/build-gtk3"

  make -j1 -C libdbusmenu-gtk DESTDIR="${pkgdir}/" install
}
