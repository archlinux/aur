# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=lsi-msm
pkgver=15.03.01.00
pkgrel=1
pkgdesc="LSI Logic MegaRAID Storage Manager Suite"
arch=('i686' 'x86_64')
url="http://www.lsi.com/"
license=('custom:LSI' 'Custom:TOG')
depends=('libxtst' 'alsa-lib' 'libnet' 'unixodbc' 'net-snmp' 'perl-net-snmp' 'perl-term-readkey' 'xdg-utils')
depends_i686=('libxi' 'libxft' 'libpng12' 'libxinerama' 'libjpeg6-turbo') # 'xerces-c'
depends_x86_64=('lib32-libxi' 'lib32-libxft' 'lib32-libpng12' 'lib32-libxinerama' 'lib32-libjpeg6-turbo') # 'lib32-xerces-c'
makedepends=('icu' 'openslp' 'sqlite')

DLAGENTS=('https::/usr/bin/wget -c -t 3 --waitretry=3 -O %o %u'
          'http::/usr/bin/curl -qb "" -fLC - --retry 3 --retry-delay 3 -o %o %u')

# This download a "Token". without this, the remote server refuses to download any file.
# For allow download files, need entre in the web, search the downloable package and then need acept the EULA.
# For lie to the server for download the sources, only need try download any donwloadable file ("Token") directly through in the server. then the server detect this like a accept the EULA (:D).
# If not download this token, then the makepkg fails download (or download incorrecty file, normally a html file instead a real tar.gz) and need reload the compilation.
# The download gate remains open about 15 minutes before needed download the token/files again.
wget "http://www.lsi.com/magic.axd?x=e&file=http%3A//www.lsi.com/downloads/Public/MegaRAID%2520Common%2520Files/${pkgver}_Linux-x86_MSM.txt" -q -O /dev/null

source=('https://collaboration.opengroup.org/pegasus/documents/29160/pegasus-2.13.0.tar.gz'
        #'https://collaboration.opengroup.org/pegasus/documents/32557/pegasus-2.14.0.tar.gz'
        #'https://collaboration.opengroup.org/pegasus/documents/32572/pegasus-2.14.1.tar.gz'
        'msm_profile.sh'
        'LSI_StorSNMP.ini'
        'lsi_msm.service'
        'lsi_mrdsnmpd.service'
        'ld.so.lsi-msm.conf'
        'License.html'
        'http://pkgs.fedoraproject.org/cgit/tog-pegasus.git/plain/pegasus-2.9.0-no-rpath.patch'
        'http://pkgs.fedoraproject.org/cgit/tog-pegasus.git/plain/pegasus-2.7.0-PIE.patch')
source_i686=("${pkgver}_Linux-x86_MSM.gz::http://www.lsi.com/downloads/Public/RAID%20Controllers/RAID%20Controllers%20Common%20Files/${pkgver}_Linux-x86_MXM.gz")
source_x86_64=("${pkgver}_Linux-x64_MSM.gz::http://www.lsi.com/downloads/Public/RAID%20Controllers/RAID%20Controllers%20Common%20Files/${pkgver}_Linux-64_MSM.gz")
sha1sums=('c1daaf01defe9f9556290250857da3523124944f'
          '0e5d7b71435760e3ef7c1e132ba05145ccbd1268'
          '79fbe24898030db50295a6254e7c4627e2b51b7c'
          'a48e4ea5bf759b164f8b81880fa704afd1049814'
          'cf0b8f00bad6545082af177d13511bec41fc4b4e'
          '73b553200ae2ccae980701d7324681529f551fc9'
          '4243c765b47ecf525a91720fa6fe8d7f22dc988e'
          '236728c6ebdcad97bec03cb99221577e086401ad'
          '262dd8efae4025516cc23a14c6854a49af650245')
sha1sums_i686=('26d1693eee4f2d397b7344c36492ec3ca8888f99')
sha1sums_x86_64=('95e854133b338e2d7c0166095bb870ec8b6b1e33')

install=lsi-msm.install
backup=('etc/lsi_mrdsnmp/LSI_StorSNMP.ini'
        'etc/lsi_mrdsnmp/sas/sas_TrapDestination.conf'
        'etc/lsi_mrdsnmp/sas-ir/sas_ir_TrapDestination.conf'
        'usr/share/MegaRAID_Storage_Manager/StrongSSLEncryption.ini'
        'usr/share/MegaRAID_Storage_Manager/vivaldikey.properties'
        'usr/share/MegaRAID_Storage_Manager/Framework/vivaldikey.properties'
        'usr/share/MegaRAID_Storage_Manager/MegaPopup/vivaldikey.properties')
options=('!strip')

