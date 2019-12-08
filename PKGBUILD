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
pkgname=('bcompare' 'bcompare-kde5' 'bcompare-kde4' 'bcompare-nautilus' 'bcompare-thunar' 'bcompare-cinnamon' 'bcompare-mate')
pkgver=4.3.3.24545
pkgrel=1
arch=('i686' 'x86_64')
url='http://www.scootersoftware.com'
license=('custom')
groups=('utility')
depends=('fontconfig' 'libsm' 'libxcursor' 'libxft' 'libxinerama'  'libxrandr' 'zlib')
makedepends=('sed')
source_x86_64=("http://www.scootersoftware.com/${pkgbase}-${pkgver}.x86_64.tar.gz")
source_i686=("http://www.scootersoftware.com/${pkgbase}-${pkgver}.i386.tar.gz")
sha256sums_i686=('8ce5e2f2b9364044d441e0fcc94dcfbaba1e5784dcc09aead0805fe81b5c6fce')
sha256sums_x86_64=('9d9a7e9c01b3e2b1ade8528a1367eb1280eaf57b16f3fa47785aa079c0f55c1f')
options=('!strip') # Do not strip binaries because it breaks them down

 prepare() {
  # Prepare the directory skeleton needed for install.sh
  _install_dir="${srcdir}/install"
  mkdir -p "${_install_dir}/usr/share/applications"
  mkdir -p "${_install_dir}/usr/share/doc"
  mkdir -p "${_install_dir}/usr/share/mime/packages"
  mkdir -p "${_install_dir}/usr/share/pixmaps"

  # Set up KDE Plasmma 5 service menus
  mkdir -p "${_install_dir}/usr/lib/x86_64-linux-gnu/qt5/plugins/kf5/kfileitemaction"

  # Set up KDE4 service menus
  mkdir -p "${_install_dir}/usr/lib/kde4"
  mkdir -p "${_install_dir}/usr/share/kde4/services"

  # Set up Gnome service menus
  mkdir -p "${_install_dir}/usr/lib/nautilus/extensions-3.0"
  mkdir -p "${_install_dir}/usr/lib/nemo/extensions-3.0"
  mkdir -p "${_install_dir}/usr/lib/caja/extensions-3.0"

  # Set up Xfce service menus
  mkdir -p "${_install_dir}/usr/lib/thunarx-2"

  # Apply some fixes on install.sh script
  cd "${pkgbase}-${pkgver}"
  sed -i 's|/usr/|${PREFIX}/usr/|g' install.sh
  sed -i 's|${PREFIX}/usr/bin|/usr/bin|g' install.sh
  sed -i '/-h \/lib64/{N;N;d;}' install.sh
  sed -i "/ldconfig$/d" install.sh
 }

