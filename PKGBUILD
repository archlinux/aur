# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=snmpb
pkgver=1.0
pkgrel=10
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
)
sha256sums=('SKIP'
            'f21accdadb1bb328ea3f8a13fc34d715baac6e2db66065898346322c725754d3'
            '96ad4c3b8336050993c5bc2cf6c057484f2b0f9f763448151567fbab5e767b84'
            'dcb085896c28aaec5518cbc08c0ee2b4e60ada7ac929d82639f6189851a6129a')
prepare() {
  # Create the build directory
  mkdir -p "${srcdir}/${pkgname}-${pkgver}"

  # Arrays to hold original and new folder names
  local original_folders=("libsmi-${_smi}" "libtomcrypt-${_tomcrypt}" "qwt-${_qwt}")
  local new_folders=("libsmi" "libtomcrypt" "qwt")
  
  # Rename source folders
  for i in "${!original_folders[@]}"; do
    mv "${srcdir}/${original_folders[i]}" "${srcdir}/${new_folders[i]}"
  done
  
  # Files and directories to copy
  local items_to_copy=("app" "snmp++" "license.txt" "Makefile")

  # Copy project files
  for item in "${items_to_copy[@]}"; do
    cp -Pr "${srcdir}/${pkgname}-code/${item}" "${srcdir}/${pkgname}-${pkgver}/"
  done 

  # Copy necessary libraries
  for lib in "${new_folders[@]}"; do
    cp -Pr "${srcdir}/${lib}" "${srcdir}/${pkgname}-${pkgver}/"
  done

  # Include QwtScaleWidget
  sed '30i#include <qwt_scale_widget.h>' -i "${srcdir}/${pkgname}-${pkgver}/app/graph.cpp"
  sed '31i#include <qwt_scale_widget.h>' -i "${srcdir}/${pkgname}-${pkgver}/app/graph.h"

  # Patch qwt configuration
  sed -e '/^\s*QWT_INSTALL_PREFIX/ s|=.*|= /usr|' \
    -e '/^QWT_INSTALL_DOCS/ s|/doc|/share/doc/qwt|' \
    -e '/^QWT_INSTALL_HEADERS/ s|include|&/qwt|' \
    -e '/^QWT_INSTALL_PLUGINS/ s|plugins/designer|lib/qt/&|' \
    -e '/^QWT_INSTALL_FEATURES/ s|features|lib/qt/mkspecs/&|' \
    -i "${srcdir}/${pkgname}-${pkgver}/qwt/qwtconfig.pri"
}
build() {
  local build_dir="${srcdir}/${pkgname}-${pkgver}"
  local libsmi_dir="${build_dir}/libsmi"
  local libtomcrypt_dir="${build_dir}/libtomcrypt"
  local qwt_dir="${build_dir}/qwt"
  local app_dir="${build_dir}/app"

  cd "${build_dir}"

  # Fix for gcc-14 issues
  export CFLAGS="${CFLAGS} -Wno-error=implicit-function-declaration"

  # Build Libsmi
  cd "${libsmi_dir}"
  autoreconf -i
  ./configure \
    --disable-shared \
    --disable-yang \
    --with-pathseparator=";" \
    --with-dirseparator="/" \
    --with-smipath="/usr/share/apps/snmpb/mibs;/usr/share/apps/snmpb/pibs"
  make V=0

  # Build Libtomcrypt
  cd "${libtomcrypt_dir}"
  make library

  # Build Qwt
  cd "${qwt_dir}"
  qmake qwt.pro
  make

  # Build snmpb Qt App
  cd "${app_dir}"
  qmake -o makefile.snmpb snmpb.pro
  make -f makefile.snmpb
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install the built package
  make INSTALL_PREFIX="${pkgdir}/usr" install

  # User config files stored in
  # $HOME/.config/snmpb.sourceforge.net

  # Default dirs for MIBs/PIBs
  # /usr/share/apps/snmpb/mibs
  # /usr/share/apps/snmpb/pibs
}

# vim: ts=2 sw=2 et:
