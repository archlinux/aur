pkgname=otrs
pkgver=3.3.8
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
        "http://ftp.otrs.org/pub/otrs/packages/Benchmark-1.2.5.opm"
        "http://ftp.otrs.org/pub/otrs/packages/Calendar-1.9.5.opm"
        "http://ftp.otrs.org/pub/otrs/packages/FAQ-2.3.2.opm"
        "http://ftp.otrs.org/pub/otrs/packages/FileManager-1.4.9.opm"
        "http://ftp.otrs.org/pub/otrs/packages/Fred-3.2.2.opm"
        "http://ftp.otrs.org/pub/otrs/packages/MasterSlave-1.1.2.opm"
        "http://ftp.otrs.org/pub/otrs/packages/OTRSCodePolicy-1.0.4.opm"
        "http://ftp.otrs.org/pub/otrs/packages/OTRSMasterSlave-1.4.2.opm"
        "http://ftp.otrs.org/pub/otrs/packages/OpenNMS-1.2.1.opm"
        "http://ftp.otrs.org/pub/otrs/packages/Support-1.5.4.opm"
        "http://ftp.otrs.org/pub/otrs/packages/Survey-2.3.2.opm"
        "http://ftp.otrs.org/pub/otrs/packages/SystemMonitoring-2.5.2.opm"
        "http://ftp.otrs.org/pub/otrs/packages/SystemStatus-1.6.1.opm"
        "http://ftp.otrs.org/pub/otrs/packages/TimeAccounting-2.3.2.opm"
        "http://ftp.otrs.org/pub/otrs/packages/WebMail-0.13.2.opm"
        "http://ftp.otrs.org/pub/otrs/packages/iPhoneHandle-1.3.1.opm")
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
         '89e5b7eec71daf8e6eec67cff9764c18'
         '42adfcd5f073a68bc07b1a44c8a3789d'
         'e1256486a6eb397336d82263f254f122'
         '548fdc06cc2fe809ba994c298c525ffd'
         '4b3fca03417815f6debd22890113ebe0'
         '3e2fe25f967c28b3c89194ccd06c69e9'
         'eb33ac708c835a93f662690c3126ae53'
         'd67dce8fe5b90389609ba2baf169a6c6'
         'c095828fb4aade210835fb1250fcaf6b'
         '3a9342a8b7347bf47f832d58020beb9c'
         '377ff2d210bc78872c1eddd4a2543368'
         '693dfab8458e202d935f31f4c7128670'
         '909bfaaff1a87a4a5509ebd303dce52c'
         'cec1d57f6fc904d6b8ed4748ed07e92c'
         '0ca9da48fc2af9d95c1201a748ba26a6'
         '3dafa9dd8e706e6ac0d32ac619221192'
         '384bb6437746686e18ff13e9bcea9f2f'
         'd2279a0d9881f2dd67abb7133b1763b0'
         '529600ab8ac6beda5d1a03fd69545a86'
         '6576d6f293814e6e1346b066fbe5c742'
         '618f815328b9a5a8e262138ff7ca6d9b'
         'dfce17764aeed224490232f6c5880853'
         '7083a797c1a6a7da73fde4b3f289a9fe'
         '273707110ec37179288fcbb67c71fc7e')
sha1sums=('aa8e024dcf6dc0f29fe421ca5f0451b701ede0b8'
          'dfd588d131cba1e3b0c156ef56e2fbd95fe41979'
          'e6701f143b70f852f8551b1421d474cf3b8d770f'
          '2c5a33083f9f7f257c9da32bf663a262c1f2e783'
          '9b10c65e72caf83da6d732363a7eb39404eb9a08'
          'bb700a401eb054e77725c148e36bb9e36f8994b6'
          '3386e6075cab08d28071b2251453c57b1203c8a4'
          'b138c732092b4905b77a01ae1934c64079d49e63'
          '55a1dd0943afd0d267b3ab59a2947f6762da1f55'
          '232a8412b361b8cc0c3faf0ab24cb19bce2dd6bc'
          '5362cc6fc56d8b5e2a9b208c8d5789213bba5576'
          '816e63f37ae2f216869dc1ed69144e349781343e'
          '06b0f08497e33bf243b34c075507367baeaca071'
          '0cfc4631496961355a842bf95eff22982dd3e574'
          '319c419b4533b7daa66a5decbb61fb2a7f945105'
          '28efd786a52984cd63a6881567cc6699779c12fa'
          'b21006481c88d792b35ad543900ab1c318eb61aa'
          'a55a04cf4ec9cbcffaef88aeed3432e7b8e527b3'
          'bd95753e1c1ac2584286ce45aec7ac42aae6aedc'
          'c3db858b9c3735e21e205be8200d2c087e828faa'
          '03127c1d256b4fb81bb14f7f30c5e965502c6a1d'
          '3f44f7f7868874a8d9d940b11ba624f3633b6c54'
          '90bfd17247d4766df2ce2f0c0ef0133f1558926d'
          '0f0e466b1e25ab0ff4554e953b5f5804fab65efa'
          '43d159a8a69c71fd5063e907d05e52f989922509')
