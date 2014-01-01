pkgname=otrs
pkgver=3.3.3
itsmver=3.3.3
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
         "perl-crypt-ssleay"
         "perl-timedate"
         "perl-dbd-mysql"
         "perl-gdgraph"
         "perl-json"
         "perl-json-xs"
         "perl-lwp-protocol-https"
         "perl-mail-imapclient"
         "perl-apache-dbi"
         "perl-dbd-pg"
         "perl-net-dns"
         "perl-net-imap-simple-ssl"
         "perl-net-smtp-ssl"
         "perl-dbd-odbc" 
         "perl-net-smtp-tls-butmaintained"
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
        "http://ftp.otrs.org/pub/otrs/itsm/packages33/ITSMCore-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages33/GeneralCatalog-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages33/ITSMChangeManagement-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages33/ITSMConfigurationManagement-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages33/ITSMIncidentProblemManagement-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages33/ITSMServiceLevelManagement-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages33/ImportExport-${itsmver}.opm"
        # Packages
        "http://ftp.otrs.org/pub/otrs/packages/Benchmark-1.2.5.opm"
        "http://ftp.otrs.org/pub/otrs/packages/Calendar-1.9.5.opm"
        "http://ftp.otrs.org/pub/otrs/packages/FAQ-2.3.1.opm"
        "http://ftp.otrs.org/pub/otrs/packages/FileManager-1.4.9.opm"
        "http://ftp.otrs.org/pub/otrs/packages/iPhoneHandle-1.3.1.opm"
        "http://ftp.otrs.org/pub/otrs/packages/MasterSlave-1.1.2.opm"
        "http://ftp.otrs.org/pub/otrs/packages/OTRSCodePolicy-1.0.1.opm"
        "http://ftp.otrs.org/pub/otrs/packages/OpenNMS-1.2.1.opm"
        "http://ftp.otrs.org/pub/otrs/packages/OTRSMasterSlave-1.4.2.opm"
        "http://ftp.otrs.org/pub/otrs/packages/Support-1.5.4.opm"
        "http://ftp.otrs.org/pub/otrs/packages/Survey-2.3.2.opm"
        "http://ftp.otrs.org/pub/otrs/packages/SystemMonitoring-2.5.2.opm"
        "http://ftp.otrs.org/pub/otrs/packages/SystemStatus-1.6.1.opm"
        "http://ftp.otrs.org/pub/otrs/packages/TimeAccounting-2.3.1.opm"
        "http://ftp.otrs.org/pub/otrs/packages/WebMail-0.13.2.opm")
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
         '0616ba689f79cd9e5236bbe6f9df7c68'
         '488ddcc1969ed4bacb5e2aba102c9d66'
         '999ee53d28ace768e218190d85e5b8dc'
         '0d297eb8e0e63b171c9c5df1c3e8dcc4'
         '4a8d7cc5ff183866a226b28dee947a6d'
         'fd13e3aea24752945f92c8d3e61b4c14'
         '2749cba9a3a1bb03912557f19f97c9bf'
         '93f206435d1c5024c94e8c9a672a29b7'
         'c095828fb4aade210835fb1250fcaf6b'
         '3a9342a8b7347bf47f832d58020beb9c'
         'dceec7be8ec2a83df8d3c1d20a62fc60'
         '693dfab8458e202d935f31f4c7128670'
         '273707110ec37179288fcbb67c71fc7e'
         'cec1d57f6fc904d6b8ed4748ed07e92c'
         'a5d32e6840bbbd660d3efe54086b1ddb'
         '384bb6437746686e18ff13e9bcea9f2f'
         '3dafa9dd8e706e6ac0d32ac619221192'
         'd2279a0d9881f2dd67abb7133b1763b0'
         '529600ab8ac6beda5d1a03fd69545a86'
         '6576d6f293814e6e1346b066fbe5c742'
         '618f815328b9a5a8e262138ff7ca6d9b'
         '3616b36f808e2a559ec1f340f68da9cd'
         '7083a797c1a6a7da73fde4b3f289a9fe')
sha1sums=('aa8e024dcf6dc0f29fe421ca5f0451b701ede0b8'
          '277eb41e7889088fe8fd6275719db547f8b602dc'
          '3e4751dbd4c48dbf91364c36d53acd7bb5f8062b'
          'e4f9901f850ed0643e0ba717df71a6daff68a4db'
          'c351713fd7f982cf338e459155b10e9e20b737e9'
          '831379762295618709fb946bd08123d523d7bbaf'
          '9b621e60499fdca6acc47aafb97b05ef143c3a10'
          '0d09b9a925cf53239fa0635f46842e527bf7ab27'
          'c80ed7ee0d6272edcfd8bc272370724d2c67538a'
          '232a8412b361b8cc0c3faf0ab24cb19bce2dd6bc'
          '5362cc6fc56d8b5e2a9b208c8d5789213bba5576'
          'f4250b19232cb645b679855865cd232e5a8008f5'
          '06b0f08497e33bf243b34c075507367baeaca071'
          '43d159a8a69c71fd5063e907d05e52f989922509'
          '319c419b4533b7daa66a5decbb61fb2a7f945105'
          'fb0ec5a97f788fbd3129f4f4d40a8d5d123577a0'
          'a55a04cf4ec9cbcffaef88aeed3432e7b8e527b3'
          'b21006481c88d792b35ad543900ab1c318eb61aa'
          'bd95753e1c1ac2584286ce45aec7ac42aae6aedc'
          'c3db858b9c3735e21e205be8200d2c087e828faa'
          '03127c1d256b4fb81bb14f7f30c5e965502c6a1d'
          '3f44f7f7868874a8d9d940b11ba624f3633b6c54'
          '44ebda46d181d5032539a2624f4f06da7b5d57cf'
          '0f0e466b1e25ab0ff4554e953b5f5804fab65efa')
