# Maintainer: Felix Golatofski <contact@xdfr.de>
# Maintainer: William Immendorf  (https://curus.xyz)
# Contributor: Karol 'Kenji Takahashi' Woźniak @ kenji.sx
# Based on a cnijfilter-mg3200 package by morris555
#
# [Printer Model Name] [Printer Model ID]
# ------------------------------------------------------------------
#  mp230     401
#  mg2200    402
#  e510      403
#  mg3200    404
#  mg4200    405
#  ip7200    406
#  mg5400    407
#  mg6300    408

_name=mg4200
_id=405

pkgname=cnijfilter-${_name}
pkgver=3.80
pkgrel=6
_pkgver=3.80-1
pkgdesc="Canon IJ Printer Driver (for ${_name} series)"
url="https://sg.canon/en/support/0100469302"
arch=('i686' 'x86_64')
license=('custom')
depends=('popt' 'gtk2' 'cups' 'ghostscript')
source=(https://gdlp01.c-wss.com/gds/3/0100004693/01/cnijfilter-source-${_pkgver}.tar.gz
        fix_cups.patch
        fix_png.patch
        fix_configures.patch)
sha512sums=('95a16e3b4fc38ce0b7a12bd74466d97e726bc410b59bf6d1963fa52b16a8cc67f6a993a5ef945107201f860d8ac6734c462bc0bf6d2160d6c85c5f61aff040c1'
            '74388421036f25406fe03b784dc63223edebb09287ee5a333e31ffce941359e72ddff8068675e49db82220e56d16ec1151265a217cb98ca7363f0c83422903b4'
            'aecf5a4375dfe2d3b56c4dba37e985c3d6ecde05eba91361c028ec7b2c393377f20e76e843b989b0c282e1969089bd02f8ccdda43397be4a8d6ad7e973c8152f'
            'dffa3149541585ac99e77c4b62e0e21980105854415fe502b3658d68a42bab248def1ad9729ca6c4868236bfdf91988e8fdbb2b71e0b784434255c21052c1244')

if [ "$CARCH" == "x86_64" ]; then
  _libdir=libs_bin64
else
  _libdir=libs_bin32
fi

build() {
  ## Apply patches
  cd ${srcdir}/cnijfilter-source-${_pkgver}
  patch -p1 -i ${srcdir}/fix_cups.patch || return 1
  patch -p1 -i ${srcdir}/fix_png.patch || return 1
  patch -p1 -i ${srcdir}/fix_configures.patch || return 1

  ## Fix build with glibc 2.32+
  ## Remove a deprecated (& rather pointless) header inclusion
  sed -i "36d" cngpijmon/cnijnpr/cnijnpr/cnijnpr.c

  ## Compile model specific stuff
  # ppd file
  msg "Compile PPD file..."
  cd ${srcdir}/cnijfilter-source-${_pkgver}/ppd
  ./autogen.sh --prefix=/usr --enable-ppdpath=/usr/share/cups/model --program-suffix=${_name}
  make clean || return 1
  make || return 1
  # cnijfilter
  msg "Compile cnijfilter..."
  cd ${srcdir}/cnijfilter-source-${_pkgver}/cnijfilter
  ./autogen.sh --prefix=/usr --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin --program-suffix=${_name}
  make clean || return 1
  make || return 1
  # lgmon
  msg "Compile lgmon..."
  cd ${srcdir}/cnijfilter-source-${_pkgver}/lgmon
  ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --program-suffix=${_name}
  make clean || return 1
  make || return 1
  # cngpijmon
  msg "Compile cngpijmon..."
  cd ${srcdir}/cnijfilter-source-${_pkgver}/cngpijmon
  ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --datadir=/usr/share --program-suffix=${_name}
  make clean || return 1
  make || return 1

  ## Compile common stuff
  # libs
  msg "Compile libs..."
  cd ${srcdir}/cnijfilter-source-${_pkgver}/libs
  ./autogen.sh --prefix=/usr
  make clean || return 1
  make || return 1
  # cngpij
  msg "Compile cngpij..."
  cd ${srcdir}/cnijfilter-source-${_pkgver}/cngpij
  ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin
  make clean || return 1
  make || return 1
  # pstocanonij
  msg "Compile pstocanonij..."
  cd ${srcdir}/cnijfilter-source-${_pkgver}/pstocanonij
  ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin
  make clean || return 1
  make || return 1
  # backend
  msg "Compile backend..."
  cd ${srcdir}/cnijfilter-source-${_pkgver}/backend
  ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin
  make clean || return 1
  make || return 1
  # backendnet
  msg "Compile backendnet..."
  cd ${srcdir}/cnijfilter-source-${_pkgver}/backendnet
  ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin LDFLAGS="-L../../com/${_libdir}"
  make clean || return 1
  make || return 1
  # sm sub process
  msg "Compile sm sub process..."
  cd ${srcdir}/cnijfilter-source-${_pkgver}/cngpijmon/cnijnpr
  ./autogen.sh --prefix=/usr LIBS=-ldl
  make clean || return 1
  make || return 1
}

