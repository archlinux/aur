# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Peter Ivanov <ivanovp@gmail.com>
# Contributor: Alec Ari <neotheuser@ymail.com>

pkgname=linuxcnc
pkgver=2.7.15
pkgrel=2
pkgdesc="Controls CNC machines. It can drive milling machines, lathes, 3d printers, laser cutters, plasma cutters, robot arms, hexapods, and more (formerly EMC2)"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://linuxcnc.org"
depends=('bc'
         'bwidget'
         'libxaw'
         'python2-imaging'
         'python2-yapps2'
         'tkimg'
         'python2-gtkglext'
         'tclx'
         'xorg-server'
         'boost'
         'procps-ng'
         'psmisc')
makedepends=('intltool')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LinuxCNC/linuxcnc/archive/v${pkgver}.tar.gz"
        'libtirpc.patch')
sha256sums=('242271c7756f4432bb3ac40d24876ac3f44500670979c1e8f8d1d911f8b5409b'
         'SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  echo "export TCLLIBPATH=$TCLLIBPATH:/usr/lib/tcltk/linuxcnc" > ${pkgname}.sh
  find . -iname fixpaths.py -o -iname checkglade -o \
   -iname update_ini | xargs perl -p -i -e "s/python/python2/"
  patch -Np2 -i $srcdir/libtirpc.patch
  ./autogen.sh
  ./configure --with-realtime=uspace \
   --without-libmodbus --prefix=/usr \
   --with-python=/usr/bin/python2.7 \
   --enable-non-distributable=yes
   # Compile time error fix
   sed -i "159s|FileName|FileNameArr|" hal/classicladder/files_project.c
   sed -i "170s|FileName|FileNameArr|" hal/classicladder/files_project.c
   sed -i "171s|FileName|FileNameArr|" hal/classicladder/files_project.c
}

build () {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  DESTDIR=${pkgdir} make install 
  cp -PR "${srcdir}/${pkgname}-${pkgver}/share/applications" $pkgdir/usr/share
  mkdir -p "${pkgdir}/etc/xdg"
  cp -PR "${srcdir}/${pkgname}-${pkgver}/share/menus" "${pkgdir}/etc/xdg/"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/src/${pkgname}.sh" \
   "${pkgdir}/etc/profile.d/${pkgname}.sh"
  sed -i "s|${srcdir}||" "${pkgdir}/usr/include/linuxcnc/config.h"
  sed -i "s|${srcdir}||" "${pkgdir}/usr/share/linuxcnc/Makefile.modinc"
}