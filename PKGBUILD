pkgname=otrs
pkgver=3.3.10
pkgrel=1
pkgdesc="OTRS is the leading open-source Help Desk and IT Service Management (ITSM)"
arch=("any")
options=("emptydirs")
url="http://www.otrs.com/"
license=("GPLv3")
depends=("apache>=2"
         "mariadb>=5.5"
         "perl>=5.8.8"
         "mod_perl>=2"
         "perl-dbi"
         "perl-archive-zip"
         "perl-crypt-ssleay"
         "perl-timedate"
         "perl-dbd-mysql"
         "perl-gd"
         "perl-gdtextutil"
         "perl-gdgraph"
         "perl-json-xs"
         "perl-lwp-protocol-https"
         "perl-mail-imapclient"
         "perl-net-dns"
         "perl-ldap"
         "perl-pdf-api2"
         "perl-yaml-libyaml"
         "perl-text-csv-xs"
         "perl-xml-parser"
         "perl-crypt-eksblowfish")
backup=("etc/webapps/${pkgname}/Config.pm")
install="${pkgname}.install"
source=("${pkgname}.install"
        "http://ftp.otrs.org/pub/otrs/${pkgname}-${pkgver}.tar.gz"
        # ITSM
        "http://ftp.otrs.org/pub/otrs/itsm/packages33/ITSMCore-${pkgver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages33/GeneralCatalog-${pkgver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages33/ITSMChangeManagement-${pkgver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages33/ITSMConfigurationManagement-${pkgver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages33/ITSMIncidentProblemManagement-${pkgver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages33/ITSMServiceLevelManagement-${pkgver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages33/ImportExport-${pkgver}.opm"
        # Packages
        "http://ftp.otrs.org/pub/otrs/packages/Calendar-1.9.5.opm"
        "http://ftp.otrs.org/pub/otrs/packages/FAQ-3.3.91.opm"
        "http://ftp.otrs.org/pub/otrs/packages/FileManager-1.4.9.opm"
        "http://ftp.otrs.org/pub/otrs/packages/MasterSlave-1.1.2.opm"
        "http://ftp.otrs.org/pub/otrs/packages/OTRSCodePolicy-1.0.7.opm"
        "http://ftp.otrs.org/pub/otrs/packages/OTRSMasterSlave-3.3.92.opm"
        "http://ftp.otrs.org/pub/otrs/packages/Support-1.5.4.opm"
        "http://ftp.otrs.org/pub/otrs/packages/Survey-3.3.91.opm"
        "http://ftp.otrs.org/pub/otrs/packages/SystemMonitoring-3.3.91.opm"
        "http://ftp.otrs.org/pub/otrs/packages/TimeAccounting-3.3.91.opm"
        "http://ftp.otrs.org/pub/otrs/packages/WebMail-0.13.2.opm"
        "http://ftp.otrs.org/pub/otrs/packages/iPhoneHandle-3.3.91.opm")
