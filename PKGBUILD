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
pkgname=('bcompare' 'bcompare-kde6' 'bcompare-kde5' 'bcompare-kde4' 'bcompare-nautilus' 'bcompare-thunar' 'bcompare-cinnamon' 'bcompare-mate')
pkgver=5.1.6.31527
pkgrel=2
arch=('x86_64')
url='https://www.scootersoftware.com'
license=('custom')
groups=('utility')
depends=('qt5-x11extras' 'fontconfig' 'zlib')
makedepends=('sed')
source=("https://www.scootersoftware.com/${pkgbase}-${pkgver}.x86_64.tar.gz")
sha256sums=('eb8720846e153990a62b8e30021f81e89a16e73ff658370949fbee8b1be207f9')
options=('!strip') # Do not strip binaries because it breaks them down

 prepare() {
  # Prepare the directory skeleton needed for install.sh
  _install_dir="${srcdir}/install"
  install -m 755 -d "${_install_dir}/usr/share/applications"
  install -m 755 -d "${_install_dir}/usr/share/doc/${pkgname}"
  install -m 755 -d "${_install_dir}/usr/share/mime/packages"
  install -m 755 -d "${_install_dir}/usr/share/pixmaps"

  # Set up KDE4 service menus
  install -m 755 -d "${_install_dir}/usr/lib/kde4"
  install -m 755 -d "${_install_dir}/usr/share/kde4/services"

  # Set up Gnome service menus
  install -m 755 -d "${_install_dir}/usr/lib/nautilus/extensions-4"
  install -m 755 -d "${_install_dir}/usr/lib/nautilus/extensions-3.0"
  install -m 755 -d "${_install_dir}/usr/lib/nemo/extensions-3.0"
  install -m 755 -d "${_install_dir}/usr/lib/caja/extensions-3.0"

  # Set up Xfce service menus
  install -m 755 -d "${_install_dir}/usr/lib/thunarx-2"
  install -m 755 -d "${_install_dir}/usr/lib/thunarx-3"

  # Apply some fixes on install.sh script
  cd "${pkgbase}-${pkgver}"
  sed -i 's|/usr/|${PREFIX}/usr/|g' install.sh
  sed -i 's|${PREFIX}/usr/bin|/usr/bin|g' install.sh
  sed -i '/-h \/lib64/{N;N;d;}' install.sh
  sed -i 's|kde4-config -v|kde4-config -v 2> /dev/null|' install.sh
 }

package_bcompare() {
  pkgdesc="Beyond Compare 5: Compare, sync, and merge files and folders."
  optdepends=('bcompare-kde6: KDE Plasma 6 service menus for Beyond Compare 5.'
              'bcompare-kde5: KDE Plasma 5 service menus for Beyond Compare 5.'
              'bcompare-kde4: KDE 4 service menus for Beyond Compare 5.'
              'bcompare-nautilus: Gnome/Nautilus service menus for Beyond Compare 5.'
              'bcompare-thunar: Xfce/Thunar service menus for Beyond Compare 5.'
              'bcompare-cinnamon: Cinnamon service menus for Beyond Compare 5.'
              'bcompare-mate: MATE service menus for Beyond Compare 5.'  )
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
  rm -rf "${pkgdir}/usr/lib/thunarx-3"
  rm -rf "${pkgdir}/usr/lib/caja"
  rm -rf "${pkgdir}/usr/lib/nemo"

  pushd usr/lib/beyondcompare/ > /dev/null
  rm -f kde_context_menu uninstall.sh
  mv help "${pkgdir}/usr/share/doc/${pkgname}"
  mv copyright README "${pkgdir}/usr/share/doc/${pkgname}/"
  rm -rf ext
  popd > /dev/null

  # Clean some mime files
  pushd usr/share > /dev/null
  mv  mime/packages .
  rm -rf mime/*
  mv packages mime/
  popd > /dev/null
}

package_bcompare-kde6() {
  pkgdesc="KDE Plasma 6 service menus for Beyond Compare 5."
  depends=('bcompare')
  install=${pkgbase}-kde-plasma.install

  msg2 "Packaging KDE Plasma 6 service menus..."
  cd "${srcdir}/install/lib/beyondcompare/ext"
  install -m 755 -D -t "${pkgdir}/usr/lib/qt6/plugins/kf6/kfileitemaction" bcompare_ext_kde6.amd64.so
  msg2 "Done!"
}

package_bcompare-kde5() {
  pkgdesc="KDE Plasma 5 service menus for Beyond Compare 5."
  depends=('bcompare' 'kinit5')
  install=${pkgbase}-kde-plasma.install

  # Set up service menus
  msg2 "Packaging KDE Plasma 5 service menus..."
  cd "${srcdir}/install/lib/beyondcompare/ext"
  install -m 755 -D -t "${pkgdir}/usr/lib/qt/plugins/kf5/kfileitemaction" bcompare_ext_kde5.amd64.so
  msg2 "Done!"
}

package_bcompare-kde4() {
  pkgdesc="KDE 4 service menus for Beyond Compare 5."
  depends=('bcompare')
  replaces=('bcompare-kde')
  conflicts=('bcompare-kde')

  msg2 "Packaging KDE 4 service menus..."
  _install_dir="${srcdir}/install"
  # Set up service menus
  install -m 755 -d "${pkgdir}/usr/lib"
  install -m 755 -d "${pkgdir}/usr/share"

  mv "${_install_dir}/usr/lib/kde4" "${pkgdir}/usr/lib/"
  mv "${_install_dir}/usr/share/kde4" "${pkgdir}/usr/share"
  msg2 "Done!"
}

package_bcompare-nautilus() {
  pkgdesc="Gnome/Nautilus service menus for Beyond Compare 5."
  depends=('bcompare')
  provides=('bcompare-gnome')

  msg2 "Packaging Gnome/Nautilus service menus..."
  _install_dir="${srcdir}/install"
  # Set up service menus
  install -m 755 -d "${pkgdir}/usr/lib"

  mv "${_install_dir}/usr/lib/nautilus" "${pkgdir}/usr/lib/"
  msg2 "Done!"
}

package_bcompare-thunar() {
  pkgdesc="Xfce/Thunar service menus for Beyond Compare 5."
  depends=('bcompare')
  provides=('bcompare-xfce')

  msg2 "Packaging Xfce/Thunar service menus..."
  _install_dir="${srcdir}/install"
  # Set up service menus
  install -m 755 -d "${pkgdir}/usr/lib"

  mv "${_install_dir}/usr/lib/thunarx-2" "${pkgdir}/usr/lib/"
  mv "${_install_dir}/usr/lib/thunarx-3" "${pkgdir}/usr/lib/"
  msg2 "Done!"
}

package_bcompare-cinnamon() {
  pkgdesc="Cinnamon service menus for Beyond Compare 5."
  depends=('bcompare')

  msg2 "Packaging Cinnamon service menus..."
  _install_dir="${srcdir}/install"
  # Set up service menus
  install -m 755 -d "${pkgdir}/usr/lib"

  mv "${_install_dir}/usr/lib/nemo" "${pkgdir}/usr/lib/"
  msg2 "Done!"
}

package_bcompare-mate() {
  pkgdesc="MATE service menus for Beyond Compare 5."
  depends=('bcompare')

  msg2 "Packaging MATE service menus..."
  _install_dir="${srcdir}/install"
  # Set up service menus
  install -m 755 -d "${pkgdir}/usr/lib"

  mv "${_install_dir}/usr/lib/caja" "${pkgdir}/usr/lib/"
  msg2 "Done!"
}
