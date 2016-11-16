# Maintainer: Michael Healy <horsemanoffaith@gmail.com>
# Original Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: thn81 <root@scrat>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=libdbusmenu, repo=zesty
# vercheck-launchpad: name=dbusmenu, tarname=libdbusmenu

pkgbase=libdbusmenu-ubuntu
pkgname=(libdbusmenu-glib-ubuntu libdbusmenu-gtk2-ubuntu libdbusmenu-gtk3-ubuntu)
_actual_ver=16.04.1
_extra_ver=+16.10.20160927.2
pkgver=${_actual_ver}${_extra_ver/\+/.}
pkgrel=1
pkgdesc="A small little library that was created by pulling out some common code out of indicator-applet"
arch=(i686 x86_64)
url="https://launchpad.net/dbusmenu"
license=(LGPL)
makedepends=(gobject-introspection gtk-doc gtk2-ubuntu gtk3-ubuntu intltool json-glib python2 vala valgrind)
groups=(unity)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/libdbusmenu_${_actual_ver}${_extra_ver}.orig.tar.gz"
        0001_autoconf.patch)
sha512sums=('3f3582ba6a3d83ef4837dd2f253ff525d16dcfa2eb56a4ff2e6ba273bfe60b79b1bba97c4a5661d9a1394e95377e2c63bad762ec5da70512d970fe71c766a08f'
            '303eae41659c29a78bd1f24aa7a01b35987049f6213d23fc6ecd5a7e72109d277fd6d443414750274f1fc75cee567285ca8d9d49887e6ab19e36565630fdf08b')

prepare() {
  
  patch -p1 -i 0001_autoconf.patch
}

build() {
  
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

  cd build-gtk3

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

  cd build-gtk2

  make -j1 -C libdbusmenu-gtk DESTDIR="${pkgdir}/" install
  make -j1 -C docs/libdbusmenu-gtk DESTDIR="${pkgdir}/" install
}

package_libdbusmenu-gtk3-ubuntu() {
  pkgdesc+=" (GTK+ 3 library)"
  depends=(gtk3-ubuntu libdbusmenu-glib-ubuntu)
  provides=(libdbusmenu-gtk3)
  replaces=(libdbusmenu-gtk3)
  conflicts=(libdbusmenu-gtk3)

  cd build-gtk3

  make -j1 -C libdbusmenu-gtk DESTDIR="${pkgdir}/" install
}
