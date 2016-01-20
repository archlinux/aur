# Maintainer: Xiao-long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: thn81 <root@scrat>
# Contributor: Michael Healy <horsemanoffaith@gmail.com>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname}, repo=wily
# vercheck-launchpad: name=${pkgname}

pkgbase=libindicator3
pkgname=(libindicator libindicator3)
_actual_ver=12.10.2
_extra_ver=+16.04.20151208
pkgver=${_actual_ver}${_extra_ver/+/.}
pkgrel=2
epoch=1
pkgdesc="A set of symbols and convience functions that all indicators would like to use"
arch=(i686 x86_64)
url="https://launchpad.net/libindicator"
license=(GPL)
makedepends=(gtk2 gtk3 glib2 ido)
groups=(unity)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgbase/3/}_${_actual_ver}${_extra_ver}.orig.tar.gz")
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

  cd "${pkgbase/3/}-${_actual_ver}${_extra_ver}"

  autoreconf -vfi
 
  [[ -d build-gtk2 ]] || mkdir build-gtk2
  pushd build-gtk2

  ../configure --prefix=/usr --libexecdir=/usr/lib/${pkgbase/3/} --with-gtk=2 --disable-static
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

package_libindicator() {
  pkgdesc+=" (GTK+ 2 library)"
  depends=(cairo gtk2 glib2)

  cd "${pkgbase/3/}-${_actual_ver}${_extra_ver}/build-gtk2"

  make -j1 DESTDIR="${pkgdir}/" install
}

package_libindicator3() {
  pkgdesc+=" (GTK+ 3 library)"
  depends=(gtk3 glib2 ido)
  options+=(!emptydirs)

  cd "${pkgbase/3/}-${_actual_ver}${_extra_ver}/build-gtk3"

  make -j1 -C libindicator DESTDIR="${pkgdir}/" install
  make -j1 -C tools DESTDIR="${pkgdir}/" install

  # Identical in both packages, but Ubuntu puts it in the GTK 2 package
  rm -vf  "${pkgdir}/usr/share/libindicator/80indicator-debugging"
}