create_links() {
  # create soname links
  for _lib in $(find "${pkgdir}/usr/lib" -name '*.so*' && find "${pkgdir}/opt/lsi/Pegasus" -name '*.so*'); do
    _soname=$(dirname "${_lib}")/$(readelf -d "${_lib}" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
    _base=$(echo ${_soname} | sed -r 's/(.*).so.*/\1.so/')
    [[ -e "${_soname}" ]] || ln -s $(basename "${_lib}") "${_soname}"
    [[ -e "${_base}" ]] || ln -s $(basename "${_soname}") "${_base}"
  done
}

prepare() {
  cd pegasus
  patch -p1 -i ../pegasus-2.9.0-no-rpath.patch
  patch -p1 -i ../pegasus-2.7.0-PIE.patch
  sed 's|libbase=lib64|libbase=lib|g' -i configure
}

build() {
  msg2 "Build Pegasus frameworks"
  cd pegasus
  ./configure
  make -f GNUmakefile
}

package() {
  cd "${pkgdir}"

  # Extract RPM's
  for i in $(find "${srcdir}/disk" -type f -name '*.rpm'); do bsdtar -xf ${i}; done &> /dev/null

  # Move to correct place
  [ "${CARCH}" = "x86_64" ] && mv usr/lib64 usr/lib
  mv usr/local usr/share
  mv "usr/share/MegaRAID Storage Manager" usr/share/MegaRAID_Storage_Manager

  # setup shortcuts
  install -Dm644 usr/share/MegaRAID_Storage_Manager/setdisp.png usr/share/pixmaps/setdisp.png
  install -Dm644 usr/share/MegaRAID_Storage_Manager/MSMHelp.desktop.SuSE usr/share/applications/MSMHelp.desktop
  install -Dm644 usr/share/MegaRAID_Storage_Manager/MSMStartupUI.desktop.SuSE usr/share/applications/MSMStartupUI.desktop

  # Set correct path in launchers and fix entries
  sed -e 's|local/MegaRAID Storage Manager|share/MegaRAID_Storage_Manager|g' \
      -e 's|SystemSetup||g' \
      -i usr/share/applications/*.desktop
  sed '/SubstituteUID/d' -i usr/share/applications/MSMHelp.desktop

  # Fix permisions
  find . -type d -not \( -path */jre/* -prune \) -print0 2>/dev/null | xargs -0r chmod 755
  find . -type f -not \( -path */jre/* -prune \) -print0 2>/dev/null | xargs -0r chmod 644
  for i in $(find . -type f -not \( -path */jre/* -prune \) -name '*.sh' -o -name 'popup_bin' -o -name 'popup' -o -name "add_entry" -o -name 'storcli64' -o -name 'mrmonitor' -o -name '*.so*'); do chmod +x ${i}; done
  chmod +x etc/lsi_mrdsnmp/lsi_mrdsnmp{agent,main}

  # Make symlinks
  mkdir -p usr/bin
  ln -sf /etc/lsi_mrdsnmp/lsi_mrdsnmpagent usr/bin/lsi_mrdsnmpagent
  ln -sf /etc/lsi_mrdsnmp/lsi_mrdsnmpmain usr/bin/lsi_mrdsnmpmain

  # Remove RH/SuSe path remains and change '$MSM_HOME' variables to hardcoded path in scripts
  for i in "$(find . -type f -name '*.sh' -o -name 'popup')"; do sed -e '/msm_profile/d' -e 's|$MSM_HOME|/usr/share/MegaRAID_Storage_Manager|g' -i ${i}; done

  # Standarized /usr/share/MegaRAID_Storage_Manager/start{,monitor}help.sh whit xdg-open ## need make patch instead sed
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

  install -Dm644 "${srcdir}/License.html" "usr/share/licenses/${pkgname}/License.html"
  install -Dm644 "${srcdir}/pegasus/OpenPegasusNOTICE.txt" "usr/share/licenses/${pkgname}/OpenPegasusNOTICE.txt"

  # Remove unused files
  find . -name '*.log' -delete
  rm -fr etc/init.d \
         etc/lsi_mrdsnmp/lsi_mrdsnmpd.{rh,suse} \
         etc/lsi_mrdsnmp/sas{,-ir}/{install,uninstall} \
         usr/share/MegaRAID_Storage_Manager/{*desktop.{SuSE,redhat},{uninstaller,pwd,.__uninst}.sh,vmware{35,40},installtype} \
         opt/lsi/Pegasus

  # Instal compiled Pegasus framework libraries
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
  for i in ${_pegasus_lib[@]}; do install -Dm755 "${srcdir}/pegasus/lib/${i}" "${pkgdir}/opt/lsi/Pegasus/${i}"; done

  # Create soname links
  create_links

  # Softlinking libs
  cd "${pkgdir}/opt/lsi/msm/lib"
  ln -s libstorelib.so.*.*         libstorelib.so.4
  ln -s libstorelib.so.4           libstorelib.so

  ln -s libstorelibir-2.so.*.*     libstorelibir-2.so.20
  ln -s libstorelibir-2.so.20      libstorelibir-2.so

  ln -s libstorelibir-3.so.*.*     libstorelibir-3.so.7
  ln -s libstorelibir-3.so.7       libstorelibir-3.so

  ln -s libstorelibir.so.*.*       libstorelibir.so.5
  ln -s libstorelibir.so.5         libstorelibir.so

  cd "${pkgdir}/opt/lsi/snmp/lib"
  ln -s libstorelib.so.*.*         libstorelib.so.4
  ln -s libstorelib.so.4           libstorelib.so

  ln -s libstorelibir.so.*.*       libstorelibir.so.5
  ln -s libstorelibir.so.5         libstorelibir.so

  ln -s libstorelibir-2.so.*.*     libstorelibir-2.so.20
  ln -s libstorelibir-2.so.20      libstorelibir-2.so

  ln -s libstorelibir-3.so.*.*     libstorelibir-3.so.7
  ln -s libstorelibir-3.so.7       libstorelibir-3.so

  # Add /opt/lsi/msm/lib, /opt/lsi/Pegasus and /opt/lsi/snmp/lib to ldconf search path
  install -d "${pkgdir}/etc/ld.so.conf.d"
  install -Dm644  "${srcdir}/ld.so.lsi-msm.conf" "${pkgdir}/etc/ld.so.conf.d/lsi.conf"

  #remove Megapopup system launcher. because eats tons of RAM
  rm -fr "${pkgdir}/etc/X11"
}
