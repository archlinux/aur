# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=snmpb
pkgver=1.0
pkgrel=9
pkgdesc='SNMP browser and MIB editor written in Qt.'
arch=('x86_64')
url='https://sourceforge.net/projects/snmpb/'
license=('GPL-2.0-only')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libglvnd' 'qwt' 'qt5-base')
makedepends=('bison' 'flex' 'qt5-tools' 'git')
_smi=0.5.0
_tomcrypt=1.18.2
_qwt=6.3.0
source=("$pkgname-code::git+https://git.code.sf.net/p/snmpb/code"
        "https://www.ibr.cs.tu-bs.de/projects/libsmi/download/libsmi-${_smi}.tar.gz"
        "https://github.com/libtom/libtomcrypt/releases/download/v${_tomcrypt}/crypt-${_tomcrypt}.tar.xz"
        "https://sourceforge.net/projects/qwt/files/qwt/${_qwt}/qwt-${_qwt}.tar.bz2")
sha256sums=('SKIP'
            'f21accdadb1bb328ea3f8a13fc34d715baac6e2db66065898346322c725754d3'
            '96ad4c3b8336050993c5bc2cf6c057484f2b0f9f763448151567fbab5e767b84'
            'dcb085896c28aaec5518cbc08c0ee2b4e60ada7ac929d82639f6189851a6129a')

prepare() {
  mkdir -p "${pkgname}-${pkgver}"
  cp -r ${pkgname}-code/{app,snmp++,license.txt,Makefile} "${pkgname}-${pkgver}"
  # Copy needed Libs
  cp -r libsmi-${_smi} "${pkgname}-${pkgver}/libsmi"
  cp -r libtomcrypt-${_tomcrypt} "${pkgname}-${pkgver}/libtomcrypt"
  cp -r qwt-${_qwt} "${pkgname}-${pkgver}/qwt"
  # Include QwtScaleWidget
  sed '30i#include <qwt_scale_widget.h>' -i "${pkgname}-${pkgver}/app/graph.cpp"
  sed '31i#include <qwt_scale_widget.h>' -i "${pkgname}-${pkgver}/app/graph.h"
  # Patch qwt
  sed -e '/^\s*QWT_INSTALL_PREFIX/ s|=.*|= /usr|' \
      -e '/^QWT_INSTALL_DOCS/ s|/doc|/share/doc/qwt|' \
      -e '/^QWT_INSTALL_HEADERS/ s|include|&/qwt|' \
      -e '/^QWT_INSTALL_PLUGINS/ s|plugins/designer|lib/qt/&|' \
      -e '/^QWT_INSTALL_FEATURES/ s|features|lib/qt/mkspecs/&|' \
      -i "${pkgname}-${pkgver}/qwt/qwtconfig.pri"
}

build() {
  cd "${pkgname}-${pkgver}"
  # Fix for gcc-14 issues
  CFLAGS+=' -Wno-error=implicit-function-declaration'
  # Libsmi
  cd libsmi
  autoreconf -i
  ./configure --disable-shared --disable-yang \
    --with-pathseparator=";" --with-dirseparator="/" \
    --with-smipath="/usr/share/apps/snmpb/mibs;/usr/share/apps/snmpb/pibs"
  make V=0
  # Libtomcrypt
  cd ../libtomcrypt
  make library
  # Qwt
  cd ../qwt
  qmake-qt5 qwt.pro
  make
  # Build snmpb Qt App
  cd ../app
  qmake-qt5 -o makefile.snmpb snmpb.pro
  make -f makefile.snmpb
}

package() {
  # Install package
  cd "${pkgname}-${pkgver}"
  make INSTALL_PREFIX="${pkgdir}/usr" install

  # User config files stored in
  # $HOME/.config/snmpb.sourceforge.net

  # Default dirs for MIBs/PIBs:
  # /usr/share/apps/snmpb/mibs
  # /usr/share/apps/snmpb/pibs
}

# vim: ts=2 sw=2 et:

