# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=lsi-lsa
pkgver=008.012.007.000
_mr=8.12 # 7.32 for 85xx series, 8.12 for 86xx series
pkgrel=1
pkgdesc="LSI Storage Authority Software Suite"
arch=('x86_64')
url='https://www.broadcom.com/products/storage'
license=('custom:Broadcom')
depends=(
  'gcc-libs' # 'libgcc_s.so' 'libstdc++.so'
  'glibc' # 'libc.so' 'libdl.so' 'libm.so' 'libpthread.so'
  'openslp' # 'libslp.so'
  'perl'
  'bash'
  'libldap24' # 'libldap-2.4.so'
  'libxcrypt' 'libcrypt.so'
  'openssl-1.1' 'libssl.so=1.1' 'libcrypto.so=1.1'
  'lsi-openpegasus' 'libpegclient.so' 'libpegcommon.so' 'libpeglistener.so'
  'curl' 'libcurl.so'
)
makedepends=('patchelf')
DLAGENTS=('https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 -b "agreement=true" -o %o %u')
source=(
  'LSI_Storage_Authority_Lightweight_Monitor_User_Guide_rev1.0.pdf::https://docs.broadcom.com/doc/pub-005092'
  'LSI_Storage_Authority_Software_User_Guide_rev2.15.pdf::https://techdocs.broadcom.com/content/dam/broadcom/techdocs/data-center-solutions/tools/generated-pdfs/DB15-001161-33.pdf'
  "${pkgver}_MR7.32_LSA_Linux.zip::https://docs.broadcom.com/docs-and-downloads/${pkgver}_MR7.32_LSA_Linux.zip"
  "${pkgver}_MR8.12_LSA_Linux.zip::https://docs.broadcom.com/docs-and-downloads/LSA_Linux_${pkgver}_MR8.12.zip"
  'lsi_lsa.service'
  'lsa_launcher.sh'
)
sha256sums=(
  '5196f542b52457abb94bce4e069005543a7e748270b7b673e5afa669e7af2e03'
  '42d6ba73101efcbea9e354d60b7bdc5f4e3c48639e285a9858e454541b3b7f2f'
  '58c139353c6ac1a3b75cd351a4a37d08acda7df3b3b31a03ade3cd5ac5db22a3'
  'ab1edfe9986870a3607160f9ef08a4df7ba462590620b2424b00453b4fadee07'
  '5d65b855b7d38192ef8fd0ce34cab567efd5f9af922c080876a10e96a62b0b17'
  '1df03403bc1d780797f0eba59d85b1941a1c77f911d9e7d5d5ae4f288e52663a'
)
install=lsi-lsa.install
backup=(
  'opt/lsi/LSIStorageAuthority/installtype'
  'opt/lsi/LSIStorageAuthority/conf/LSA.conf'
  'opt/lsi/LSIStorageAuthority/server/conf/nginx.conf'
  'opt/lsi/LSIStorageAuthority/conf/monitor/config-current.json'
)
options=('!strip')
if [ "${_mr}" = "7.32" ]; then
  noextract=("${pkgver}_MR8.12_LSA_Linux.zip")
fi
if [ "${_mr}" = "8.12" ]; then
  noextract=("${pkgver}_MR7.32_LSA_Linux.zip")
fi

