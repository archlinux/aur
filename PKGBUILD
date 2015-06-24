# Maintainer: Musikolo <musikolo {at} hotmail [dot] com>
# Contributor: Magician <magician21 ett lycos daht com>
# Contributor: Petrovo https://aur.archlinux.org/account.php?Action=AccountInfo&ID=33361
# Contributor: Pierre-François Gomez https://aur.archlinux.org/account/pef/
# Contributor: Shura https://aur.archlinux.org/account/shura/
# Original PKGBUILD file from:
# - https://bbs.archlinux.org/viewtopic.php?pid=757428#p757428
# - http://www.scootersoftware.com/vbulletin/showpost.php?s=3c1f289bc76655230b49f440dbe17b53&p=26449&postcount=7

pkgname=bcompare
pkgver=4.0.7.19761
pkgrel=2
pkgdesc="Beyond Compare 4: Compare, sync, and merge files and folders"
arch=('i686' 'x86_64')
url="http://www.scootersoftware.com"
license=('custom')
groups=('utility')
makedepends=('sed')
install=${pkgname}.install
source=("http://www.scootersoftware.com/${pkgname}-${pkgver}.tar.gz")
sha256sums=('541c265d7a8a0981cdeb47a06a3fe83467ac5f73b4d064fdfa29910e97fb4f3d')
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

  # Apply some fixes on install.sh before run it
  cd ${pkgname}-${pkgver}
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