package_bcompare() {
  pkgdesc="Beyond Compare 4: Compare, sync, and merge files and folders"
  optdepends=('bcompare-kde4: KDE 4 service menus for Beyond Compare 4'
              'bcompare-kde5: KDE Plasma 5 service menus for Beyond Compare 4'
              'bcompare-nautilus: Nautilus service menus for Beyond Compare 4'
              'bcompare-thunar: Thunar service menus for Beyond Compare 4'
              'bcompare-cinnamon: Cinnamon service menus for Beyond Compare 4'
              'bcompare-mate: MATE service menus for Beyond Compare 4'  )
  install=${pkgbase}.install

  # Excecute install script - needs to be run here
  cd "${pkgbase}-${pkgver}"
  _install_dir="${srcdir}/install"
  sh -version &> /dev/null && sh   install.sh --prefix="${_install_dir}"\
                           || bash install.sh --prefix="${_install_dir}"

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
  sed -i "s|"${_install_dir}"|/usr|g" usr/bin/bcompare

  # Remove KDE, Gnome and Xfce files
  rm -rf "${pkgdir}/usr/share/kde4"
  rm -rf "${pkgdir}/usr/lib/x86_64-linux-gnu"
  rm -rf "${pkgdir}/usr/lib/kde4"
  rm -rf "${pkgdir}/usr/lib/nautilus"
  rm -rf "${pkgdir}/usr/lib/thunarx-2"
  rm -rf "${pkgdir}/usr/lib/caja"
  rm -rf "${pkgdir}/usr/lib/nemo"

  #Clean unneded files
  pushd usr/lib/beyondcompare/ > /dev/null
  rm -f uninstall.sh RPM-GPG-KEY-scootersoftware scootersoftware.repo kde_context_menu
  mv help "${pkgdir}/usr/share/doc/beyondcompare"
  mv README "${pkgdir}/usr/share/doc/beyondcompare/"
  rm -rf ext
  popd > /dev/null

  # Link help where Help -> Contents option is expecting to find it
  ln -sf "/usr/share/doc/beyondcompare" "${pkgdir}/usr/lib/beyondcompare/help"

  # Clean some mime files
  pushd usr/share > /dev/null
  mv  mime/packages .
  rm -rf mime/*
  mv packages mime/
  popd > /dev/null
}

package_bcompare-kde5() {
  pkgdesc="KDE Plasma 5 service menus for Beyond Compare 4"
  depends=('bcompare')
  install=${pkgbase}-kde5.install

   msg2 "Packaging KDE Plasma 5 service menus..."
  _install_dir="${srcdir}/install"
  # Set up service menus
  mkdir -p "${pkgdir}/usr/lib"
  mv "${_install_dir}/usr/lib/x86_64-linux-gnu/qt5" "${pkgdir}/usr/lib/qt"
  msg2 "Done!"
}

package_bcompare-kde4() {
  pkgdesc="KDE 4 service menus for Beyond Compare 4"
  depends=('bcompare')
  replaces=('bcompare-kde')
  conflicts=('bcompare-kde')

   msg2 "Packaging KDE 4 service menus..."
  _install_dir="${srcdir}/install"
  # Set up service menus
  mkdir -p "${pkgdir}/usr/lib"
  mkdir -p "${pkgdir}/usr/share"

  mv "${_install_dir}/usr/lib/kde4" "${pkgdir}/usr/lib/"
  mv "${_install_dir}/usr/share/kde4" "${pkgdir}/usr/share"
  msg2 "Done!"
}

package_bcompare-nautilus() {
  pkgdesc="Gnome service menus for Beyond Compare 4"
  depends=('bcompare')
  provides=('bcompare-gnome')

  msg2 "Packaging Gnome service menus..."
  _install_dir="${srcdir}/install"
  # Set up service menus
  mkdir -p "${pkgdir}/usr/lib"

  mv "${_install_dir}/usr/lib/nautilus" "${pkgdir}/usr/lib/"
  msg2 "Done!"
}

package_bcompare-thunar() {
  pkgdesc="Xfce service menus for Beyond Compare 4"
  depends=('bcompare')
  provides=('bcompare-xfce')

  msg2 "Packaging Xfce service menus..."
  _install_dir="${srcdir}/install"
  # Set up service menus
  mkdir -p "${pkgdir}/usr/lib"

  mv "${_install_dir}/usr/lib/thunarx-2" "${pkgdir}/usr/lib/"
  msg2 "Done!"
}

package_bcompare-cinnamon() {
  pkgdesc="Cinnamon service menus for Beyond Compare 4"
  depends=('bcompare')

  msg2 "Packaging Cinnamon service menus..."
  _install_dir="${srcdir}/install"
  # Set up service menus
  mkdir -p "${pkgdir}/usr/lib"

  mv "${_install_dir}/usr/lib/nemo" "${pkgdir}/usr/lib/"
  msg2 "Done!"
}

package_bcompare-mate() {
  pkgdesc="MATE service menus for Beyond Compare 4"
  depends=('bcompare')

  msg2 "Packaging MATE service menus..."
  _install_dir="${srcdir}/install"
  # Set up service menus
  mkdir -p "${pkgdir}/usr/lib"

  mv "${_install_dir}/usr/lib/caja" "${pkgdir}/usr/lib/"
  msg2 "Done!"
}
