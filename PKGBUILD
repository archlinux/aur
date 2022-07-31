# Maintainer: Timo Sarawinski <timo@it-kraut.net>
pkgname=ofork
pkgver=10.0.4
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
            "apache:   A high performance Unix-based HTTP server")
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
            '9dd55c850593b46d936a7070c60d603b2a0d0e81169f5ed8a300c42d45428118'
            'c9f6c0a8917b631acde081317950d62dba7c2461885e889a576a02aacff30606'
            '4c7d0a18ab46525c9f0831853e3878494ff48809027ebfbd9c27b022d77f8b65'
            '598068234de4eaccfab1238c8179999a3ed8f53f139973a2d01e7824c1b5a5c6'
            '6d506accf7484ecbda5465a925308269609cf136adb67ebe4bd90ae16bfcecd9'
            '1522c12c44a2e3056a0c699c702e4de33a6d94a4f88fe1554639c2dc33793302'
            '4c63d1c6dd697bf9f834db927864b8d32e0e5683a81276bcd4b689af2d7b0b1a'
            '547073fa299605d39d6eb9b47f0d603add4fcefed712482e263357fddd73eff5'
            '782bce827290507100b79452196400dda07beb2a6cfaddb3e6325e9ca4294adf'
            '4b452f5e23e2ef4dd3f1e0f108543b35733079fa21e0c783f0e8f4d5960ae445'
            '00cd245abfa427b69c83392209745903cfc761d29bd52254c22d34608e89583c')

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
