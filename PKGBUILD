# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=lsi-msm
pkgname=(
  'lsi-msm'
  'lsi-msm-snmp'
  'lsi-msm-libs'
)
_pkgver=17.05.06-00
pkgver="${_pkgver//-/.}"
pkgrel=2
pkgdesc="LSI Logic MegaRAID Storage Manager and SNMP providers"
arch=('x86_64')
url='https://www.broadcom.com/products/storage'
license=('custom:Broadcom')
makedepends=('setconf')
DLAGENTS=('https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 -b "agreement=true" -o %o %u')
source=(
  "${pkgver}_MSM_Linux-x64.zip::https://docs.broadcom.com/docs-and-downloads/${pkgver}_MSM_Linux-x64.zip"
  '12Gbs_MegaRAID_SAS_Software_User_Guide-rev2.8.pdf::https://docs.broadcom.com/wcs-public/user-guide/products/design--reference-guides/user-guide/574/208/pub-005110_db15-001199-08_2017-06-09_mr-6.14-sw-ug.pdf'
  '6Gbs_MegaRAID_SAS_Software_User_Guide-revP.zip::https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/51530-00_RevP_MegaRAID_SAS_SW_UserGd.zip'
  'https://github.com/javaee/activation/releases/download/JAF-1_2_0/javax.activation.jar'
  'msm_profile.sh'
  'LSI_StorSNMP.ini'
  'lsi_msm.service'
  'lsi_mrdsnmpd.service'
  'ld.so.lsi-msm-libs.conf'
  'tweak_scripts.diff'
)
sha256sums=(
  'ae03719c3d23d779c20f24275bc24badfa8c1dfbdcc1b2d627e6847318cd6ef6'
  '5e56870338353877803225250607539d07da32c0b455461cfb9fbddc66e93519'
  'bb25efb9894cc16961d0a982d1ccc51f4bfa173d3049af2a4277aa38dbb95110'
  '993302b16cd7056f21e779cc577d175a810bb4900ef73cd8fbf2b50f928ba9ce'
  '4433a16c65dc73c07cd4e0be1466bffbe971522ab0d17d566ac3b6212519b1b5'
  '605adcb662fb457609e81fb8916da7e88541e81dd0c112a8bb569d84df189bff'
  'a21fa082d8f43071c24ca43761049c7f3bcc231706a58db4d2eec7b6fbf218ef'
  'cf4d28307f8629e9c94bed28bd1fffb09a894ad2b348973f39f2dfc74b23ee68'
  '9b1065325731a1711d6dce3ecbf2cccc6fbe524b60e0eb5c0f1fdba315222c95'
  '84597c89f83a044a6be2f16b897fc7d27cf04516053f850504f132e44ff52c0a'
)
noextract=('javax.activation.jar')
options=('!strip')

