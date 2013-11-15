pkgname=otrs
pkgver=3.3.1
itsmver=3.3.1
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
        "http://ftp.otrs.org/pub/otrs/packages/Survey-2.3.1.opm"
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
         'df19ce9a4596623785cd914ffe557591'
         'e898594668a2b71e170566c2f65d5457'
         '21d7a10e82fd1c6544f0661a901d1cad'
         'bfd1fd89119c665e3a244e5ce37aff45'
         'bb571557e91e35ddcbe777e4d2822d16'
         '174ebc7f3b5925561a6739cf75e28047'
         '5e356ace67fa00d13eb2859e8a14056e'
         '532117acbea3dffcb37d7b8db0080f2e'
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
         '62908eea8bb5bb9db763730abb8f6fa3'
         '6576d6f293814e6e1346b066fbe5c742'
         '618f815328b9a5a8e262138ff7ca6d9b'
         '3616b36f808e2a559ec1f340f68da9cd'
         '7083a797c1a6a7da73fde4b3f289a9fe')
sha1sums=('aa8e024dcf6dc0f29fe421ca5f0451b701ede0b8'
          'f3ce7e0b0ae9d6af9466fcef2274234f946f4af8'
          '7e3013a5ef29fa062dab38eb2a67aa6c50b2590b'
          '1b07d23649e74c04570c79cccc8253959467676c'
          'cb49a3b878345476ba569a5652deb0c709d976a2'
          'be20f715cd1d572532a05e89f3eea4bec502c558'
          '326d3fab185f23090ce880bdb518d792cb468867'
          '1c2e40162903bfca6ca1f9c881c8991b88141ad7'
          'cef016db42454e59d3c64e7ad2e820715d4c145c'
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
          'b998d5ffd0c2deefd3aee7cd79c6523000ec3706'
          '03127c1d256b4fb81bb14f7f30c5e965502c6a1d'
          '3f44f7f7868874a8d9d940b11ba624f3633b6c54'
          '44ebda46d181d5032539a2624f4f06da7b5d57cf'
          '0f0e466b1e25ab0ff4554e953b5f5804fab65efa')
