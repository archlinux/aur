# Maintainer: Wesley <Wesley at example dot com>
# Script stolen from bcompare. All credits to them.
# Original author: Musikolo <musikolo {at} hotmail [dot] com>
# Contributor: Magician <magician21 ett lycos daht com>
# Contributor: Petrovo https://aur.archlinux.org/account.php?Action=AccountInfo&ID=33361
# Contributor: Pierre-François Gomez https://aur.archlinux.org/account/pef/
# Contributor: Shura https://aur.archlinux.org/account/shura/
# Original PKGBUILD file from:
# - https://bbs.archlinux.org/viewtopic.php?pid=757428#p757428
# - http://www.scootersoftware.com/vbulletin/showpost.php?s=3c1f289bc76655230b49f440dbe17b53&p=26449&postcount=7

pkgname=bcompare-beta
pkgver=4.1.0.20431
pkgrel=1
pkgdesc="A tool for comparing, merging text files, binary files and folders."
arch=('i686' 'x86_64')
url="http://www.scootersoftware.com"
license=('custom')
groups=('utility')
makedepends=('sed')
install=${pkgname}.install
source_i686=("http://www.scootersoftware.com/bcompare-${pkgver}.i386.tar.gz")
source_x86_64=("http://www.scootersoftware.com/bcompare-${pkgver}.x86_64.tar.gz")
sha256sums_i686=('aa554f772403c8baf8ec2393e305478dc4a327abc305c2408ca0a62d39e20ae3')
sha256sums_x86_64=('54968f0e47d2ac8f5f7493b8043b30422a0810cdfb08f52c56844b7e0df0ec15')
options=('!strip') # Do not strip binaries because it breaks them down

#Set up platform-specific variables
_LIB_DIR='lib'
_PKG_TYPE=''
if test "$CARCH" == x86_64; then
  _LIB_DIR='lib32'
  _PKG_TYPE='lib32-'
fi

depends+=(${_PKG_TYPE}gtk2 ${_PKG_TYPE}libsm)

package() {
  # Prepare the directory skeleton needed for install.sh
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/doc"
  mkdir -p "${pkgdir}/usr/share/mime/packages"
  mkdir -p "${pkgdir}/usr/share/pixmaps"

  # Set up service menus
  echo -n "Do you want to install KDE service menus globally? [Y/n] "
  read key
  if [ "$key" != "n" -a "$key" != "N" ]; then
    echo -n "Including KDE service menus in the package..."
    mkdir -p "${pkgdir}/usr/lib/kde4"
    mkdir -p "${pkgdir}/usr/share/kde4/services/"
    echo " Done!"
  else
   echo "KDE service menus will NOT be included in the package."
  fi

  echo -n "Do you want to install Nautilus service menus globally? [Y/n] "
  read key
  if [ "$key" != "n" -a "$key" != "N" ]; then
    echo -n "Including Nautilus service menus in the package..."
    mkdir -p "${pkgdir}/usr/lib/nautilus/extensions-3.0/"
    echo " Done!"
  else
   echo "Nautilus service menus will NOT be included in the package."
  fi

  echo -n "Do you want to install Thunar service menus globally? [Y/n] "
  read key
  if [ "$key" != "n" -a "$key" != "N" ]; then
    echo -n "Including Thunar service menus in the package..."
    mkdir -p "${pkgdir}/usr/lib/thunarx-2/"
    echo " Done!"
  else
   echo "Thunar service menus will NOT be included in the package."
  fi

  # Apply some fixes on install.sh before run it
  cd ${srcdir}/bcompare-${pkgver}
  sed -i 's|/usr/|${PREFIX}/usr/|g' install.sh
  sh install.sh --prefix="${pkgdir}"

  # Move some directories to usr
  cd "${pkgdir}"
  if [ -d usr/${_LIB_DIR} ]; then
    mv usr/${_LIB_DIR}/* ${_LIB_DIR}
  fi 
  mv bin ${_LIB_DIR} usr/

  # Fix wrong path
  sed -i "s|"${pkgdir}"|/usr|g" usr/bin/bcompare

  #Clean unneded files
  pushd usr/${_LIB_DIR}/beyondcompare/ > /dev/null
  rm -f uninstall.sh RPM-GPG-KEY-scootersoftware scootersoftware.repo kde_context_menu
  mv help "${pkgdir}/usr/share/doc/beyondcompare"
  mv README "${pkgdir}/usr/share/doc/beyondcompare/"
  rm -rf ext
  popd > /dev/null

  # Clean some mime files
  pushd usr/share > /dev/null
  mv  mime/packages .
  rm -rf mime/*
  mv packages mime/
  popd > /dev/null
}
