pkgname=otrs
pkgver=3.3.9
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
        "http://ftp.otrs.org/pub/otrs/packages/OTRSMasterSlave-1.4.4.opm"
        "http://ftp.otrs.org/pub/otrs/packages/Support-1.5.4.opm"
        "http://ftp.otrs.org/pub/otrs/packages/Survey-2.3.2.opm"
        "http://ftp.otrs.org/pub/otrs/packages/SystemMonitoring-2.5.2.opm"
        "http://ftp.otrs.org/pub/otrs/packages/TimeAccounting-2.3.2.opm"
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
         'fd347a69fab664f8270450fda7342f4a'
         '5241b89a24038e323c35bacaa9a0e013'
         '7bd9cccc494a86f78a13f06b5d625216'
         '56c4103384fc640213405e1a400795a0'
         'bcf46946e42553a761ae784a9f44e637'
         'ad747202cf0e31b72e311e18288c8d00'
         '4169a6e81d0f0a6d8c76b2ea902f8c85'
         'd966b10b299dcc5b230418364cb884bd'
         '3a9342a8b7347bf47f832d58020beb9c'
         'aee666b3df8af554da2bc96ff512939c'
         '693dfab8458e202d935f31f4c7128670'
         'cec1d57f6fc904d6b8ed4748ed07e92c'
         '7279898031e441cf5ffdbe8ee31d90dc'
         '5744f673afe225b3eca73796b6c8c68b'
         'd2279a0d9881f2dd67abb7133b1763b0'
         '529600ab8ac6beda5d1a03fd69545a86'
         '6576d6f293814e6e1346b066fbe5c742'
         'dfce17764aeed224490232f6c5880853'
         '7083a797c1a6a7da73fde4b3f289a9fe'
         '0a7033260b481796f887779caa7ce560')
sha1sums=('aa8e024dcf6dc0f29fe421ca5f0451b701ede0b8'
          '585f0aadd1dc693492098f8f50a6b624921300d9'
          '7ce0b4c88ccfe6d105848395e3c6f4dfbe32a924'
          'e7c2ba45880097c46caed9b0f979828807f24354'
          '218c81b4aa49b12d0647f8a0e4be24c946f9aa78'
          'baa69267b5dc42cfcb9f1e2b9a4d6277c70e20a5'
          '68dd8f6512bda29c19fa94852cbd3c9d63fb66c7'
          '03cf349c2fe48c918047307e34beab3a5422c8f7'
          'ad366c174b160d133966f0cb3bb232fb932a0763'
          '5362cc6fc56d8b5e2a9b208c8d5789213bba5576'
          '602e6a21f143050c009e66cfc966cf945b994485'
          '06b0f08497e33bf243b34c075507367baeaca071'
          '319c419b4533b7daa66a5decbb61fb2a7f945105'
          'eaba31f10e559ec3f707d4d3318abf825aa9a844'
          '62d578550b3301e953db178cf684aefaaf617285'
          'bd95753e1c1ac2584286ce45aec7ac42aae6aedc'
          'c3db858b9c3735e21e205be8200d2c087e828faa'
          '03127c1d256b4fb81bb14f7f30c5e965502c6a1d'
          '90bfd17247d4766df2ce2f0c0ef0133f1558926d'
          '0f0e466b1e25ab0ff4554e953b5f5804fab65efa'
          '242aab61ffecd41efc87b02cb032c838e4ac41f4')