package() {
  install -dm 0755 "${pkgdir}/etc/webapps/${pkgname}"
  install -dm 0755 "${pkgdir}/usr/share/webapps/${pkgname}"
  install -dm 0755 "${pkgdir}/usr/share/webapps/${pkgname}/extentions"
  install -dm 0755 "${pkgdir}/usr/share/webapps/${pkgname}/extentions/itsm"
  install -dm 0755 "${pkgdir}/usr/share/webapps/${pkgname}/extentions/packages"
  install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/Kernel/Config.pm.dist" \
                   "${pkgdir}/etc/webapps/${pkgname}/Config.pm"

  cp -r ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/usr/share/webapps/${pkgname}/
  ln -s "/etc/webapps/${pkgname}/Config.pm" "${pkgdir}/usr/share/webapps/${pkgname}/Kernel/Config.pm"

  length=${#source[@]}
  for((index=0; index<${length}; index++))
  do
    if [ "${index}" -gt 1 ] && [ "${index}" -lt 9 ]
    then
      install -Dm 0644 "${srcdir}/$(echo ${source[${index}]} | sed 's/http:\/\/.*\///g')" \
                       "${pkgdir}/usr/share/webapps/${pkgname}/extentions/itsm/$(echo ${source[${index}]} | sed 's/http:\/\/.*\///g')"
    elif [ "${index}" -gt 8 ]
    then
      install -Dm 0644 "${srcdir}/$(echo ${source[${index}]} | sed 's/http:\/\/.*\///g')" \
                       "${pkgdir}/usr/share/webapps/${pkgname}/extentions/packages/$(echo ${source[${index}]} | sed 's/http:\/\/.*\///g')"
    fi
  done

  chown -R 33:33 "${pkgdir}/etc/webapps/${pkgname}"
  chown -R 33:33 "${pkgdir}/usr/share/webapps/${pkgname}"
  chmod -R 0770  "${pkgdir}/usr/share/webapps/${pkgname}"
  chmod    0750  "${pkgdir}/usr/share/webapps/${pkgname}"
  chmod -R 2770  "${pkgdir}/usr/share/webapps/${pkgname}/var/log"
  chmod -R 2770  "${pkgdir}/usr/share/webapps/${pkgname}/var/spool"
  chmod -R 2770  "${pkgdir}/usr/share/webapps/${pkgname}/var/stats"
  chmod -R 2770  "${pkgdir}/usr/share/webapps/${pkgname}/var/sessions"
  chmod -R 2770  "${pkgdir}/usr/share/webapps/${pkgname}/var/httpd/htdocs/skins/Agent"
  chmod -R 2770  "${pkgdir}/usr/share/webapps/${pkgname}/var/httpd/htdocs/skins/Agent/default"
  chmod -R 2770  "${pkgdir}/usr/share/webapps/${pkgname}/var/httpd/htdocs/skins/Agent/default/css"
  chmod -R 2770  "${pkgdir}/usr/share/webapps/${pkgname}/var/httpd/htdocs/skins/Customer"
  chmod -R 2770  "${pkgdir}/usr/share/webapps/${pkgname}/var/httpd/htdocs/skins/Customer/default"

  sed -i "s/\/opt/\/usr\/share\/webapps/g" $(grep -rl "/opt" "${pkgdir}/etc/webapps/${pkgname}")
  sed -i "s/\/opt/\/usr\/share\/webapps/g" $(grep -rl "/opt" "${pkgdir}/usr/share/webapps/${pkgname}")
}
md5sums=('6ae7c4f13927318f80c838b6ac4c9e0c'
         'a0c93c13d79b3c1963c962fb0d98c595'
         '010911189e1e05c0603a9d866f646de3'
         '092545149673d654f724a2bcabd9443c'
         '0b731e7bc1d5a4546ceebbf62715138f'
         'b67299dd331e9f7a8213f76ae7380bc4'
         '94fc454c534b5db0488d07bf8805ffaf'
         '01ef577add4875760462fc16da020220'
         '56975595adc678c5f2b3444b2931e821'
         '3a9342a8b7347bf47f832d58020beb9c'
         'aee666b3df8af554da2bc96ff512939c'
         '693dfab8458e202d935f31f4c7128670'
         'cec1d57f6fc904d6b8ed4748ed07e92c'
         '7279898031e441cf5ffdbe8ee31d90dc'
         'e59a132ec0705318c3266a8677d6dc6d'
         'd2279a0d9881f2dd67abb7133b1763b0'
         '9ebe525f2b220254a9a342b9e64bd6bb'
         'c3f7e556032c21ca6fa90a4219ffcb71'
         '07a4fea3d41018b3466c8c3ecdccb5fa'
         '7083a797c1a6a7da73fde4b3f289a9fe'
         '0a7033260b481796f887779caa7ce560')
sha1sums=('aa8e024dcf6dc0f29fe421ca5f0451b701ede0b8'
          '1dafc4f0849256bc3798b7347c1dcf89d28f0330'
          '69bba86c9ea6be77d50a8b222874768ba62bf5ba'
          '1e8201b911003f7d64bb35629f992c4de812cf34'
          'db641e893f0cdac7c31b38d96e4f938c5f2185c6'
          'ce1b6b37ea9f62432f0c0a2063d3b1ca94c27b42'
          'abe282253fb28593688f1f1861a5ae434873db92'
          'ee03e7e0efcafe820c81ac7686296c25133ea024'
          '052efab673f74a7f8be48ecca6a60ec4f5203b69'
          '5362cc6fc56d8b5e2a9b208c8d5789213bba5576'
          '602e6a21f143050c009e66cfc966cf945b994485'
          '06b0f08497e33bf243b34c075507367baeaca071'
          '319c419b4533b7daa66a5decbb61fb2a7f945105'
          'eaba31f10e559ec3f707d4d3318abf825aa9a844'
          '032deaa0a49d8d80fdcf738bf093e9e9cd88f142'
          'bd95753e1c1ac2584286ce45aec7ac42aae6aedc'
          '39b771d76f7856ebbb3d0c278041a9692d322b89'
          'd3f24aa5875292be19d307a26d20dfbe310be1a0'
          'b61954f14bbe1832ce278a3f76929466f3e07c01'
          '0f0e466b1e25ab0ff4554e953b5f5804fab65efa'
          '242aab61ffecd41efc87b02cb032c838e4ac41f4')
