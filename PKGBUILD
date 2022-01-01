# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=lsi-msm
pkgname=('lsi-msm'
         'lsi-msm-snmp'
         )
_pkgver=17.05.02-01
pkgver="${_pkgver//-/.}"
pkgrel=2
pkgdesc="LSI Logic MegaRAID Storage Manager and SNMP providers"
arch=('x86_64')
url='https://www.broadcom.com/products/storage'
license=('custom:LSI')
makedepends=('setconf')
source=('msm_profile.sh'
        'LSI_StorSNMP.ini'
        'lsi_msm.service'
        'lsi_mrdsnmpd.service'
        'ld.so.lsi-msm.conf'
        'ld.so.lsi-msm-snmp.conf'
        'https://docs.broadcom.com/docs-and-downloads/advanced-software/advanced-software-common-files/SLA_AdvancedSoftware.pdf'
        'MegaRAID_SAS_Software_User_Guide-rev2.8.pdf::https://docs.broadcom.com/wcs-public/user-guide/products/design--reference-guides/user-guide/574/208/pub-005110_db15-001199-08_2017-06-09_mr-6.14-sw-ug.pdf'
        "${pkgver}_Linux-x64_MSM.zip::https://docs.broadcom.com/docs-and-downloads/docs-and-downloads/raid-controllers/raid-controllers-common-files/${pkgver}_MSM_Linux-x64.zip"
        )
sha256sums=('aff9c7ed8e55eb3441911183db1b0912cf74f24ce3027b3aebe3560db69d3a1d'
            '605adcb662fb457609e81fb8916da7e88541e81dd0c112a8bb569d84df189bff'
            '207a40086b9d575cb49d4bdc906899c4f1fbcd861a3db6fb486a0d729053146a'
            'cf4d28307f8629e9c94bed28bd1fffb09a894ad2b348973f39f2dfc74b23ee68'
            '9b1065325731a1711d6dce3ecbf2cccc6fbe524b60e0eb5c0f1fdba315222c95'
            '9b1065325731a1711d6dce3ecbf2cccc6fbe524b60e0eb5c0f1fdba315222c95'
            '9be6a8818ea1dccec65d48b86dd0cc62009dc3886229e3dce41192a241bd55c3'
            '5e56870338353877803225250607539d07da32c0b455461cfb9fbddc66e93519'
            '8f9e7c1a9468cfb95159e27d4df0978faf7e0e1303bf0ae6999a897d33a21414'
            )
options=('!strip')

