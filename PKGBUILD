# Maintainer: Musikolo <musikolo {at} hotmail [dot] com>
# Contributor: Magician <magician21 ett lycos daht com>
# Contributor: Petrovo https://aur.archlinux.org/account.php?Action=AccountInfo&ID=33361
# Contributor: Pierre-François Gomez https://aur.archlinux.org/account/pef/
# Contributor: Shura https://aur.archlinux.org/account/shura/
# Contributor: Michael Hansen <zrax0111 gmail com>
# Original PKGBUILD file from:
# - https://bbs.archlinux.org/viewtopic.php?pid=757428#p757428
# - http://www.scootersoftware.com/vbulletin/showpost.php?s=3c1f289bc76655230b49f440dbe17b53&p=26449&postcount=7

pkgname=bcompare
pkgver=4.1.1.20615
pkgrel=1
pkgdesc="Beyond Compare 4: Compare, sync, and merge files and folders"
arch=('i686' 'x86_64')
url="http://www.scootersoftware.com"
license=('custom')
groups=('utility')
depends=('fontconfig' 'libsm' 'libxcursor' 'libxft' 'libxinerama'  'libxrandr' 'zlib')
makedepends=('sed')
install=${pkgname}.install
source=("http://www.scootersoftware.com/${pkgname}-${pkgver}.${CARCH}.tar.gz")
sha256sums=('8ba8e7fdaa45f55df4a36a2d41708632cef2fde3166f18a4382f3a9eceaea8bb')
options=('!strip') # Do not strip binaries because it breaks them down

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
  sed -i '/-h \/lib64/{N;N;d;}' install.sh
  sh install.sh --prefix="${pkgdir}"

  # Move some directories to usr
  cd "${pkgdir}"
  if [ -d usr/lib ]; then
    mv usr/lib/* lib
  fi 
  mv bin lib usr/

  # Fix wrong paths
  sed -i "s|"${pkgdir}"|/usr|g" usr/bin/bcompare

  #Clean unneded files
  pushd usr/lib/beyondcompare/ > /dev/null
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
