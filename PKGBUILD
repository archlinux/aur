# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Grigory Vasilyev <echo "h0tc0d3(-*A*-)g-m*a-i-l(-d#t-)c#m" | sed -e 's/-//ig;s/*//ig;s/(A)/@/i;s/#/o/ig;s/(dot)/./i'>

pkgname=stlink-server
_pkgname=st-link-server
pkgver=2.1.1
pkgrel=3
pkgdesc="An application to share the debug interface of a single ST-LINK board among several host applications, typically a debugging tool and a monitoring tool"
arch=('x86_64')
url="'https://www.st.com/en/development-tools/st-link-server.html"
license=('custom:SLA0048')
# stlink provides stlink udev rules
depends=("stlink"
         "libusb")

_pkg_license_name="SLA0048_${_pkgname^^}.pdf"
# Non-uniform name conventions
_pkg_zip_name="en.${_pkgname}-v${pkgver}.zip"
_pkg_uncompress_dir="en.${_pkgname}_v${pkgver}-2"
_stlink_server_bin="${pkgname}.${pkgver}-1"

# User Agent
# sync from stm32cubeprog
_curl_useragent="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:129.0) Gecko/20100101 Firefox/129.0"
_curl_accept_language="Accept-Language: en-US,en;q=0.9"
_curl_useragent="$(printf '%s' "$_curl_useragent" | sed 's/[[:space:]]\+/ /g')"
_useragent_escaped="${_curl_useragent// /\\ }"
_accept_language_escaped="${_curl_accept_language// /\\ }"

_curl_req_url="https://www.st.com/content/st_com_cx/en/products/development-tools/software-development-tools/\
stm32-software-development-tools/stm32-performance-and-debuggers/st-link-server/_jcr_content/get-software/\
getsw-table-nli.nocache.html/st-site-cx/components/containers/product/get-software-table-body.html"

_curl_req="$(curl -s --compressed -H "${_curl_useragent}" -H "${_curl_accept_language}" "${_curl_req_url}")"
_pkg_url="$(grep -m 1 "${_pkg_zip_name}" <<<"${_curl_req}")"
_pkg_url="$(awk -F'"' '{print $4}' <<<"${_pkg_url}")"
_download_path="https://www.st.com""${_pkg_url}"
DLAGENTS=("https::/usr/bin/curl \
              -gqb '' --retry 3 --retry-delay 3 \
              -H ${_useragent_escaped} \
              -H ${_accept_language_escaped} \
              -o %o --compressed %u")
source=("${_pkg_zip_name}::${_download_path}"
        "https://www.st.com/resource/en/license/${_pkg_license_name}")
sha256sums=('a84a0ada7c9b6343e559dacd37e42a815c500d0f4a517db3d1e511d056903bf6'
            '89c26988b9c0533f86d4ce84b683ce6075ac7cdd42c69b92c2f8ea156f0db3ac')

_bundle_sh_extract() {
  local bundle_sh="$1"
  local target="$2"

  chmod u+x "${bundle_sh}"
  rm -rf "${target}"
  ./${bundle_sh} --noexec --target "${target}"
}

_install_license_pdf() {
  echo "Installing license ${_pkg_license_name}..."
  install -Dm644 ${srcdir}/${_pkg_license_name} -t \
                  "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package() {

  cd ${srcdir}/${_pkg_uncompress_dir}
  
  chmod u+x ${_stlink_server_bin}
  set junk  $(./${_stlink_server_bin} 2>&1 -v)

  version_string=$3
  timestamp=$4
  echo "Installing stlink-server ${version_string} ${timestamp}..."
  install -Dm755 ${_stlink_server_bin} ${pkgdir}/usr/bin/${pkgname}

  _install_license_pdf
}
# vim: set sw=2 ts=2 et:
