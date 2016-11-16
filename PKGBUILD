# Maintainer: Michael Healy <horsemanoffaith@gmail.com>
# Original Maintainer: György Balló <ballogy@freestart.hu>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname}, repo=xenial
# vercheck-launchpad: name=${pkgname}

pkgbase=libindicator-ubuntu
pkgname=(libindicator-gtk2-ubuntu libindicator-gtk3-ubuntu)
_actual_ver=16.10.0
_extra_ver=+16.10.20160913
pkgver=${_actual_ver}${_extra_ver/+/.}
pkgrel=1
pkgdesc="A set of symbols and convience functions that all indicators would like to use"
arch=(i686 x86_64)
url="https://launchpad.net/libindicator"
license=(GPL)
makedepends=(gtk2-ubuntu gtk3-ubuntu glib2 ido-ubuntu)
groups=(unity)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgbase/\-ubuntu/}_${_actual_ver}${_extra_ver}.orig.tar.gz")
sha512sums=('d5a82fa3ee9db1b85680c348041aee88fe83d3f221d6f5b5abd2d4ac0394ece8fdfc146db88ad3a945496c4c3654ce121c60907c26b307015334537ccb73ba48')

build() {  

  export CFLAGS+=" -Wno-error=deprecated-declarations"

  autoreconf -vfi
 
  [[ -d build-gtk2 ]] || mkdir build-gtk2
  pushd build-gtk2

  ../configure --prefix=/usr --libexecdir=/usr/lib/${pkgbase} --with-gtk=2 --disable-static
  make -j1
  popd

  [[ -d build-gtk3 ]] || mkdir build-gtk3
  pushd build-gtk3

  ../configure \
    --prefix='/usr' \
    --libexecdir='/usr/lib/libindicator' \
    --with-gtk='3' \
    --disable-static
  make
  popd
}

package_libindicator-gtk2-ubuntu() {
  pkgdesc+=" (GTK+ 2 library)"
  depends=(cairo gtk2-ubuntu glib2)

  cd build-gtk2

  make -j1 DESTDIR="${pkgdir}/" install
}

package_libindicator-gtk3-ubuntu() {
  pkgdesc+=" (GTK+ 3 library)"
  depends=(gtk3-ubuntu glib2 ido-ubuntu)
  options+=(!emptydirs)

  cd build-gtk3

  make -j1 -C libindicator DESTDIR="${pkgdir}/" install
  make -j1 -C tools DESTDIR="${pkgdir}/" install

  # Identical in both packages, but Ubuntu puts it in the GTK 2 package
  rm -vf  "${pkgdir}/usr/share/libindicator/80indicator-debugging"
}
