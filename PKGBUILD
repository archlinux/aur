# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=lsi-lsa
pkgver=007.015.004.000
pkgrel=1
pkgdesc="LSI Storage Authority Software Suite"
arch=('x86_64')
url='https://www.broadcom.com/products/storage'
license=('custom:LSI')
depends=('openslp'
         'lsi-openpegasus'
         'curl'
         )
makedepends=('chrpath')
DLAGENTS=('https::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -b "agreement=true" -o %o %u')
source=('LSI_Storage_Authority_Lightweight_Monitor_User_Guide_rev1.0.pdf::https://docs.broadcom.com/doc/pub-005092'
        'LSI_Storage_Authority_Software_User_Guide_rev1.15.pdf::https://docs.broadcom.com/doc/DB15-001161'
        'lsi_lsa.service'
        'lsa_launcher.sh'
        "${pkgver}_LSA_Linux.zip::https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/${pkgver}_LSA_Linux-x64.zip"
        )
sha256sums=('5196f542b52457abb94bce4e069005543a7e748270b7b673e5afa669e7af2e03'
            '7786c99f9489b272a5662d7d7a4442f1262b9ce2dc678c48d99c2c6e37a5fd2b'
            '5d65b855b7d38192ef8fd0ce34cab567efd5f9af922c080876a10e96a62b0b17'
            '977ff4069d4ae02b60a58e708ae5bb5c8fa10f9a331e527b518006e8e5eb03ea'
            '722b72eefb80fd40cbf57c06fe09073db3e8d01c686dd14f5367b2e6d42c54fc'
            )
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

  # LSA launcher
  install -Dm755 ${srcdir}/lsa_launcher.sh opt/lsi/LSIStorageAuthority/bin/lsa_launcher.sh

  # Install Docs
  install -Dm644 "${srcdir}/LSI_Storage_Authority_Lightweight_Monitor_User_Guide_rev1.0.pdf" "usr/share/doc/${pkgname}/LSI_Storage_Authority_Lightweight_Monitor_User_Guide.pdf"
  install -Dm644 "${srcdir}/LSI_Storage_Authority_Software_User_Guide_rev1.15.pdf" "usr/share/doc/${pkgname}/LSI_Storage_Authority_Software_User_Guide.pdf"
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