_create_links() {
  # create soname links
  find "${pkgdir}" -type f -name '*.so*' -print0 | while read -d $'\0' _lib; do
    _soname=$(dirname "${_lib}")/$(readelf -d "${_lib}" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
    _base=$(echo ${_soname} | sed -r 's/(.*)\.so.*/\1.so/')
    [[ -e "${_soname}" ]] || ln -s $(basename "${_lib}") "${_soname}"
    [[ -e "${_base}" ]] || ln -s $(basename "${_soname}") "${_base}"
  done
}

package() {
  cd "${pkgdir}"

  # Extract LSA RPM
  [ "${_mr}" = "7.32" ] && (cd ${srcdir}; mkdir LSA_Linux; cd LSA_Linux;  bsdtar -xf "${srcdir}/webgui_rel/LSA_Linux.zip")
  for i in $(find "${srcdir}/LSA_Linux/gcc_11.2.x" -type f -name "LSIStorageAuthority-${pkgver}*.rpm"); do bsdtar -xf "${i}"; done # &> /dev/null

  # Remove unused stuff (include bundled openpegasus libs)
  rm -fr etc \
         opt/lsi/LSIStorageAuthority/uninstaller.sh \
         opt/lsi/LSIStorageAuthority/logs/* \
         opt/lsi/LSIStorageAuthority/server/start.log \
         opt/lsi/LSIStorageAuthority/server/logs/* \
         opt/lsi/LSIStorageAuthority/bin/*peg*.so* \
         opt/lsi/LSIStorageAuthority/bin/libcurl* \
         usr/lib/.build-id

  # Set RPATH
  patchelf --set-rpath /opt/lsi/LSIStorageAuthority/bin opt/lsi/LSIStorageAuthority/bin/libpluginmanager.so
  patchelf --set-rpath /opt/lsi/LSIStorageAuthority/bin opt/lsi/LSIStorageAuthority/bin/libhttpcgi.so
  patchelf --set-rpath /opt/lsi/LSIStorageAuthority/bin opt/lsi/LSIStorageAuthority/bin/libutility.so
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
  install -Dm644 "${srcdir}/LSI_Storage_Authority_Software_User_Guide_rev2.15.pdf" "usr/share/doc/${pkgname}/LSI_Storage_Authority_Software_User_Guide.pdf"
  install -Dm644 "${srcdir}/LSA_Linux/LSA_Linux_64_readme.txt" "usr/share/doc/${pkgname}/LSA_Linux_readme.txt"

  # Configure the port server/client: 2463 for bundled nginx server & 9009 for LSA client
  # NOTE: Some programs, like youtube-mpv-git [AUR], uses the port 9000 (used by default in LSA client).
  #       this interfiere with this software, for this, i've change the port 9000 to 9009.
  sed -e 's|nginx_default|2463|g' \
      -e 's|LSA_Default|9009|g' \
      -i opt/lsi/LSIStorageAuthority/server/conf/nginx.conf \
      -i opt/lsi/LSIStorageAuthority/conf/LSA.conf
  sed 's|9000|9009|g' \
      -i opt/lsi/LSIStorageAuthority/conf/LSA.conf \
      -i usr/share/doc/lsi-lsa/LSA_Linux_readme.txt

  # Setup type
  echo gateway > opt/lsi/LSIStorageAuthority/installtype

  # Install licenses
  install -d "usr/share/licenses/${pkgname}/"
  cat "${srcdir}/LSA_Linux/gcc_11.2.x/install.sh" | sed -n '22,72p' | sed -e 's|echo "||g' -e 's|^"||g' -e 's| "$||g' -e 's|"$||g' > "usr/share/licenses/${pkgname}/LICENSE"

  # Create soname links
  _create_links

  # Fix the LSA.conf mess
  sed -e 's|c:\\program files\\lsi\\lsistorageauthority\\|..|g' \
      -e 's|C:\\Program Files\\LSI\\LSIStorageAuthority\\|..|g' \
      -e 's|Administrators|root|g' \
      -e 's|Authenticated U|u|g' \
      -i opt/lsi/LSIStorageAuthority/conf/LSA.conf
  chmod 755 opt/lsi/LSIStorageAuthority/conf/LSA.conf

  # Fix Help documentation UTF-8 path
  sed 's|%E2%80%93|-|g' -i opt/lsi/LSIStorageAuthority/server/html/help/integratedraid/content/*
  for _i in opt/lsi/LSIStorageAuthority/server/html/help/integratedraid/content/*.png; do
    [[ "${_i}" != "${_i/–/-}" ]] && mv ${_i} ${_i/–/-}; true
  done
}
