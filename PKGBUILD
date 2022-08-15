# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=lsi-msm
pkgname=('lsi-msm'
         'lsi-msm-snmp'
         )
_pkgver=17.05.06-00
pkgver="${_pkgver//-/.}"
pkgrel=1
pkgdesc="LSI Logic MegaRAID Storage Manager and SNMP providers"
arch=('x86_64')
url='https://www.broadcom.com/products/storage'
license=('custom:Broadcom')
makedepends=('setconf')
source=("${pkgver}_MSM_Linux-x64.zip::https://docs.broadcom.com/docs-and-downloads/${pkgver}_MSM_Linux-x64.zip"
        'MegaRAID_SAS_Software_User_Guide-rev2.8.pdf::https://docs.broadcom.com/wcs-public/user-guide/products/design--reference-guides/user-guide/574/208/pub-005110_db15-001199-08_2017-06-09_mr-6.14-sw-ug.pdf'
        'https://github.com/javaee/activation/releases/download/JAF-1_2_0/javax.activation.jar'
        'msm_profile.sh'
        'LSI_StorSNMP.ini'
        'lsi_msm.service'
        'lsi_mrdsnmpd.service'
        'ld.so.lsi-msm.conf'
        'ld.so.lsi-msm-snmp.conf'
        'tweak_scripts.diff'
        )
sha256sums=('ae03719c3d23d779c20f24275bc24badfa8c1dfbdcc1b2d627e6847318cd6ef6'
            '5e56870338353877803225250607539d07da32c0b455461cfb9fbddc66e93519'
            '993302b16cd7056f21e779cc577d175a810bb4900ef73cd8fbf2b50f928ba9ce'
            'ce37664bb64fa8f9d006409afc055f5bc3ffa990414b71e92ac009b500adb598'
            '605adcb662fb457609e81fb8916da7e88541e81dd0c112a8bb569d84df189bff'
            '207a40086b9d575cb49d4bdc906899c4f1fbcd861a3db6fb486a0d729053146a'
            'cf4d28307f8629e9c94bed28bd1fffb09a894ad2b348973f39f2dfc74b23ee68'
            '9b1065325731a1711d6dce3ecbf2cccc6fbe524b60e0eb5c0f1fdba315222c95'
            '8cb82f51d634e5a819763a32168104d8d37de553de049dfbebb0c2aa83106f07'
            'f4cdfa196d18221000cb461d02382e7595e896a6361a355ee534631e3734e2ed'
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
  bsdtar -xf "MSM_linux_x64_installer-${_pkgver}.tar.gz"
}

