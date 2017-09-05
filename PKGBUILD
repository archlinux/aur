# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=lsi-msm
_pkgver=17.05.00-02
pkgver="${_pkgver//-/.}"
pkgrel=2
pkgdesc="LSI Logic MegaRAID Storage Manager Suite"
arch=('i686' 'x86_64')
url='http://www.avagotech.com/products/server-storage'
license=('custom:LSI')
depends=('lsi-openpegasus'
         'unixodbc'
         'net-snmp'
         'perl-net-snmp'
         'perl-term-readkey'
         'xdg-utils'
         'java-environment'
         )
depends_i686=('libxi'
              'libxft'
              'libpng12'
              'libxinerama'
              'libjpeg6-turbo'
              'libxxf86vm'
              # 'xerces-c'
              )
depends_x86_64=('lib32-libxi'
                'lib32-libxft'
                'lib32-libpng12'
                'lib32-libxinerama'
                'lib32-libjpeg6-turbo'
                'lib32-libxxf86vm'
                # 'lib32-xerces-c'
                )
makedepends=('setconf')
source=('msm_profile.sh'
        'LSI_StorSNMP.ini'
        'lsi_msm.service'
        'lsi_mrdsnmpd.service'
        'ld.so.lsi-msm.conf'
        'https://www.broadcom.com/docs-and-downloads/advanced-software/advanced-software-common-files/SLA_AdvancedSoftware.pdf'
        )
source_i686=("${pkgver}_Linux-x86_MSM.gz::https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/${pkgver}_Linux-32_MSM.gz")
source_x86_64=("${pkgver}_Linux-x64_MSM.gz::https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/${pkgver}_Linux-64_MSM.gz")
sha256sums=('11892783bc2569ad1f4bac0ec8f91f1e7e54c795f9b6454e93348a6ca0cf2a5b'
            '605adcb662fb457609e81fb8916da7e88541e81dd0c112a8bb569d84df189bff'
            'c33714f33698ab2aebb28b040ed78dba5efbda0429be51662fc635ba49fd235a'
            '98bfc8d174cd2b056353742dc52c40f56bb77676e816f33184ab1de3e8108cfd'
            '9277df42e8fbd4c952f222f281e87f1d05c6e6dbf3c4fc8a6fbe75ae8098e05f'
            '9be6a8818ea1dccec65d48b86dd0cc62009dc3886229e3dce41192a241bd55c3')
sha256sums_i686=('1a61f3e0099aa962d07303555cfdb1265b2dd83348d3e1b3f1d6c36d53babd36')
sha256sums_x86_64=('63f0d87feba33a7602cdd7488317519edc33442037e1bbaef9f55ce9bd5ea3dd')
install=lsi-msm.install
backup=('etc/lsi_mrdsnmp/LSI_StorSNMP.ini'
        'etc/lsi_mrdsnmp/sas/sas_TrapDestination.conf'
        'etc/lsi_mrdsnmp/sas-ir/sas_ir_TrapDestination.conf'
        'usr/share/MegaRAID_Storage_Manager/StrongSSLEncryption.ini'
        'usr/share/MegaRAID_Storage_Manager/installationmode.properties'
        'usr/share/MegaRAID_Storage_Manager/vivaldikey.properties'
        'usr/share/MegaRAID_Storage_Manager/vivaldikeys'
        'usr/share/MegaRAID_Storage_Manager/vivaldikeys2048'
        'usr/share/MegaRAID_Storage_Manager/Framework/vivaldikey.properties'
        'usr/share/MegaRAID_Storage_Manager/Framework/vivaldikeys'
        'usr/share/MegaRAID_Storage_Manager/Framework/vivaldikeys2048'
        'usr/share/MegaRAID_Storage_Manager/MegaPopup/vivaldikey.properties'
        'usr/share/MegaRAID_Storage_Manager/MegaPopup/vivaldikeys'
        'usr/share/MegaRAID_Storage_Manager/MegaPopup/vivaldikeys2048'
        )
options=('!strip')

_create_links() {
  # create soname links
  for _lib in $(find "${pkgdir}/usr/lib" -name '*.so*' && \
                find "${pkgdir}/opt/lsi/msm/lib" -name '*.so*' && \
                find "${pkgdir}/opt/lsi/snmp/lib" -name '*.so*'); do
    _soname=$(dirname "${_lib}")/$(readelf -d "${_lib}" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
    _base=$(echo ${_soname} | sed -r 's/(.*).so.*/\1.so/')
    [[ -e "${_soname}" ]] || ln -s $(basename "${_lib}") "${_soname}"
    [[ -e "${_base}" ]] || ln -s $(basename "${_soname}") "${_base}"
  done
}

package() {
  cd "${pkgdir}"

  # Extract RPM's
  for i in $(find "${srcdir}/disk" -type f -name 'MegaRAID*.rpm' -o -name 'sas_*.rpm'); do bsdtar -xf "${i}"; done &> /dev/null

  # Move to correct place
  [ "${CARCH}" = "x86_64" ] && mv usr/lib64 usr/lib
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
  find . -name '*.log' -delete
  rm -fr etc/init.d \
         etc/lsi_mrdsnmp/lsi_mrdsnmpd.{rh,suse} \
         etc/lsi_mrdsnmp/sas{,-ir}/{install,uninstall} \
         usr/share/MegaRAID_Storage_Manager/setdisp.png.old \
         usr/share/MegaRAID_Storage_Manager/*desktop.{SuSE,redhat} \
         usr/share/MegaRAID_Storage_Manager/{uninstaller,pwd,.__uninst}.sh \
         usr/share/MegaRAID_Storage_Manager/vmware{35,40} \
         usr/share/MegaRAID_Storage_Manager/jre

  # Setup installation properties
  setconf -a usr/share/MegaRAID_Storage_Manager/installationmode.properties INSTALLATION_MODE=0

  # Fix permisions
  find . -type d -print0 2>/dev/null | xargs -0r chmod 755
  find . -type f -print0 2>/dev/null | xargs -0r chmod 644
  for i in $(find . -type f -name '*.sh' -o -name 'popup_bin' -o -name 'popup' -o -name "add_entry" -o -name 'storcli*' -o -name 'mrmonitor' -o -name '*.so*'); do chmod +x ${i}; done
  chmod +x etc/lsi_mrdsnmp/lsi_mrdsnmp{agent,main}

  # Make symlinks
  install -d usr/bin
  ln -sf /etc/lsi_mrdsnmp/lsi_mrdsnmpagent usr/bin/lsi_mrdsnmpagent
  ln -sf /etc/lsi_mrdsnmp/lsi_mrdsnmpmain usr/bin/lsi_mrdsnmpmain

  # Remove RH/SuSe paths remains
  for i in $(find . -type f -name '*.sh' -o -name 'popup'); do sed -e '/msm_profile/d' -i "${i}"; done

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
  sed -e 's|../jre|/usr/lib/jvm/`archlinux-java get`/jre|g' \
      -e 's|/usr/lib/jvm/`archlinux-java get`/jre/lib/rt.jar:/usr/lib/jvm/`archlinux-java get`/jre/lib/jsse.jar:/usr/lib/jvm/`archlinux-java get`/jre/lib/jce.jar:||g' \
      -i usr/share/MegaRAID_Storage_Manager/MegaPopup/popup \
      -i usr/share/MegaRAID_Storage_Manager/MegaPopup/shutdownpopup.sh \
      -i usr/share/MegaRAID_Storage_Manager/Framework/startup.sh \
      -i usr/share/MegaRAID_Storage_Manager/Framework/shutdown.sh
  sed 's|./jre|/usr/lib/jvm/`archlinux-java get`/jre|g' \
      -i usr/share/MegaRAID_Storage_Manager/startupui.sh \

  # Remove unused LD_LIBRARY_PATH
  sed '/^LD_LIBRARY_PATH/d' \
      -i usr/share/MegaRAID_Storage_Manager/Framework/startup.sh

  # Add missing #! in scripts
  sed '1i#!/usr/bin/sh' \
      -i usr/share/MegaRAID_Storage_Manager/startupui.sh \
      -i usr/share/MegaRAID_Storage_Manager/startmonitorhelp.sh \
      -i usr/share/MegaRAID_Storage_Manager/Framework/startup.sh \
      -i usr/share/MegaRAID_Storage_Manager/Framework/shutdown.sh

  # Install services and other files
  install -Dm644 "${srcdir}/lsi_msm.service" usr/lib/systemd/system/lsi_msm.service
  install -Dm644 "${srcdir}/lsi_mrdsnmpd.service" usr/lib/systemd/system/lsi_mrdsnmpd.service

  install -Dm755 "${srcdir}/msm_profile.sh" etc/profile.d/msm.sh

  install -Dm644 "${srcdir}/LSI_StorSNMP.ini" etc/lsi_mrdsnmp/LSI_StorSNMP.ini

  # Create soname links
  _create_links

  # Add /opt/lsi/msm/lib and /opt/lsi/snmp/lib to ldconf search path
  install -Dm644 "${srcdir}/ld.so.lsi-msm.conf" etc/ld.so.conf.d/lsi-msm.conf

  # Remove Megapopup system launcher. because eats tons of RAM and have missing dependencies
  rm -fr etc/X11

  # Install licenses
  install -Dm644 "${srcdir}/SLA_AdvancedSoftware.pdf" "usr/share/licenses/${pkgname}/SLA_AdvancedSoftware.pdf"
}
