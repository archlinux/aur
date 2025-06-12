# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=snmpb
pkgver=1.0
pkgrel=11
pkgdesc="SNMP browser and MIB editor written in Qt"
arch=('x86_64')
url="https://sourceforge.net/projects/snmpb"
license=('GPL-2.0-only')
depends=(
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libglvnd'
  'qt5-base'
  'qwt'
)
makedepends=(
  'autoconf'
  'automake'
  'bison'
  'flex'
  'git'
  'qt5-tools'
)
_smi=0.5.0
_tomcrypt=1.18.2
_qwt=6.3.0
source=(
  "${pkgname}-code::git+https://git.code.sf.net/p/snmpb/code"
  "https://www.ibr.cs.tu-bs.de/projects/libsmi/download/libsmi-${_smi}.tar.gz"
  "https://github.com/libtom/libtomcrypt/releases/download/v${_tomcrypt}/crypt-${_tomcrypt}.tar.xz"
  "https://sourceforge.net/projects/qwt/files/qwt/${_qwt}/qwt-${_qwt}.tar.bz2"
  "0001-Fix-build-failure-with-gcc-15.patch"
)
sha256sums=('SKIP'
            'f21accdadb1bb328ea3f8a13fc34d715baac6e2db66065898346322c725754d3'
            '96ad4c3b8336050993c5bc2cf6c057484f2b0f9f763448151567fbab5e767b84'
            'dcb085896c28aaec5518cbc08c0ee2b4e60ada7ac929d82639f6189851a6129a'
            '7afa41f292e404854953ea52dac269671462cb638a6daf5cc21b5baaf92df7c5')

prepare() {
  cd "${srcdir}"
  mv "libsmi-${_smi}" "libsmi"
  mv "libtomcrypt-${_tomcrypt}" "libtomcrypt"
  mv "qwt-${_qwt}" "qwt"

  # Copy code to working directory
  mkdir -p "${pkgname}-${pkgver}"
  cp -Pr "${pkgname}-code"/{app,snmp++,license.txt,Makefile} "${pkgname}-${pkgver}/"
  cp -Pr libsmi libtomcrypt qwt "${pkgname}-${pkgver}/"

  # Apply GCC 15 patch to libsmi
  patch -d "${pkgname}-${pkgver}/libsmi" -p1 < "${srcdir}/0001-Fix-build-failure-with-gcc-15.patch"

  # Fix Qwt includes in app sources
  sed '30i#include <qwt_scale_widget.h>' -i "${pkgname}-${pkgver}/app/graph.cpp"
  sed '31i#include <qwt_scale_widget.h>' -i "${pkgname}-${pkgver}/app/graph.h"

  # Patch qwt config for proper install locations
  sed -e '/^\s*QWT_INSTALL_PREFIX/ s|=.*|= /usr|' \
      -e '/^QWT_INSTALL_DOCS/ s|/doc|/share/doc/qwt|' \
      -e '/^QWT_INSTALL_HEADERS/ s|include|&/qwt|' \
      -e '/^QWT_INSTALL_PLUGINS/ s|plugins/designer|lib/qt/&|' \
      -e '/^QWT_INSTALL_FEATURES/ s|features|lib/qt/mkspecs/&|' \
      -i "${pkgname}-${pkgver}/qwt/qwtconfig.pri"
}

build() {
  local build_dir="${pkgname}-${pkgver}"
  cd "${build_dir}"

  export CFLAGS="${CFLAGS} -Wno-error=implicit-function-declaration"

  # Build libsmi
  cd libsmi
  autoreconf -i
  ./configure \
    --disable-shared \
    --disable-yang \
    --with-pathseparator=";" \
    --with-dirseparator="/" \
    --with-smipath="/usr/share/apps/snmpb/mibs;/usr/share/apps/snmpb/pibs"
  make
  cd ..

  # Build libtomcrypt
  cd libtomcrypt
  make library
  cd ..

  # Build Qwt
  cd qwt
  qmake qwt.pro
  make
  cd ..

  # Build main app
  cd app
  qmake -o makefile.snmpb snmpb.pro
  make -f makefile.snmpb
}

package() {
  cd "${pkgname}-${pkgver}"

  # Install the built package
  make INSTALL_PREFIX="${pkgdir}/usr" install

  # Remove setuid/setgid if set
  chmod u-s,g-s "${pkgdir}/usr/bin/snmpb"

  # User config files stored in
  # $HOME/.config/snmpb.sourceforge.net

  # Default dirs for MIBs/PIBs
  # /usr/share/apps/snmpb/mibs
  # /usr/share/apps/snmpb/pibs
}

# vim: ts=2 sw=2 et:
