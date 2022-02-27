# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=lsi-lsa
pkgver=007.019.006.000
pkgrel=4
pkgdesc="LSI Storage Authority Software Suite"
arch=('x86_64')
url='https://www.broadcom.com/products/storage'
license=('custom:LSI')
depends=('openslp'
         'lsi-openpegasus'
         'curl'
         'perl'
         'libcrypt.so=1'
         )
makedepends=('patchelf')
DLAGENTS=('https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 -b "agreement=true" -o %o %u')
source=('LSI_Storage_Authority_Lightweight_Monitor_User_Guide_rev1.0.pdf::https://docs.broadcom.com/doc/pub-005092'
        'LSI_Storage_Authority_Software_User_Guide_rev2.2.pdf::https://docs.broadcom.com/doc/DB15-001161'
        'lsi_lsa.service'
        'lsa_launcher.sh'
        "${pkgver}_LSA_Linux.zip::https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/${pkgver}_LSA_Linux-x64.zip"
        'https://archive.archlinux.org/repos/2021/11/18/core/os/x86_64/libldap-2.4.59-2-x86_64.pkg.tar.zst'
        )
sha256sums=('5196f542b52457abb94bce4e069005543a7e748270b7b673e5afa669e7af2e03'
            'edb87a322a06afb7c78058132f648123325fc633db2df4d062a127f5ed9f465a'
            '5d65b855b7d38192ef8fd0ce34cab567efd5f9af922c080876a10e96a62b0b17'
            '1df03403bc1d780797f0eba59d85b1941a1c77f911d9e7d5d5ae4f288e52663a'
            'd0cfca9e144b12b8c5886f7d975546fe7e1ca13573f62d80f721363397e3b5dd'
            '8589d6d7ba2c2890961ac5a28b664bc4a066cc00b19f22ee0af792f0d9ed182c'
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
  for _lib in $(find "${pkgdir}" -name '*.so*' -type f); do
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
         opt/lsi/LSIStorageAuthority/bin/*peg*.so* \
         opt/lsi/LSIStorageAuthority/bin/libcurl*

  # LSA needs ldap 2.4x
  install -Dm755 "${srcdir}/usr/lib/libldap-2.4.so.2.11.7" opt/lsi/LSIStorageAuthority/bin/libldap-2.4.so.2
  install -Dm755 "${srcdir}/usr/lib/libldap_r-2.4.so.2.11.7" opt/lsi/LSIStorageAuthority/bin/libldap_r-2.4.so.2
  install -Dm755 "${srcdir}/usr/lib/liblber-2.4.so.2.11.7" opt/lsi/LSIStorageAuthority/bin/liblber-2.4.so.2

  # Set RPATH
  patchelf --set-rpath /opt/lsi/LSIStorageAuthority/bin opt/lsi/LSIStorageAuthority/bin/libpluginmanager.so
  patchelf --set-rpath /opt/lsi/LSIStorageAuthority/bin opt/lsi/LSIStorageAuthority/bin/libhttpcgi.so
  patchelf --set-rpath /opt/lsi/LSIStorageAuthority/bin opt/lsi/LSIStorageAuthority/bin/libutility.so
  patchelf --set-rpath /opt/lsi/LSIStorageAuthority/bin opt/lsi/LSIStorageAuthority/bin/libldap-2.4.so.2
  patchelf --set-rpath /opt/lsi/LSIStorageAuthority/bin opt/lsi/LSIStorageAuthority/bin/slp_deregister
  patchelf --set-rpath /opt/lsi/LSIStorageAuthority/bin opt/lsi/LSIStorageAuthority/bin/LSA
  patchelf --set-rpath /opt/lsi/LSIStorageAuthority/bin opt/lsi/LSIStorageAuthority/plugins/libcacheinit.so
  patchelf --set-rpath /opt/lsi/LSIStorageAuthority/bin opt/lsi/LSIStorageAuthority/plugins/libgateway.so
  patchelf --set-rpath /opt/lsi/LSIStorageAuthority/bin opt/lsi/LSIStorageAuthority/plugins/librepository.so
  patchelf --set-rpath /opt/lsi/LSIStorageAuthority/bin opt/lsi/LSIStorageAuthority/plugins/libserverdiscovery.so
  patchelf --set-rpath "/opt/lsi/LSIStorageAuthority/bin:/opt/lsi/LSIStorageAuthority/plugins" opt/lsi/LSIStorageAuthority/plugins/libmonitor.so

  # Install Service
  install -Dm644 "${srcdir}/lsi_lsa.service" usr/lib/systemd/system/lsi_lsa.service

  # LSA launcher
  install -Dm755 "${srcdir}/lsa_launcher.sh" opt/lsi/LSIStorageAuthority/bin/lsa_launcher.sh

  # Install Docs
  install -Dm644 "${srcdir}/LSI_Storage_Authority_Lightweight_Monitor_User_Guide_rev1.0.pdf" "usr/share/doc/${pkgname}/LSI_Storage_Authority_Lightweight_Monitor_User_Guide.pdf"
  install -Dm644 "${srcdir}/LSI_Storage_Authority_Software_User_Guide_rev2.2.pdf" "usr/share/doc/${pkgname}/LSI_Storage_Authority_Software_User_Guide.pdf"
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
