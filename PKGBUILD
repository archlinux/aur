# Maintainer: Timo Sarawinski <timo@it-kraut.net>
pkgname=ofork
pkgver=10.0.6
pkgrel=1
pkgdesc="OFORK is a OTRS fork open-source Help Desk and IT Service Management (ITSM)"
arch=("any")
options=("emptydirs")
url="https://o-fork.de/"
license=("GPLv3")
depends=("perl"
         "perl-gd"
         "perl-dbi"
         "perl-ldap"
         "perl-ntlm"
         "perl-dbd-pg"
         "perl-gdgraph"
         "perl-json-xs"
         "perl-net-dns"
         "perl-datetime"
         "perl-timedate"
         "perl-pdf-api2"
         "perl-dbd-odbc"
         "perl-dbd-mysql"
         "perl-gdtextutil"
         "perl-xml-parser"
         "perl-archive-zip"
         "perl-text-csv-xs"
         "perl-xml-libxslt"
         "perl-authen-sasl"
         "perl-crypt-ssleay"
         "perl-yaml-libyaml"
         "perl-mail-imapclient"
         "perl-template-toolkit"
         "perl-lwp-protocol-https"
         "perl-bytes-random-secure")
optdepends=("mariadb:  Fast SQL database server, drop-in replacement for MySQL"
            "apache:   A high performance Unix-based HTTP server"
	    "perl-crypt-eksblowfish"
            "mod_perl"
            "perl-dbd-oracle")
backup=("etc/webapps/${pkgname}/Config.pm")
install="${pkgname}.install"
source=("${pkgname}.install"
        "https://ftp.o-fork.de/ofork-${pkgver}.tar.gz"
	"https://ftp.o-fork.de/ITSM/Bundle10/ITSM-${pkgver}.opm"
	"https://ftp.o-fork.de/ITSM/GeneralCatalog-${pkgver}.opm"
	"https://ftp.o-fork.de/ITSM/ITSMCore-${pkgver}.opm"
        "https://ftp.o-fork.de/ITSM/ITSMChangeManagement-${pkgver}.opm"
        "https://ftp.o-fork.de/ITSM/ITSMConfigurationManagement-${pkgver}.opm"
        "https://ftp.o-fork.de/ITSM/ITSMIncidentProblemManagement-${pkgver}.opm"
        "https://ftp.o-fork.de/ITSM/ImportExport-${pkgver}.opm"
	"https://ftp.o-fork.de/AddOns/FAQ-${pkgver}.opm"
	"https://ftp.o-fork.de/AddOns/MasterSlave-${pkgver}.opm"
	"https://ftp.o-fork.de/AddOns/Survey-${pkgver}.opm")
sha256sums=('237bea50871d37e6822b5b47c6c47e90061981293a7edfe3c679e968e7088b42'
            '4ced20e6d169fd4c6ceb5ebad0135259ceb9c48e407ec35bc45b51f30b234177'
            '169295ee25277f10d4d9bb9280d5146f59516033a58b9c3664d20eeae8896895'
            '239ffa321145f8fac7ef480eb79f2cb4e6de4978afad1c05763088cf9b81b50c'
            'e96752cdf06d2f5b8f947a210b7bb3c85ca4e1ed4616f050dc36b83972870fc8'
            '2e42459039008ea7207713df2c8e2809ee97c0862aa9fd05bf430f66596dcbd5'
            'd98922f43d0e3d94f543ce9fa395d35224b3eef65791fc6705bb2d1b22c405b6'
            '0fb07b80aca5604e65ef02a81434c291e0ce2fb3ed067522f16714f2a0ba5b02'
            'df2edad77d4d7b7f656a3e7796cf9fe537b030005685c3d08a8e99708e22ac04'
            '94663ab7a9d1083acc4262a85637eadf347b4e2a7a5db3dbec3eea0cea3cfffe'
            'c1942619d671eaa8ff57f7b9b307f0b2160a96e5c6002670c069c776a248e445'
            'f2d2076df7bd682ae163a6de6da587886e20e6a26ff1fbd733b8c4bd96f61274')

prepare() {
cat << EOL > "${srcdir}/${pkgname}.service"
[Unit]
Description=OFORK Daemon
After=network.target

[Service]
User=ofork
Group=http
Type=simple
ExecStart=/usr/share/webapps/ofork/bin/ofork.Daemon.pl start
ExecStop=/usr/share/webapps/ofork/bin/ofork.Daemon.pl stop
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOL
}

package() {
  install -dm 0755 "${pkgdir}/etc/webapps/${pkgname}"
  install -dm 0755 "${pkgdir}/usr/share/webapps/${pkgname}"

  install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/Kernel/Config.pm.dist" "${pkgdir}/etc/webapps/${pkgname}/Config.pm"
  install -Dm 0644 "${srcdir}/${pkgname}.service"                         "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

  cp -ra ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/usr/share/webapps/${pkgname}/

  for FILENAME in ${pkgdir}/usr/share/webapps/${pkgname}/var/cron/*.dist
  do
    mv $FILENAME ${pkgdir}/usr/share/webapps/${pkgname}/var/cron/`basename $FILENAME .dist`
  done
  rm "${pkgdir}/usr/share/webapps/${pkgname}/Kernel/Config.pm"
  ln -s  "/etc/webapps/${pkgname}/Config.pm" "${pkgdir}/usr/share/webapps/${pkgname}/Kernel/Config.pm"


  find "${pkgdir}/usr/share/webapps/${pkgname}" -type d -exec chmod 2775 {} \;

  sed -i "s/\/opt/\/usr\/share\/webapps/g" $(grep -rl "/opt" "${pkgdir}/etc/webapps/${pkgname}")
  sed -i "s/\/opt/\/usr\/share\/webapps/g" $(grep -rl "/opt" "${pkgdir}/usr/share/webapps/${pkgname}")
}
