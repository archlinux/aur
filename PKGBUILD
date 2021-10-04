# Maintainer:  Jason Kercher <jkercher43 a gmail>
# Contributor: Peter Ivanov <ivanovp@gmail.com>
# Contributor: Alec Ari <neotheuser@ymail.com>

pkgname=linuxcnc
pkgver=2.8.2
pkgrel=1
pkgdesc="Controls CNC machines. It can drive milling machines, lathes, 3d printers, laser cutters, plasma cutters, robot arms, hexapods, and more (formerly EMC2)"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://linuxcnc.org"
depends=('bc'
         'bwidget'
         'libxaw'
	 'boost-python2'
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
conflicts=('linuxcnc-git' 'linuxcnc-bin')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LinuxCNC/linuxcnc/archive/refs/tags/v${pkgver}.tar.gz"
        'libtirpc.patch')
sha256sums=('af65cd2d9497bba6fc851c68ed0eed5a55b514959ac93e0957fca13cc1586845'
            'bc95bafd67fad1c1d3722261bc586cdc612ec9e1597fadb95fa825c10550ac2c')

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
  # Linking time errors fix
  sed -i "163s|FileName|FileNameArr|" hal/classicladder/files_project.c
  sed -i "174s|FileName|FileNameArr|g" hal/classicladder/files_project.c
  sed -i "175s|FileName|FileNameArr|" hal/classicladder/files_project.c
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
