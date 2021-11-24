# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname="stsw-link007"
_pkgname="STLinkUpgrade"
pkgver=2.38.27
pkgrel=4
_stlink_upgrade_ver=3.3.6
pkgdesc="The firmware upgrade application for ST-LINK, ST-LINK/V2, ST-LINK/V2-1, and STLINK-V3 boards through the USB port"
arch=('x86_64')
url="https://www.st.com/en/development-tools/stsw-link007.html"
license=('custom:SLA0048')
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
provides=("stlink-upgrade" "stlinkupgrade")
# https://www.st.com/content/st_com_cx/en/products/development-tools/software-development-tools/stm32-software-development-tools/stm32-programmers/stsw-link007/_jcr_content/get-software/get-software-table-body.nocache.html/st-site-cx/components/containers/product/get-software-table-body.html
source=("https://st.com/content/ccc/resource/technical/software/firmware/group1/4e/80/8d/29/e0/c7/4e/13/${pkgname}_V${pkgver//./-}/files/${pkgname}_V${pkgver//./-}.zip/jcr:content/translations/en.${pkgname}_V${pkgver//./-}.zip"
        "${pkgname}.sh"
        "${pkgname}.png"
        "SLA0048.pdf::https://www.st.com/resource/en/license_agreement/dm00218346.pdf")
sha256sums=('bb0c1849aa26fac956618c07cb81e29c68676d28ae630ce7a2498968dcfef33e'
            'ccf814ca4b768285e611c809be147be2b0df10d39ceedfafa7f901a56bd4fcd3'
            'a692a0956462419ba10a149c06e8be0f2e1a3e16dfb4b1ce06f9c612bf852d3c'
            'SKIP')

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
