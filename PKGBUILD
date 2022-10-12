# Maintainer: Timo Sarawinski <timo@it-kraut.net>
pkgname=ofork
pkgver=10.0.5
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
            '6523e133fa22ad2e8c084f7db7e38271eb554aa5cde91f2954ce6ec4f6271d5f'
            '6ce590a6d5be8704cb24691166f975bc77ce14b563a5b0255bab7dc73539fee7'
            'cf63f0448b1110a680d681403b3963f7a64e9363eaddc3801baa47f95ab15d6b'
            '000fbf1d7dacdae65ce0080b7464f34a1756340b6d5d79b7a751d550cae2a197'
            '0c54e72ba31e88d297ef1512b77c4675836837c293cf0442df820a59395ccf5b'
            '8adb4eaa4a973b9556604ce7364b4f5752d927d44b4f81ef8bd6f79754e90c8b'
            '622079af9890e2e9198708dcdc0e4af26927c4d959f6c31c2a19c9a741a8743a'
            '3a2b477c7ff594cce4e1c4019cbf3c2678cd1913b16944940771108b4da27906'
            '5e28f204af5dd869c2f50d6a7003ccbf49020156eb83dfa7ab1234fe3405523f'
            'ee6d91f491841571e06497aeae2c1e403c46390b97357935cc19d569edf28f76'
            '533a6760c7d89c70764be3f5d45b269c2c51a828262b778702be97384890286b')

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
