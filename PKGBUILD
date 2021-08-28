# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname="stsw-link007"
_pkgname="STLinkUpgrade"
pkgver=2.38.27
pkgrel=1
_stlink_upgrade_ver=3.3.6
pkgdesc="The firmware upgrade application for ST-LINK, ST-LINK/V2, ST-LINK/V2-1, and STLINK-V3 boards through the USB port"
arch=('any')
url="https://www.st.com/en/development-tools/stsw-link007.html"
license=('SLA0048')
# depends comments
#
## java-runtime>=7 :
# The application requires the Java Runtime Environment 7u51 (or more recent) being installed.
## libusb :
# On Linux, the application relies on libusb-1.0, which must be installed separately.
## stlink (provides stlink udev rules) :
# On Linux, users must be granted with rights for accessing the ST-Link USB devices. To do that, it might be necessary to add rules into /etc/udev/rules.d.
# ---------------------------------------------
# src/stsw-link007/readme.txt
depends=('stlink'
         'libusb'
         'java-runtime>=7')
makedepends=('xdg-user-dirs')
provides=("stlink-upgrade" "stlinkupgrade")
_pkg_file_archive="en.${pkgname}_V${pkgver//./-}_v${pkgver}.zip"
source=("local://${_pkg_file_archive}"
        "${pkgname}.sh"
        "${pkgname}.png"
        "SLA0048.pdf::https://www.st.com/resource/en/license_agreement/dm00218346.pdf")
sha256sums=('bb0c1849aa26fac956618c07cb81e29c68676d28ae630ce7a2498968dcfef33e'
            'ccf814ca4b768285e611c809be147be2b0df10d39ceedfafa7f901a56bd4fcd3'
            'dd7795c45a38b8bb652f37fced82f6d5ce6cbf5dffd7b29b784a89496757e991'
            '2ceecf9925b8f55418fe75068976125d8b45cf24aecd7e87b8b05d03e4a4c50b')
      
_DOWNLOADS_DIR=`xdg-user-dir DOWNLOAD`
if [ ! -f ${PWD}/${_pkg_file_archive} ]; then
  if [ -f $_DOWNLOADS_DIR/${_pkg_file_archive} ]; then
    ln -sfn $_DOWNLOADS_DIR/${_pkg_file_archive} ${PWD}
  else
    echo ""
    echo "STSW-LINK007 archive not found. The package can be downloaded here: https://www.st.com/en/development-tools/stsw-link007.html"
    echo "Please remember to put a downloaded package ${_pkg_file_archive} into the build directory ${PWD} or $_DOWNLOADS_DIR"
    echo ""
  fi
fi

package() {

  # wrapper
  install -Dm755 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
  
  # icon
  install -Dm644 ${srcdir}/${pkgname}.png -t ${pkgdir}/usr/share/pixmaps/
  
  # license
  install -Dm644 ${srcdir}/SLA0048.pdf -t ${pkgdir}/usr/share/licenses/${pkgname}

  # doc
  install -Dm644 ${srcdir}/${pkgname}/readme.txt -t ${pkgdir}/usr/share/doc/${pkgname}

  # desktop enrty
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/${_pkgname}.desktop" <<END
[Desktop Entry]
Comment=${_pkgname} ${_stlink_upgrade_ver}
Comment[en]=${_pkgname} ${_stlink_upgrade_ver}
Encoding=UTF-8
Exec=${_pkgname}
Icon=${pkgname}
Name=${_pkgname}
Name[en]=${_pkgname}
Type=Application
END

  # ST-link upgrade 
  install -Dm644 ${srcdir}/${pkgname}/AllPlatforms/${_pkgname}.jar -t ${pkgdir}/usr/share/java/${pkgname}/
  install -Dm644 ${srcdir}/${pkgname}/AllPlatforms/native/linux_x64/libSTLinkUSBDriver.so -t ${pkgdir}/usr/share/java/${pkgname}/native/linux_x64/
}
# vim: set sw=2 ts=2 et:
