# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: thn81 <root@scrat>
# Contributor: Michael Healy <horsemanoffaith@gmail.com>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgbase}, repo=wily
# vercheck-launchpad: name=${pkgbase}

pkgbase=libappindicator3
pkgname=(libappindicator libappindicator3)
_actual_ver=12.10.1
_extra_ver=+15.04.20141110
pkgver=${_actual_ver}${_extra_ver/\+/.}
pkgrel=2
epoch=1
pkgdesc="A library to allow applications to export a menu into the Unity Menu bar"
arch=(i686 x86_64)
url="https://launchpad.net/libappindicator"
license=(LGPL)
makedepends=(dbus-glib libindicator libindicator3 libdbusmenu-gtk2
             libdbusmenu-gtk3 gobject-introspection vala gtk-sharp-2 pygtk
             perl-xml-libxml gtk-doc)
groups=(unity)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${_actual_ver}${_extra_ver}.orig.tar.gz"
        0001-Glib.Timeout-fix.patch
        0002-Fix-mono-nunit-pkgconfig-name.patch
        0003-Fix-Mono-assemblies-directory.patch)
sha512sums=('328378d86fe81b6e154327ab53fb0d9ead4c2d7eae17f689966c381e65014bdaa91ec675857f6398c740560814346dd28a9de510f847facc9241efaccb2e33a6'
            'e717a7e50ec4828bc4ea1701a4f707ddc695e16dfab2487c0e4f2f85ac50d2d215c99450e4191f0e29d402f0b28bf7b71d5cf2321d3b3b27b396a8bf8f3a393b'
            'ea1822c3a09ef4c59d91b267d2ea0d0c9003c04ea0d8d4fb6a73e1b51084faccafbf41d6390a9c0e1326fd3334421539bdbb86a2a5e5022fa96e9d5196ef2d1d'
            '22e15f875a636bbbf8b1e80867a219b4b47b334d1bfe759f4ce79bf3665fc63af36b57fddb6c92aa7db148b5ea9ed789e510a9b23d87324b1b48695ad1ca9bc7')

prepare() {
  cd "${pkgbase/3/}-${_actual_ver}${_extra_ver}"

  patch -p1 -i ../0001-Glib.Timeout-fix.patch
  patch -p1 -i ../0002-Fix-mono-nunit-pkgconfig-name.patch
  patch -p1 -i ../0003-Fix-Mono-assemblies-directory.patch
}

build() {
  cd "${pkgbase/3/}-${_actual_ver}${_extra_ver}"

  export CFLAGS+=" -Wno-error=deprecated-declarations"

  export MCS=/usr/bin/mcs
  export CSC=/usr/bin/mcs
  export GMCS=/usr/bin/mcs

  gtkdocize
  autoreconf -vfi

  [[ -d build-gtk2 ]] || mkdir build-gtk2
  pushd build-gtk2
  ../configure --prefix=/usr --with-gtk=2 --disable-static --disable-mono-test PYTHON=python2
  make -j1
  popd

  [[ -d build-gtk3 ]] || mkdir build-gtk3
  pushd build-gtk3
  ../configure --prefix=/usr --with-gtk=3 --disable-static --disable-mono-test PYTHON=python2
  make -j1
  popd
}

package_libappindicator() {
  pkgdesc+=" (GTK+ 2 library)"
  depends=(libindicator libdbusmenu-gtk2)

  cd "${pkgbase/3/}-${_actual_ver}${_extra_ver}/build-gtk2"

  make -j1 DESTDIR="${pkgdir}/" install
}

package_libappindicator3() {
  pkgdesc+=" (GTK+ 3 library)"
  depends=(libindicator3 libdbusmenu-gtk3)

  cd "${pkgbase/3/}-${_actual_ver}${_extra_ver}/build-gtk3"

  make -C src DESTDIR="${pkgdir}/" install
  make -C bindings/vala DESTDIR="${pkgdir}/" install
}