_create_links() {
  # create soname links
  find "${pkgdir}" -type f -name '*.so*' -print0 | while read -d $'\0' _lib; do
    _soname=$(dirname "${_lib}")/$(readelf -d "${_lib}" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
    _base=$(echo ${_soname} | sed -r 's/(.*)\.so.*/\1.so/')
    [[ -e "${_soname}" ]] || ln -s $(basename "${_lib}") "${_soname}"
    [[ -e "${_base}" ]] || ln -s $(basename "${_soname}") "${_base}"
  done
}

prepare() {
  bsdtar -xf "${pkgver}_MSM_Linux-x64.zip"
  bsdtar -xf "MSM_linux_x64_installer-${_pkgver}.tar.gz"
}

package_lsi-msm() {
  pkgdesc="LSI Logic MegaRAID Storage Manager"
  depends=(
    'gcc-libs' # 'libgcc_s.so' 'libstdc++.so'
    'glibc' # 'libc.so' 'libdl.so' 'libm.so' 'libpthread.so' 'librt.so'
    'libxcrypt-compat' 'libcrypt.so'
    'lsi-msm-libs' 'libstorelib.so' 'libstorelibir-2.so' 'libstorelibir-3.so' 'libstorelibir.so'
    'lsi-openpegasus' 'libpegclient.so' 'libpegcommon.so' 'libpegconfig.so' 'libpeglistener.so' 'libpegslp_client.so'
    'unixodbc'
    'xdg-utils'
    'java-runtime=8'
    'bash'
  )
  backup=(
    'opt/lsi/LSIMegaRAIDStorageManager/debugschema.xsd'
    'opt/lsi/LSIMegaRAIDStorageManager/debugcfg.xml'
    'opt/lsi/LSIMegaRAIDStorageManager/msm.properties'
    'opt/lsi/LSIMegaRAIDStorageManager/StrongSSLEncryption.ini'
    'opt/lsi/LSIMegaRAIDStorageManager/vivaldikey.properties'
    'opt/lsi/LSIMegaRAIDStorageManager/Framework/eventnotificationchoice.properties'
    'opt/lsi/LSIMegaRAIDStorageManager/Framework/framework.properties'
    'opt/lsi/LSIMegaRAIDStorageManager/Framework/vivaldikey.properties'
    'opt/lsi/LSIMegaRAIDStorageManager/MegaPopup/vivaldikey.properties'
    'opt/lsi/LSIMegaRAIDStorageManager/MegaMonitor/config-current.xml'
    'opt/lsi/LSIMegaRAIDStorageManager/MegaMonitor/config-default.xml'

    'usr/share/LSIMegaRAIDStorageManager/debugschema.xsd'
    'usr/share/LSIMegaRAIDStorageManager/debugcfg.xml'
    'usr/share/LSIMegaRAIDStorageManager/msm.properties'
    'usr/share/LSIMegaRAIDStorageManager/StrongSSLEncryption.ini'
    'usr/share/LSIMegaRAIDStorageManager/vivaldikey.properties'
    'usr/share/LSIMegaRAIDStorageManager/Framework/eventnotificationchoice.properties'
    'usr/share/LSIMegaRAIDStorageManager/Framework/framework.properties'
    'usr/share/LSIMegaRAIDStorageManager/Framework/vivaldikey.properties'
    'usr/share/LSIMegaRAIDStorageManager/MegaPopup/vivaldikey.properties'
    'usr/share/LSIMegaRAIDStorageManager/MegaMonitor/config-current.xml'
    'usr/share/LSIMegaRAIDStorageManager/MegaMonitor/config-default.xml'
  )
  install=lsi-msm.install

  cd "${pkgdir}"

  # Extract RPM's
  for i in $(find "${srcdir}/disk" -type f -name 'MegaRAID*.rpm'); do bsdtar -xf "${i}"; done &> /dev/null

  # Move to correct place
  mv "usr/local/MegaRAID Storage Manager" opt/lsi
  mv "opt/lsi/MegaRAID Storage Manager" opt/lsi/LSIMegaRAIDStorageManager

  # Split to lsi-msm-libs package
  mkdir -p "${srcdir}/msm-libs"
  mv opt/lsi/msm/lib/ "${srcdir}/msm-libs"

  # Remove unused/leftover files
  rm -fr etc/init.d \
         opt/lsi/msm \
         usr/local \
         opt/lsi/LSIMegaRAIDStorageManager/setdisp.png.old \
         opt/lsi/LSIMegaRAIDStorageManager/add_entry \
         opt/lsi/LSIMegaRAIDStorageManager/{uninstaller,pwd,.__uninst}.sh \
         opt/lsi/LSIMegaRAIDStorageManager/vmware{35,40} \
         opt/lsi/LSIMegaRAIDStorageManager/jre \
         opt/lsi/LSIMegaRAIDStorageManager/Framework/storelibdebug.txt \
         opt/lsi/LSIMegaRAIDStorageManager/Framework/storelibjnidebug.txt \
         opt/lsi/LSIMegaRAIDStorageManager/MegaPopup/popuplog.log \
         opt/lsi/LSIMegaRAIDStorageManager/MegaPopup/Popup.pid \
         opt/lsi/LSIMegaRAIDStorageManager/MegaPopup/testlog

  # Fix permisions
  find . -type d -print0 2>/dev/null | xargs -0r chmod 755
  find . -type f -print0 2>/dev/null | xargs -0r chmod 644
  for i in $(find . -type f -name '*.sh' -o -name 'popup' -o -name 'storcli*' -o -name '*.so*'); do chmod 755 ${i}; done

  # Tweak scripts with tons of things:
  # - Use system java 8
  # - Use xdg-open instead of real browsers
  # - Identation
  # - Add missing #!
  # - Run all with C locale (always en_EN)
  # - etc.
  patch --binary -p1 -i "${srcdir}/tweak_scripts.diff"

  # Create java bits
  mkdir -p  opt/lsi/LSIMegaRAIDStorageManager/jre/.{userPrefs,systemPrefs}

  # Install javax.activation.jar
  install -Dm644 "${srcdir}/javax.activation.jar" opt/lsi/LSIMegaRAIDStorageManager/Framework/javax.activation.jar

  # Setup shortcuts
  install -Dm644 opt/lsi/LSIMegaRAIDStorageManager/setdisp.png usr/share/pixmaps/setdisp.png
  install -Dm644 opt/lsi/LSIMegaRAIDStorageManager/MSMHelp.desktop.SuSE usr/share/applications/MSMHelp.desktop
  install -Dm644 opt/lsi/LSIMegaRAIDStorageManager/MSMStartupUI.desktop.SuSE usr/share/applications/MSMStartupUI.desktop
  setconf usr/share/applications/MSM{Help,StartupUI}.desktop Categories System
  setconf usr/share/applications/MSMHelp.desktop X-KDE-SubstituteUID false
  setconf usr/share/applications/MSMHelp.desktop Exec "/opt/lsi/LSIMegaRAIDStorageManager/starthelp.sh"
  setconf usr/share/applications/MSMStartupUI.desktop Exec "/opt/lsi/LSIMegaRAIDStorageManager/startupui.sh"
  rm -fr opt/lsi/LSIMegaRAIDStorageManager/*desktop.{SuSE,redhat}
  rm -fr opt/lsi/LSIMegaRAIDStorageManager/setdisp.png

  # Install services and other files
  install -Dm644 "${srcdir}/lsi_msm.service" usr/lib/systemd/system/lsi_msm.service
  install -Dm644 "${srcdir}/msm_profile.sh" etc/profile.d/msm.sh

  # Install License
  install -d "usr/share/licenses/${pkgname}/"
  cat "${srcdir}/disk/install.csh" | sed -n '18,68p' | sed -e 's|echo "||g' -e 's|^"||g' -e 's| "$||g' -e 's|"$||g' > "usr/share/licenses/${pkgname}/LICENSE"

  # Install the manual
  install -Dm644 "${srcdir}/51530-00_RevP_MegaRAID_SAS_SW_UserGd.pdf" "usr/share/doc/lsi-msm/6Gbs_MegaRAID_SAS_Software_User_Guide-revP.pdf"
  install -Dm644 "${srcdir}/12Gbs_MegaRAID_SAS_Software_User_Guide-rev2.8.pdf" "usr/share/doc/${pkgname}/12Gbs_MegaRAID_SAS_Software_User_Guide-rev2.8.pdf"

  # Create soname links
  _create_links
}

package_lsi-msm-snmp() {
  pkgdesc="LSI Logic MegaRAID Storage Manager Suite SNMP providers"
  depends=(
    'gcc-libs' # 'libgcc_s.so' 'libstdc++.so'
    'glibc' # 'libc.so' 'libdl.so' 'libm.so' 'libpthread.so'
    'lsi-msm-libs' 'libstorelib.so' 'libstorelibir-2.so' 'libstorelibir-3.so' 'libstorelibir.so'
    'net-snmp'
    'perl-net-snmp'
    'perl-term-readkey'
    'bash'
  )
  backup=(
    'etc/lsi_mrdsnmp/LSI_StorSNMP.ini'
    'etc/lsi_mrdsnmp/sas/sas_TrapDestination.conf'
    'etc/lsi_mrdsnmp/sas-ir/sas_ir_TrapDestination.conf'
  )
  provides=('libsas_ir_objects.so' 'libsas_objects.so')
  install=lsi-msm-snmp.install

  cd "${pkgdir}"

  # Extract RPM's
  for i in $(find "${srcdir}/disk" -type f -name 'sas_*.rpm'); do bsdtar -xf "${i}"; done &> /dev/null

  # Move to correct place
  mv usr/lib64 usr/lib
  # split to lib-sms-libs package (remove as dumplicated in lsi-msm)
  rm -fr opt/lsi/snmp/lib

  # Remove unused files
  rm -fr etc/lsi_mrdsnmp/lsi_mrdsnmpd.{rh,suse} \
         etc/lsi_mrdsnmp/sas{,-ir}/{install,uninstall}

  # Fix permisions
  chmod +x etc/lsi_mrdsnmp/lsi_mrdsnmp{agent,main}

  # Make symlinks
  install -d usr/bin
  ln -sf /etc/lsi_mrdsnmp/lsi_mrdsnmpagent usr/bin/lsi_mrdsnmpagent
  ln -sf /etc/lsi_mrdsnmp/lsi_mrdsnmpmain usr/bin/lsi_mrdsnmpmain

  # Install services and other files
  install -Dm644 "${srcdir}/lsi_mrdsnmpd.service" usr/lib/systemd/system/lsi_mrdsnmpd.service
  install -Dm644 "${srcdir}/LSI_StorSNMP.ini" etc/lsi_mrdsnmp/LSI_StorSNMP.ini

  # Install the readme
  install -Dm644 "${srcdir}/disk/readme.txt" usr/share/doc/lsi-msm-snmp/readme.txt

  # Install license
  install -d "usr/share/licenses/${pkgname}"
  cat "${srcdir}/disk/install.csh" | sed -n '18,68p' | sed -e 's|echo "||g' -e 's|^"||g' -e 's| "$||g' -e 's|"$||g' > "usr/share/licenses/${pkgname}/LICENSE"

}

package_lsi-msm-libs() {
  pkgdesc="LSI Logic MegaRAID Storage Manager Suite common libs"
  depends=(
    'gcc-libs' # 'libgcc_s.so' 'libstdc++.so'
    'glibc' # 'libc.so' 'libdl.so' 'libm.so' 'libpthread.so'
    'zlib' 'libz.so'
  )
  provides=('libstorelib.so' 'libstorelibir-2.so' 'libstorelibir-3.so' 'libstorelibir.so')

  cd "${pkgdir}"

  # Add opt/lsi/LSIMegaRAIDStorageManager/lib to ldconf search path
  install -Dm644 "${srcdir}/ld.so.lsi-msm-libs.conf" etc/ld.so.conf.d/lsi-msm-libs.conf

  mkdir -p opt/lsi/msm/lib

  mv "${srcdir}/msm-libs/lib/" opt/lsi/msm/

  # Install License
  install -d "usr/share/licenses/${pkgname}/"
  cat "${srcdir}/disk/install.csh" | sed -n '18,68p' | sed -e 's|echo "||g' -e 's|^"||g' -e 's| "$||g' -e 's|"$||g' > "usr/share/licenses/${pkgname}/LICENSE"

  # Create soname links
  _create_links
}
