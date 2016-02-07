# Maintainer: Michael Healy <horsemanoffaith@gmail.com>
# Original Maintainer: György Balló <ballogy@freestart.hu>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname}, repo=xenial
# vercheck-launchpad: name=${pkgname}

pkgbase=libindicator-ubuntu
pkgname=(libindicator-gtk2 libindicator-gtk3)
_actual_ver=12.10.2
_extra_ver=+16.04.20151208
pkgver=${_actual_ver}${_extra_ver/+/.}
pkgrel=1
epoch=1
pkgdesc="A set of symbols and convience functions that all indicators would like to use"
arch=(i686 x86_64)
url="https://launchpad.net/libindicator"
license=(GPL)
makedepends=(gtk2-ubuntu gtk3-ubuntu glib2 ido-ubuntu)
groups=(unity)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgbase/\-ubuntu/}_${_actual_ver}${_extra_ver}.orig.tar.gz")
sha512sums=('350d5081075de0de31a046aaf439a08f15ce8fe3a07350519f55fd2df2caa47d8a4a4d538c114f4297fa37322802681de04cf588b4caaa40ba506c2e5922ef00')
prepare() {
  sed '/-Werror/s/$/ -Wno-deprecated-declarations/' -i ../src/libindicator-${_actual_ver}${_extra_ver}/Makefile.am
  sed 's/LIBINDICATOR_LIBS+="$LIBM"/LIBINDICATOR_LIBS+=" $LIBM"/g' -i ../src/libindicator-${_actual_ver}${_extra_ver}/configure.ac
  sed 's/LIBM="-lmw"/LIBM=" -lmw"/g' -i ../src/libindicator-${_actual_ver}${_extra_ver}/configure.ac
  sed 's/LIBM="-lm"/LIBM=" -lm"/g' -i ../src/libindicator-${_actual_ver}${_extra_ver}/configure.ac
  sed 's/LIBS="-lm  $LIBS"/LIBS=" -lm  $LIBS"/g' -i ../src/libindicator-${_actual_ver}${_extra_ver}/configure.ac
  sed 's/LIBS="-lmw  $LIBS"/LIBS=" -lmw  $LIBS"/g' -i ../src/libindicator-${_actual_ver}${_extra_ver}/configure.ac

  
}

build() {  

  export CFLAGS+=" -Wno-error=deprecated-declarations"

  cd libindicator-${_actual_ver}${_extra_ver}

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

package_libindicator-gtk2() {
  pkgdesc+=" (GTK+ 2 library)"
  depends=(cairo gtk2-ubuntu glib2)

  cd libindicator-${_actual_ver}${_extra_ver}/build-gtk2

  make -j1 DESTDIR="${pkgdir}/" install
}

package_libindicator-gtk3() {
  pkgdesc+=" (GTK+ 3 library)"
  depends=(gtk3-ubuntu glib2 ido-ubuntu)
  options+=(!emptydirs)

  cd libindicator-${_actual_ver}${_extra_ver}/build-gtk3

  make -j1 -C libindicator DESTDIR="${pkgdir}/" install
  make -j1 -C tools DESTDIR="${pkgdir}/" install

  # Identical in both packages, but Ubuntu puts it in the GTK 2 package
  rm -vf  "${pkgdir}/usr/share/libindicator/80indicator-debugging"
}
