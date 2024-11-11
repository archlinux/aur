# Maintainer: kumen
# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=stm32cubemonitor
_pkgname=STM32CubeMon
_pkg_file_name=en.stm32cubemon-lin-v-1-9-0.zip
pkgver=1.9.0
pkgrel=1
pkgdesc="Graphical software for helping debug and diagnose STM32 applications while they are running by reading and displaying their variables in real-time"
arch=('x86_64')
url="https://www.st.com/en/development-tools/stm32cubemonitor.html"
license=('custom:SLA0048')
# package stlink provides stlink udev files
depends=('gtk3' 'nss' 'libxss' 'libnotify' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'stlink')
options=('!strip')

# Download file with list of URLs to files
_curl_req_url="https://www.st.com/content/st_com_cx/en/products/development-tools/software-development-tools/stm32-software-development-tools/stm32-performance-and-debuggers/stm32cubemonitor/_jcr_content/get-software/getsw-table-nli.nocache.html/st-site-cx/components/containers/product/get-software-table-body.html"
_curl_req="$(curl -s --compressed -H "@${srcdir}http_headers" "$_curl_req_url" )"

# Extract actual download link to the desired file
_pkg_url="$(grep -m 1 "${_pkg_file_name}" <<< "$_curl_req")"
_pkg_url="$(awk -F'"' '{print $4}' <<< "$_pkg_url")"
_download_path="https://www.st.com""$_pkg_url"
#echo $_download_path

DLAGENTS=("https::/usr/bin/curl \
            -gqb '' --retry 3 --retry-delay 3 \
            -H "@${srcdir}http_headers" \
            -o %o --compressed %u")
              
source=("${_pkg_file_name}"::"$_download_path")
sha256sums=('efd5f4ce5cc9b5b44f2be90fd469559f081c6c28f1fe4a095af698b9dccc4adf')

prepare() {
  install -dm755 build

  bsdtar -xf ${srcdir}/${pkgname}_${pkgver}_amd64.deb -C build
}

package() {
  tar -xf build/data.tar.zst -C ${pkgdir}
  
  install -dm755 ${pkgdir}/opt
  mv ${pkgdir}/usr/lib/${pkgname} ${pkgdir}/opt
  rm -rf ${pkgdir}/usr/lib
  rm -rf ${pkgdir}/usr/share/lintian

  # soft link
  ln -fs /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

  # license
  for _license in ${srcdir}/licenses/*
  do
    install -Dm644 "${_license}" -t ${pkgdir}/usr/share/licenses/${pkgname}/
  done 
}

#
# makepkg --printsrcinfo > .SRCINFO
#

# vim: set sw=2 ts=2 et:
