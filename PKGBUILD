# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=lsi-msm
pkgver=16.02.00.04
_pkgver="$(echo "${pkgver}" | sed 's/\./-/3')"
pkgrel=1
pkgdesc="LSI Logic MegaRAID Storage Manager Suite"
arch=('i686' 'x86_64')
url='http://www.avagotech.com/products/server-storage'
license=('custom:LSI' 'custom:TOG')
depends=('libxtst'
         'alsa-lib'
         'libnet'
         'libxslt'
         'unixodbc'
         'net-snmp'
         'perl-net-snmp'
         'perl-term-readkey'
         'xdg-utils'
         )
depends_i686=('libxi'
              'libxft'
              'libpng12'
              'libxinerama'
              'libjpeg6-turbo'
              # 'xerces-c'
              )
depends_x86_64=('lib32-libxi'
                'lib32-libxft'
                'lib32-libpng12'
                'lib32-libxinerama'
                'lib32-libjpeg6-turbo'
                # 'lib32-xerces-c'
                )
makedepends=('icu'
             'openslp'
             'sqlite'
             'lynx'
             )

          # OpenPegasus site don't like wget/curl. :/
DLAGENTS=('https::/usr/bin/lynx -accept_all_cookies -cmd_script=lynx_script_for_download_pegasus %u'
          'http::/usr/bin/curl -qb "" -fLC - --retry 3 --retry-delay 3 -o %o %u')

source=('lynx_script_for_download_pegasus' #IMPORTANT for download pegasus zip. please don't move to other place
        'https://collaboration.opengroup.org/pegasus/documents/32572/pegasus-2.14.1.tar.gz'
        'msm_profile.sh'
        'LSI_StorSNMP.ini'
        'lsi_msm.service'
        'lsi_mrdsnmpd.service'
        'ld.so.lsi-msm.conf'
        'http://www.avagotech.com/docs-and-downloads/advanced-software/advanced-software-common-files/SLA_AdvancedSoftware.pdf'
        'http://pkgs.fedoraproject.org/cgit/tog-pegasus.git/plain/pegasus-2.7.0-PIE.patch'
        'http://pkgs.fedoraproject.org/cgit/tog-pegasus.git/plain/pegasus-2.9.0-no-rpath.patch'
        'http://pkgs.fedoraproject.org/cgit/tog-pegasus.git/plain/pegasus-2.13.0-gcc5-build.patch'
        'http://pkgs.fedoraproject.org/cgit/tog-pegasus.git/plain/pegasus-2.14.1-build-fixes.patch'
        'http://pkgs.fedoraproject.org/cgit/tog-pegasus.git/plain/pegasus-2.14.1-ssl-include.patch')
source_i686=("${pkgver}_Linux-x86_MSM.tar.gz::http://docs.avagotech.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/MSM_linux_x86_installer-${_pkgver}.tar.gz")
source_x86_64=("${pkgver}_Linux-x64_MSM.tar.gz::http://docs.avagotech.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/MSM_linux_x64_installer-${_pkgver}.tar.gz")
sha1sums=('3e0e9a5b5bae72af361db01825242aefcfc3094a'
          'c832eaf240f6dfba843c4937f7a935382d48b9be'
          '0e5d7b71435760e3ef7c1e132ba05145ccbd1268'
          '79fbe24898030db50295a6254e7c4627e2b51b7c'
          'e52a1be05599cd7e5ecf1085311c00c7e16e4b43'
          '08e484f4c1f177a81587d5e12f2b806baddcf199'
          '73b553200ae2ccae980701d7324681529f551fc9'
          '8f7da07466346443acc24df3608744a7d80a9124'
          '262dd8efae4025516cc23a14c6854a49af650245'
          '236728c6ebdcad97bec03cb99221577e086401ad'
          'e8c0cea2589daebcd94ec2baf726391d4cd516cd'
          'a4d642b7be3c3400539dac5014f66463dc567221'
          '1eadb4d032cb7e7367317e61fee6a6e1f9f68868')
sha1sums_i686=('f0e73ea96f37fc99761587a07f5f2c88fb95fd71')
sha1sums_x86_64=('e8019072b1071d2043180fae907bc67fa67890fa')
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
        'usr/share/MegaRAID_Storage_Manager/MegaPopup/vivaldikeys2048')
options=('!strip')

_create_links() {
  # create soname links
  for _lib in $(find "${pkgdir}/usr/lib" -name '*.so*' && \
                find "${pkgdir}/opt/lsi/Pegasus" -name '*.so*' && \
                find "${pkgdir}/opt/lsi/msm/lib" -name '*.so*' && \
                find "${pkgdir}/opt/lsi/snmp/lib" -name '*.so*'); do
    _soname=$(dirname "${_lib}")/$(readelf -d "${_lib}" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
    _base=$(echo ${_soname} | sed -r 's/(.*).so.*/\1.so/')
    [[ -e "${_soname}" ]] || ln -s $(basename "${_lib}") "${_soname}"
    [[ -e "${_base}" ]] || ln -s $(basename "${_soname}") "${_base}"
  done
}

prepare() {
  # Patch pegasus-toc sources
  patch -d pegasus -p1 -i ../pegasus-2.7.0-PIE.patch
  patch -d pegasus -p1 -i ../pegasus-2.9.0-no-rpath.patch
  patch -d pegasus -p1 -i ../pegasus-2.13.0-gcc5-build.patch
  patch -d pegasus -p1 -i ../pegasus-2.14.1-build-fixes.patch
  patch -d pegasus -p1 -i ../pegasus-2.14.1-ssl-include.patch

  sed 's|libbase=lib64|libbase=lib|g' -i pegasus/configure
}

build() {
  msg2 "Build Pegasus-TOG framework"
  cd pegasus
  ./configure
  make -f GNUmakefile
}

package() {
  cd "${pkgdir}"

  # Extract RPM's
  for i in $(find "${srcdir}/disk" -type f -name '*.rpm'); do bsdtar -xf "${i}"; done &> /dev/null

  # Move to correct place
  [ "${CARCH}" = "x86_64" ] && mv usr/lib64 usr/lib
  mv usr/local usr/share
  mv "usr/share/MegaRAID Storage Manager" usr/share/MegaRAID_Storage_Manager

  # setup shortcuts
  install -Dm644 usr/share/MegaRAID_Storage_Manager/setdisp.png usr/share/pixmaps/setdisp.png
  install -Dm644 usr/share/MegaRAID_Storage_Manager/MSMHelp.desktop.SuSE usr/share/applications/MSMHelp.desktop
  install -Dm644 usr/share/MegaRAID_Storage_Manager/MSMStartupUI.desktop.SuSE usr/share/applications/MSMStartupUI.desktop

  # setup installation properties
  echo INSTALLATION_MODE=0 > usr/share/MegaRAID_Storage_Manager/installationmode.properties

  # Set correct path in desktop launchers and fix entries
  sed -e 's|local/MegaRAID Storage Manager|share/MegaRAID_Storage_Manager|g' \
      -e 's|SystemSetup||g' \
      -i usr/share/applications/*.desktop
  sed '/SubstituteUID/d' -i usr/share/applications/MSMHelp.desktop

  # Fix permisions
  find . -type d -not \( -path */jre/* -prune \) -print0 2>/dev/null | xargs -0r chmod 755
  find . -type f -not \( -path */jre/* -prune \) -print0 2>/dev/null | xargs -0r chmod 644
  for i in $(find . -type f -not \( -path */jre/* -prune \) -name '*.sh' -o -name 'popup_bin' -o -name 'popup' -o -name "add_entry" -o -name 'storcli*' -o -name 'mrmonitor' -o -name '*.so*'); do chmod +x ${i}; done
  chmod +x etc/lsi_mrdsnmp/lsi_mrdsnmp{agent,main}

  # Make symlinks
  install -d usr/bin
  ln -sf /etc/lsi_mrdsnmp/lsi_mrdsnmpagent usr/bin/lsi_mrdsnmpagent
  ln -sf /etc/lsi_mrdsnmp/lsi_mrdsnmpmain usr/bin/lsi_mrdsnmpmain

  # Remove RH/SuSe paths remains
  for i in $(find . -type f -name '*.sh' -o -name 'popup'); do sed -e '/msm_profile/d' -i "${i}"; done

  # Standarized /usr/share/MegaRAID_Storage_Manager/start{,monitor}help.sh whit xdg-open ## Someday, I'll create a patch instead sed
  sed -e '13,20d' -e 's|mozilla|xdg-open|g' -e 's|/firefox||g' -i usr/share/MegaRAID_Storage_Manager/startmonitorhelp.sh
  sed -e '28,35d' -e 's|mozilla|xdg-open|g' -e 's|/firefox||g' -i usr/share/MegaRAID_Storage_Manager/starthelp.sh

  # Remove unused path in usr/share/MegaRAID_Storage_Manager/Framework/startup.sh
  sed -e 's|:/opt/lsi/Apache||g' -e 's|:/opt/lsi/openssl||g' -i usr/share/MegaRAID_Storage_Manager/Framework/startup.sh

  # Add missing #! in scripts
  sed '1i#!/usr/bin/sh' -i usr/share/MegaRAID_Storage_Manager/startupui.sh \
                        -i usr/share/MegaRAID_Storage_Manager/startmonitorhelp.sh \
                        -i usr/share/MegaRAID_Storage_Manager/Framework/startup.sh \
                        -i usr/share/MegaRAID_Storage_Manager/Framework/shutdown.sh

  # Install services and other files
  install -Dm644 "${srcdir}/lsi_msm.service" usr/lib/systemd/system/lsi_msm.service
  install -Dm644 "${srcdir}/lsi_mrdsnmpd.service" usr/lib/systemd/system/lsi_mrdsnmpd.service

  install -Dm755 "${srcdir}/msm_profile.sh" etc/profile.d/msm.sh

  install -Dm644 "${srcdir}/LSI_StorSNMP.ini"  etc/lsi_mrdsnmp/LSI_StorSNMP.ini

  # Remove unused files
  find . -name '*.log' -delete
  rm -fr etc/init.d \
         etc/lsi_mrdsnmp/lsi_mrdsnmpd.{rh,suse} \
         etc/lsi_mrdsnmp/sas{,-ir}/{install,uninstall} \
         usr/share/MegaRAID_Storage_Manager/*desktop.{SuSE,redhat} \
         usr/share/MegaRAID_Storage_Manager/{uninstaller,pwd,.__uninst}.sh \
         usr/share/MegaRAID_Storage_Manager/vmware{35,40}

  # Instal compiled Pegasus framework libraries
  rm -fr opt/lsi/Pegasus
  local _pegasus_lib=('libpegclient.so.1'
                      'libpegcommon.so.1'
                      'libpegconfig.so.1'
                      'libpegcql.so.1'
                      'libpegexportserver.so.1'
                      'libpeglistener.so.1'
                      'libpegprovider.so.1'
                      'libpegslp_client.so.1'
                      'libpegquerycommon.so.1'
                      'libpegqueryexpression.so.1'
                      'libpegwql.so.1'
                     )
  for i in ${_pegasus_lib[@]}; do install -Dm755 "${srcdir}/pegasus/lib/${i}" "opt/lsi/Pegasus/${i}"; done

  # Create soname links
  _create_links

  # Softlinking needed libs
  (cd opt/lsi/snmp/lib; ln -s libstorelibir-3.so.*.* libstorelibir-3.so.7)

  # Add /opt/lsi/msm/lib, /opt/lsi/Pegasus and /opt/lsi/snmp/lib to ldconf search path
  install -Dm644 "${srcdir}/ld.so.lsi-msm.conf" etc/ld.so.conf.d/lsi.conf

  # Remove Megapopup system launcher. because eats tons of RAM
  rm -fr etc/X11

  # Install licenses
  install -Dm644 "${srcdir}/SLA_AdvancedSoftware.pdf" "usr/share/licenses/${pkgname}/SLA_AdvancedSoftware.pdf"
  install -Dm644 "${srcdir}/pegasus/OpenPegasusNOTICE.txt" "usr/share/licenses/${pkgname}/OpenPegasusNOTICE.txt"
}
