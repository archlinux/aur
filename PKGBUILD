# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname="stsw-link007"
_pkgname="STLinkUpgrade"
pkgver=3.13.4
pkgrel=1
_pkg_main_name="${pkgname}-v${pkgver//./-}"
_pkg_file_name="en.${_pkg_main_name}.zip"
_stlink_upgrade_ver=3.13.4
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

# cURL inspiration from davinci-resolve package maintained by "Alex S".
_curl_useragent="User-Agent: Mozilla/5.0 (X11; Linux ${CARCH}) \
                        AppleWebKit/537.36 (KHTML, like Gecko) \
                        Chrome/77.0.3865.75 \
                        Safari/537.36"
_curl_useragent="$(printf '%s' "$_curl_useragent" | sed 's/[[:space:]]\+/ /g')"
_useragent_escaped="${_curl_useragent// /\\ }"
_curl_req_url="https://www.st.com/content/st_com_cx/en/products/development-tools/software-development-tools/stm32-software-development-tools/stm32-utilities/stsw-link007/_jcr_content/get-software/get-software-table-body.nocache.html/st-site-cx/components/containers/product/get-software-table-body.html"

_curl_req="$(curl -s --compressed -H "$_curl_useragent" "$_curl_req_url")"
_curl_req="$(grep -m 1 "${_pkg_file_name}" <<< "$_curl_req")"
_download_path="https://www.st.com""$(awk -F'"' '{print $4}' <<< "$_curl_req")"


DLAGENTS=("https::/usr/bin/curl \
              -gqb '' --retry 3 --retry-delay 3 \
              -H ${_useragent_escaped} \
              -o %o --compressed %u")

source=("en.${_pkg_main_name}.zip::$_download_path"
        "${pkgname}.sh"
        "${pkgname}.png"
        "SLA0048.pdf::https://www.st.com/resource/en/license_agreement/dm00218346.pdf")
sha256sums=('29ddf51d33fbbc73ef832da1e88cd08c2d2191bbd734de36559a9be91d85cbcb'
            'ccf814ca4b768285e611c809be147be2b0df10d39ceedfafa7f901a56bd4fcd3'
            'a692a0956462419ba10a149c06e8be0f2e1a3e16dfb4b1ce06f9c612bf852d3c'
            '2ceecf9925b8f55418fe75068976125d8b45cf24aecd7e87b8b05d03e4a4c50b')

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