package_lsi-msm() {
  pkgdesc="LSI Logic MegaRAID Storage Manager"
  depends=('lsi-openpegasus'
           'unixodbc'
           'xdg-utils'
           'java-runtime=8'
           'sh'
         )
  backup=('usr/share/MegaRAID_Storage_Manager/debugschema.xsd'
          'usr/share/MegaRAID_Storage_Manager/debugcfg.xml'
          'usr/share/MegaRAID_Storage_Manager/msm.properties'
          'usr/share/MegaRAID_Storage_Manager/StrongSSLEncryption.ini'
          'usr/share/MegaRAID_Storage_Manager/vivaldikey.properties'
          'usr/share/MegaRAID_Storage_Manager/Framework/eventnotificationchoice.properties'
          'usr/share/MegaRAID_Storage_Manager/Framework/framework.properties'
          'usr/share/MegaRAID_Storage_Manager/Framework/vivaldikey.properties'
          'usr/share/MegaRAID_Storage_Manager/MegaPopup/vivaldikey.properties'
          'usr/share/MegaRAID_Storage_Manager/MegaMonitor/config-current.xml'
          'usr/share/MegaRAID_Storage_Manager/MegaMonitor/config-default.xml'
          )
  install=lsi-msm.install

  cd "${pkgdir}"

  # Extract RPM's
  for i in $(find "${srcdir}/disk" -type f -name 'MegaRAID*.rpm'); do bsdtar -xf "${i}"; done &> /dev/null

  # Move to correct place
  mv usr/local usr/share
  mv "usr/share/MegaRAID Storage Manager" usr/share/MegaRAID_Storage_Manager

  # Remove unused/leftover files
  rm -fr etc/init.d \
         usr/share/MegaRAID_Storage_Manager/setdisp.png.old \
         usr/share/MegaRAID_Storage_Manager/add_entry \
         usr/share/MegaRAID_Storage_Manager/{uninstaller,pwd,.__uninst}.sh \
         usr/share/MegaRAID_Storage_Manager/vmware{35,40} \
         usr/share/MegaRAID_Storage_Manager/jre \
         usr/share/MegaRAID_Storage_Manager/Framework/aaskfdjvuosd.dhdkhsc \
         usr/share/MegaRAID_Storage_Manager/Framework/storelibdebug.txt \
         usr/share/MegaRAID_Storage_Manager/Framework/storelibjnidebug.txt \
         usr/share/MegaRAID_Storage_Manager/Framework/popinit.logfrmboot \
         usr/share/MegaRAID_Storage_Manager/MegaPopup/popuplog.log \
         usr/share/MegaRAID_Storage_Manager/MegaPopup/Popup.pid \
         usr/share/MegaRAID_Storage_Manager/MegaPopup/testlog

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
  patch -p1 -i "${srcdir}/tweak_scripts.diff"

  # Create java bits
  mkdir -p  usr/share/MegaRAID_Storage_Manager/jre/.{userPrefs,systemPrefs}

  # Install javax.activation.jar
  install -Dm644 "${srcdir}/javax.activation.jar" usr/share/MegaRAID_Storage_Manager/Framework/javax.activation.jar

  # Setup shortcuts
  install -Dm644 usr/share/MegaRAID_Storage_Manager/setdisp.png usr/share/pixmaps/setdisp.png
  install -Dm644 usr/share/MegaRAID_Storage_Manager/MSMHelp.desktop.SuSE usr/share/applications/MSMHelp.desktop
  install -Dm644 usr/share/MegaRAID_Storage_Manager/MSMStartupUI.desktop.SuSE usr/share/applications/MSMStartupUI.desktop
  setconf usr/share/applications/MSM{Help,StartupUI}.desktop Categories System
  setconf usr/share/applications/MSMHelp.desktop X-KDE-SubstituteUID false
  setconf usr/share/applications/MSMHelp.desktop Exec "/usr/share/MegaRAID_Storage_Manager/starthelp.sh"
  setconf usr/share/applications/MSMStartupUI.desktop Exec "/usr/share/MegaRAID_Storage_Manager/startupui.sh"
  rm -fr usr/share/MegaRAID_Storage_Manager/*desktop.{SuSE,redhat}
  rm -fr usr/share/MegaRAID_Storage_Manager/setdisp.png

  # Install services and other files
  install -Dm644 "${srcdir}/lsi_msm.service" usr/lib/systemd/system/lsi_msm.service
  install -Dm644 "${srcdir}/msm_profile.sh" etc/profile.d/msm.sh

  # Add /opt/lsi/msm/lib to ldconf search path
  install -Dm644 "${srcdir}/ld.so.lsi-msm.conf" etc/ld.so.conf.d/lsi-msm.conf

  # Install License
  install -d "usr/share/licenses/${pkgname}/"
  cat "${srcdir}/disk/install.csh" | sed -n '18,68p' | sed -e 's|echo "||g' -e 's|^"||g' -e 's| "$||g' -e 's|"$||g' > "usr/share/licenses/${pkgname}/LICENSE"

  # Install the manual
  install -Dm644 "${srcdir}/MegaRAID_SAS_Software_User_Guide-rev2.8.pdf" usr/share/doc/lsi-msm/MegaRAID_SAS_Software_User_Guide-rev2.8.pdf

  # Create soname links
  _create_links
}

package_lsi-msm-snmp() {
pkgdesc="LSI Logic MegaRAID Storage Manager Suite SNMP providers"
depends=('net-snmp'
         'perl-net-snmp'
         'perl-term-readkey'
         'sh'
         )
backup=('etc/lsi_mrdsnmp/LSI_StorSNMP.ini'
        'etc/lsi_mrdsnmp/sas/sas_TrapDestination.conf'
        'etc/lsi_mrdsnmp/sas-ir/sas_ir_TrapDestination.conf'
        )
install=lsi-msm-snmp.install

  cd "${pkgdir}"

  # Extract RPM's
  for i in $(find "${srcdir}/disk" -type f -name 'sas_*.rpm'); do bsdtar -xf "${i}"; done &> /dev/null

  # Move to correct place
  mv usr/lib64 usr/lib

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

  # Add /opt/lsi/snmp/lib to ldconf search path
  install -Dm644 "${srcdir}/ld.so.lsi-msm-snmp.conf" etc/ld.so.conf.d/lsi-msm-snmp.conf

  # Install license
  install -d "usr/share/licenses/${pkgname}"
  cat "${srcdir}/disk/install.csh" | sed -n '18,68p' | sed -e 's|echo "||g' -e 's|^"||g' -e 's| "$||g' -e 's|"$||g' > "usr/share/licenses/${pkgname}/LICENSE"

  # Create soname links
  _create_links
}