_create_links() {
  # create soname links
  for _lib in $(find "${pkgdir}" -type f -name '*.so*'); do
    _soname=$(dirname "${_lib}")/$(readelf -d "${_lib}" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
    _base=$(echo ${_soname} | sed -r 's/(.*).so.*/\1.so/')
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
           'java-environment=8'
           'lib32-libxi'
           'lib32-libxft'
           'lib32-libpng12'
           'lib32-libxinerama'
           'lib32-libjpeg6-turbo'
           'lib32-libxxf86vm'
           'lib32-gcc-libs'
           # 'lib32-xerces-c'
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

  # Setup shortcuts
  install -Dm644 usr/share/MegaRAID_Storage_Manager/setdisp.png usr/share/pixmaps/setdisp.png
  install -Dm644 usr/share/MegaRAID_Storage_Manager/MSMHelp.desktop.SuSE usr/share/applications/MSMHelp.desktop
  install -Dm644 usr/share/MegaRAID_Storage_Manager/MSMStartupUI.desktop.SuSE usr/share/applications/MSMStartupUI.desktop
  setconf usr/share/applications/MSM{Help,StartupUI}.desktop Categories System
  setconf usr/share/applications/MSMHelp.desktop X-KDE-SubstituteUID false
  setconf usr/share/applications/MSMHelp.desktop Exec "/usr/share/MegaRAID_Storage_Manager/starthelp.sh"
  setconf usr/share/applications/MSMStartupUI.desktop Exec "/usr/share/MegaRAID_Storage_Manager/startupui.sh"

  # Remove unused files
  rm -fr etc/init.d \
         usr/share/MegaRAID_Storage_Manager/setdisp.png.old \
         usr/share/MegaRAID_Storage_Manager/*desktop.{SuSE,redhat} \
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
  for i in $(find . -type f -name '*.sh' -o -name 'popup_bin' -o -name 'popup' -o -name "add_entry" -o -name 'storcli*' -o -name 'mrmonitor' -o -name '*.so*'); do chmod +x ${i}; done

  # Standarized /usr/share/MegaRAID_Storage_Manager/start{,monitor}help.sh whit xdg-open ## Someday, I'll create a patch instead sed
  sed -e '13,20d' \
      -e 's|mozilla|xdg-open|g' \
      -e 's|/firefox||g' \
      -i usr/share/MegaRAID_Storage_Manager/startmonitorhelp.sh
  sed -e '28,35d' \
      -e 's|mozilla|xdg-open|g' \
      -e 's|/firefox||g' \
      -i usr/share/MegaRAID_Storage_Manager/starthelp.sh

  # Fix Java (use system java)
  sed -e 's|../jre/bin|/usr/lib/jvm/java-8-openjdk/jre/bin|g' \
      -e 's|../jre/lib|/usr/lib/jvm/java-8-openjdk/jre/lib|g' \
      -i usr/share/MegaRAID_Storage_Manager/MegaPopup/popup \
      -i usr/share/MegaRAID_Storage_Manager/MegaPopup/shutdownpopup.sh \
      -i usr/share/MegaRAID_Storage_Manager/Framework/startup.sh \
      -i usr/share/MegaRAID_Storage_Manager/Framework/shutdown.sh
  sed -e 's|./jre/bin|/usr/lib/jvm/java-8-openjdk/jre/bin|g' \
      -i usr/share/MegaRAID_Storage_Manager/startupui.sh

  # Add missing #! in scripts
  sed '1i#!/bin/sh' \
      -i usr/share/MegaRAID_Storage_Manager/startupui.sh \
      -i usr/share/MegaRAID_Storage_Manager/startmonitorhelp.sh \
      -i usr/share/MegaRAID_Storage_Manager/Framework/startup.sh \
      -i usr/share/MegaRAID_Storage_Manager/Framework/shutdown.sh

  # Tweak scripts
  sed -e 's|init.d/msm_profile|profile.d/msm.sh|g' \
      -i usr/share/MegaRAID_Storage_Manager/start*.sh \
      -i usr/share/MegaRAID_Storage_Manager/MegaPopup/popup \
      -i usr/share/MegaRAID_Storage_Manager/MegaPopup/shutdownpopup.sh
  sed -e '/^$/d' \
      -e 's|path  |path \.:|g' \
      -e 's|1> /dev/null 2> /dev/null|\&> /dev/null|g' \
      -i usr/share/MegaRAID_Storage_Manager/MegaPopup/shutdownpopup.sh
  sed '/^LD_LIBRARY_PATH/d' \
      -i usr/share/MegaRAID_Storage_Manager/Framework/startup.sh
  sed -e '/^$/d' \
      -e '2,3d' \
      -i usr/share/MegaRAID_Storage_Manager/Framework/shutdown.sh
  sed -e '2i\. /etc/profile.d/msm.sh' \
      -i usr/share/MegaRAID_Storage_Manager/Framework/startup.sh \
      -i usr/share/MegaRAID_Storage_Manager/Framework/shutdown.sh
  sed -e 's|^  \+|  |;s|^ \+|  |g' \
      -e 's|\t|  |g' \
      -e 's|     |  |g' \
      -i usr/share/MegaRAID_Storage_Manager/start*.sh

  # Set java home
  mkdir -p  usr/share/MegaRAID_Storage_Manager/jre/.{userPrefs,systemPrefs}
  sed -e 's|-classpath|-Djava.util.prefs.systemRoot="${MSM_HOME}"/jre -Djava.util.prefs.userRoot="${MSM_HOME}"/jre/.userPrefs -classpath|g' \
      -i usr/share/MegaRAID_Storage_Manager/startupui.sh \
      -i usr/share/MegaRAID_Storage_Manager/MegaPopup/popup \
      -i usr/share/MegaRAID_Storage_Manager/MegaPopup/shutdownpopup.sh \
      -i usr/share/MegaRAID_Storage_Manager/Framework/startup.sh \
      -i usr/share/MegaRAID_Storage_Manager/Framework/shutdown.sh \

  # Install services and other files
  install -Dm644 "${srcdir}/lsi_msm.service" usr/lib/systemd/system/lsi_msm.service
  install -Dm644 "${srcdir}/msm_profile.sh" etc/profile.d/msm.sh

  # Add /opt/lsi/msm/lib to ldconf search path
  install -Dm644 "${srcdir}/ld.so.lsi-msm.conf" etc/ld.so.conf.d/lsi-msm.conf

  # Remove Megapopup system launcher. because eats tons of RAM and have missing dependencies
  rm -fr etc/X11

  # Install licenses
  install -Dm644 "${srcdir}/SLA_AdvancedSoftware.pdf" "usr/share/licenses/${pkgname}/SLA_AdvancedSoftware.pdf"

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

  # Create soname links
  _create_links

}
