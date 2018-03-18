# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=lsi-lsa
pkgver=004.057.000.000
pkgrel=1
pkgdesc="LSI Storage Authority Software Suite"
arch=('i686' 'x86_64')
url='https://www.broadcom.com/products/storage'
license=('custom:LSI')
depends=('openslp'
         'lsi-openpegasus'
         'curl'
         )
makedepends=('chrpath')
source=('LSI_Storage_Authority_Lightweight_Monitor_User_Guide.pdf::https://docs.broadcom.com/docs-and-downloads/raid-controllers/pub-005092_2015-11-25_LSI_Storage_Authority_Lightweight_Monitor_User_Guide.pdf'
        'LSI_Storage_Authority_Software_User_Guide.pdf::https://docs.broadcom.com/docs-and-downloads/raid-controllers-common-files/DB15-001161-10_LSI%20Storage%20Authority%20Software%20User%20Guide.pdf'
        'lsi_lsa.service'
        'lsa_launcher.sh'
        'https://trac.nginx.org/nginx/export/HEAD/nginx/docs/html/50x.html'
        )
source_i686=("${pkgver}_LSA_Linux-x86.zip::https://docs.broadcom.com/docs-and-downloads/docs-and-downloads/raid-controllers/raid-controllers-common-files/${pkgver}_LSA_Linux-x86.zip")
source_x86_64=("${pkgver}_LSA_Linux-x64.zip::https://docs.broadcom.com/docs-and-downloads//docs-and-downloads/raid-controllers/raid-controllers-common-files/${pkgver}_LSA_Linux-x64.zip")
sha256sums=('5196f542b52457abb94bce4e069005543a7e748270b7b673e5afa669e7af2e03'
            'aea22917f5f3680fb19b9b219ac4775434f500946f579a58242a07bc1e66f209'
            '5d65b855b7d38192ef8fd0ce34cab567efd5f9af922c080876a10e96a62b0b17'
            '05bdeae736b4b06546ea669a5b2764f2410ec8f20873505fee9a8205eccf4190'
            '3c264d74770fd706d59c68d90ca1eb893ac379a666ff136f9acc66ca01daec02'
            )
sha256sums_i686=('17844fc1dcf52bfbeb749bcf827242649d2507cd7cf9b6a76d3172b4807c00c9')
sha256sums_x86_64=('3d88c0adc1e7d6fbdf2f3e8365885eb87af811c7eee3c44dd974b8b0e8a15f8c')
install=lsi-lsa.install
backup=('opt/lsi/LSIStorageAuthority/installtype'
        'opt/lsi/LSIStorageAuthority/conf/LSA.conf'
        'opt/lsi/LSIStorageAuthority/server/conf/nginx.conf'
        'opt/lsi/LSIStorageAuthority/conf/monitor/config-current.json'
        )
options=('!strip')

_create_links() {
  # create soname links
  for _lib in $(find "${pkgdir}" -name '*.so*'); do
    _soname=$(dirname "${_lib}")/$(readelf -d "${_lib}" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
    _base=$(echo ${_soname} | sed -r 's/(.*).so.*/\1.so/')
    [[ -e "${_soname}" ]] || ln -s $(basename "${_lib}") "${_soname}"
    [[ -e "${_base}" ]] || ln -s $(basename "${_soname}") "${_base}"
  done
}

package() {
  cd "${pkgdir}"

  # Extract LSA RPM
  for i in $(find "${srcdir}" -type f -name "LSIStorageAuthority-${pkgver}*.rpm"); do bsdtar -xf "${i}"; done &> /dev/null

  # Remove unnused stuff (include bundled openpegasus libs)
  rm -fr etc \
         opt/lsi/LSIStorageAuthority/uninstaller.sh \
         opt/lsi/LSIStorageAuthority/logs/* \
         opt/lsi/LSIStorageAuthority/server/start.log \
         opt/lsi/LSIStorageAuthority/server/logs/* \
         opt/lsi/LSIStorageAuthority/bin/*peg*.so*

  # Remove insecure RPATH
  chrpath -d opt/lsi/LSIStorageAuthority/bin/slp_deregister

  # Install Service
  install -Dm644 "${srcdir}/lsi_lsa.service" usr/lib/systemd/system/lsi_lsa.service

  # Missing html file
  install -Dm644 "${srcdir}/50x.html" opt/lsi/LSIStorageAuthority/server/html/50x.html

  # LSA launcher
  install -Dm755 ${srcdir}/lsa_launcher.sh opt/lsi/LSIStorageAuthority/bin/lsa_launcher.sh

  # Install Docs
  install -Dm644 "${srcdir}/LSI_Storage_Authority_Lightweight_Monitor_User_Guide.pdf" "usr/share/doc/${pkgname}/LSI_Storage_Authority_Lightweight_Monitor_User_Guide.pdf"
  install -Dm644 "${srcdir}/LSI_Storage_Authority_Software_User_Guide.pdf" "usr/share/doc/${pkgname}/LSI_Storage_Authority_Software_User_Guide.pdf"
  install -Dm644 "${srcdir}/"*/LSA_Linux_*_readme.txt "usr/share/doc/${pkgname}/LSA_Linux_readme.txt"

  # Configure the port server/client: 2463 for bundled nginx server & 9009 for LSA client
  # NOTE: Some programs, like youtube-mpv-git [AUR], uses the port 9000 (used by default in LSA client).
  #       this interfiere with this software, for this, i've change the port 9000 to 9009.
  sed -e 's|nginx_default|2463|g' \
      -e 's|LSA_Default|9009|g' \
      -i opt/lsi/LSIStorageAuthority/server/conf/nginx.conf
  sed 's|9000|9009|g' \
      -i opt/lsi/LSIStorageAuthority/conf/LSA.conf \
      -i usr/share/doc/lsi-lsa/LSA_Linux_readme.txt

  # Setup type
  echo gateway > opt/lsi/LSIStorageAuthority/installtype

  # Create soname links
  _create_links
}