package() {
  ## Install model specific stuff
  # ppd file
  cd ${srcdir}/cnijfilter-source-${_pkgver}/ppd
  make install DESTDIR=${pkgdir} || return 1
  # cnijfilter
  cd ${srcdir}/cnijfilter-source-${_pkgver}/cnijfilter
  make install DESTDIR=${pkgdir} || return 1
  # lgmon
  cd ${srcdir}/cnijfilter-source-${_pkgver}/lgmon
  make install DESTDIR=${pkgdir} || return 1
  # cngpijmon
  cd ${srcdir}/cnijfilter-source-${_pkgver}/cngpijmon
  make install DESTDIR=${pkgdir} || return 1

  ## Install common stuff
  # libs
  cd ${srcdir}/cnijfilter-source-${_pkgver}/libs
  make install DESTDIR=${pkgdir} || return 1
  # cngpij
  cd ${srcdir}/cnijfilter-source-${_pkgver}/cngpij
  make install DESTDIR=${pkgdir} || return 1
  # pstocanonij
  cd ${srcdir}/cnijfilter-source-${_pkgver}/pstocanonij
  make install DESTDIR=${pkgdir} || return 1
  # backend
  cd ${srcdir}/cnijfilter-source-${_pkgver}/backend
  make install DESTDIR=${pkgdir} || return 1
  # backendnet
  cd ${srcdir}/cnijfilter-source-${_pkgver}/backendnet
  make install DESTDIR=${pkgdir} || return 1
  # sm sub process
  cd ${srcdir}/cnijfilter-source-${_pkgver}/cngpijmon/cnijnpr
  make install DESTDIR=${pkgdir} || return 1

  ## Install model specific libraries
  install -d ${pkgdir}/usr/lib/
  install -d ${pkgdir}/usr/lib/bjlib/
  cp -d ${srcdir}/cnijfilter-source-${_pkgver}/${_id}/${_libdir}/* ${pkgdir}/usr/lib/
  cp -d ${srcdir}/cnijfilter-source-${_pkgver}/${_id}/database/* ${pkgdir}/usr/lib/bjlib/

  ## Install common libraries
  cp -d ${srcdir}/cnijfilter-source-${_pkgver}/com/${_libdir}/* ${pkgdir}/usr/lib/
  install -m 666 ${srcdir}/cnijfilter-source-${_pkgver}/com/ini/cnnet.ini ${pkgdir}/usr/lib/bjlib/

  ## Install license files
  cd ${srcdir}/cnijfilter-source-${_pkgver}
  install -d ${pkgdir}/usr/share/licenses/${pkgname}/
  install -m 644 LICENSE-* ${pkgdir}/usr/share/licenses/${pkgname}/
}

# vim:set ts=2 sw=2 et:
