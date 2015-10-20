# Maintainer: Musikolo <musikolo {at} hotmail [dot] com>
# Contributor: Magician <magician21 ett lycos daht com>
# Contributor: Petrovo https://aur.archlinux.org/account.php?Action=AccountInfo&ID=33361
# Contributor: Pierre-François Gomez https://aur.archlinux.org/account/pef/
# Contributor: Shura https://aur.archlinux.org/account/shura/
# Contributor: Michael Hansen <zrax0111 gmail com>
# Contributor: Wesley Chan https://aur.archlinux.org/account/Wesley_Chan

# Original PKGBUILD file from:
# - https://bbs.archlinux.org/viewtopic.php?pid=757428#p757428
# - http://www.scootersoftware.com/vbulletin/showpost.php?s=3c1f289bc76655230b49f440dbe17b53&p=26449&postcount=7

pkgbase=bcompare
pkgname=('bcompare' 'bcompare-kde' 'bcompare-gnome' 'bcompare-xfce')
pkgver=4.1.1.20615
pkgrel=3
arch=('i686' 'x86_64')
url="http://www.scootersoftware.com"
license=('custom')
groups=('utility')
depends=('qt4' 'fontconfig' 'libsm' 'libxcursor' 'libxft' 'libxinerama'  'libxrandr' 'zlib')
makedepends=('sed')
source_x86_64=("http://www.scootersoftware.com/${pkgname}-${pkgver}.x86_64.tar.gz")
source_i686=("http://www.scootersoftware.com/${pkgname}-${pkgver}.i386.tar.gz")
sha256sums_x86_64=('8ba8e7fdaa45f55df4a36a2d41708632cef2fde3166f18a4382f3a9eceaea8bb')
sha256sums_i686=('ee3468ca8849559aad999a4c1c1375e8d6766033e27d28abd19387d66e43890d')
options=('!strip') # Do not strip binaries because it breaks them down

 prepare() {
  # Prepare the directory skeleton needed for install.sh
  _install_dir="${srcdir}/install"
  mkdir -p "${_install_dir}/usr/share/applications"
  mkdir -p "${_install_dir}/usr/share/doc"
  mkdir -p "${_install_dir}/usr/share/mime/packages"
  mkdir -p "${_install_dir}/usr/share/pixmaps"

  # Set up KDE service menus
  mkdir -p "${_install_dir}/usr/lib/kde4"
  mkdir -p "${_install_dir}/usr/share/kde4/services"

  # Set up Gnome service menus
  mkdir -p "${_install_dir}/usr/lib/nautilus/extensions-3.0"

  # Set up Xfce service menus
  mkdir -p "${_install_dir}/usr/lib/thunarx-2"

  # Apply some fixes on install.sh script
  cd "${pkgname}-${pkgver}"
  sed -i 's|/usr/|${PREFIX}/usr/|g' install.sh
  sed -i '/-h \/lib64/{N;N;d;}' install.sh
 }

package_bcompare() {
  pkgdesc="Beyond Compare 4: Compare, sync, and merge files and folders"
  optdepends=('bcompare-kde: KDE service menus for Beyond Compare 4'
                         'bcompare-gnome: Gnome service menus for Beyond Compare 4'
                         'bcompare-xfce: Xfce service menus for Beyond Compare 4'  )
  install=${pkgname}.install

  # Excecute install script - needs to be run here
  cd "${pkgname}-${pkgver}"
  _install_dir="${srcdir}/install"
  sh install.sh --prefix="${_install_dir}"

  # Prepare the directory skeleton needed for install.sh
  cp -r "${_install_dir}/bin"  "${pkgdir}/"
  cp -r "${_install_dir}/lib"  "${pkgdir}/"
  cp -r "${_install_dir}/usr"  "${pkgdir}/"

  # Move some directories to usr
  cd "${pkgdir}"
  if [ -d usr/lib ]; then
    mv usr/lib/* lib
  fi 
  mv bin lib usr/

  # Fix wrong paths
  sed -i "s|"${pkgdir}"|/usr|g" usr/bin/bcompare

  # Remove KDE, Gnome and Xfce files
  rm -rf "${pkgdir}/usr/share/kde4"
  rm -rf "${pkgdir}/usr/lib/kde4"
  rm -rf "${pkgdir}/usr/lib/nautilus"
  rm -rf "${pkgdir}/usr/lib/thunarx-2"

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

package_bcompare-kde() {
  pkgdesc="KDE service menus for Beyond Compare 4"
  depends=('bcompare')

   msg2 "Packaging KDE service menus..."
  _install_dir="${srcdir}/install"
  # Set up service menus
  mkdir -p "${pkgdir}/usr/lib"
  mkdir -p "${pkgdir}/usr/share"

  mv "${_install_dir}/usr/lib/kde4" "${pkgdir}/usr/lib/"
  mv "${_install_dir}/usr/share/kde4" "${pkgdir}/usr/share"
  msg2 "Done!"
}

package_bcompare-gnome() {
  pkgdesc="Gnome service menus for Beyond Compare 4"
  depends=('bcompare')

  msg2 "Packaging Gnome service menus..."
  _install_dir="${srcdir}/install"
  # Set up service menus
  mkdir -p "${pkgdir}/usr/lib"

  mv "${_install_dir}/usr/lib/nautilus" "${pkgdir}/usr/lib/"
  msg2 "Done!"
}

package_bcompare-xfce() {
  pkgdesc="Xfce service menus for Beyond Compare 4"
  depends=('bcompare')

  msg2 "Packaging Xfce service menus..."
  _install_dir="${srcdir}/install"
  # Set up service menus
  mkdir -p "${pkgdir}/usr/lib"

  mv "${_install_dir}/usr/lib/thunarx-2" "${pkgdir}/usr/lib/"
  msg2 "Done!"
}