# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname="stsw-link007"
_pkgname="STLinkUpgrade"
pkgver=3.15.7
pkgrel=2
_stlink_upgrade_ver=3.15.7
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
options=('!strip')

# Non-uniform name conventions
_pkg_license_name="SLA0048_${pkgname^^}.pdf"
_pkg_zip_name="en.${pkgname}-v${pkgver//./-}.zip"

# sync from stm32cubeide, thanks to @kumencz!
# Download file with list of URLs to files
_curl_req_url="https://www.st.com/content/st_com_cx/en/products/development-tools/software-development-tools/stm32-software-development-tools/stm32-utilities/stsw-link007/_jcr_content/get-software/getsw-table-nli.nocache.html/st-site-cx/components/containers/product/get-software-table-body.html"
_curl_req="$(curl -s --compressed --cookie-jar "${srcdir}http_cookies" -H "@${srcdir}http_headers" "${_curl_req_url}")"

_pkg_url="$(grep -m 1 "${_pkg_zip_name}" <<<"${_curl_req}")"
_pkg_url="$(awk -F'"' '{print $4}' <<<"${_pkg_url}")"
_download_path="https://www.st.com""${_pkg_url}"
DLAGENTS=("https::/usr/bin/curl \
              -gqb '' --retry 3 --retry-delay 3 \
              --cookie "${srcdir}http_cookies" \
              -H "@${srcdir}http_headers" \
              -o %o --compressed %u")

source=("${_pkg_zip_name}::$_download_path"
        "${pkgname}.sh"
        "${pkgname}.png"
        "http_headers"
        "https://www.st.com/resource/en/license/${_pkg_license_name}")

sha256sums=('cb3bc1a7397f13839347a989b8ea664aced4de86a1af73a2490b255b880406ee'
            'ccf814ca4b768285e611c809be147be2b0df10d39ceedfafa7f901a56bd4fcd3'
            'a692a0956462419ba10a149c06e8be0f2e1a3e16dfb4b1ce06f9c612bf852d3c'
            '12e85339c74dc80c054062432dfc6f0eb1be3214fcb4f1fab427193f4e6f0d22'
            'SKIP')

package() {

  # wrapper
  install -Dm755 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
  
  # icon
  install -Dm644 ${srcdir}/${pkgname}.png -t ${pkgdir}/usr/share/pixmaps/
  
  # license
  install -Dm644 ${srcdir}/${_pkg_license_name} -t ${pkgdir}/usr/share/licenses/${pkgname}

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
