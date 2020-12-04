# Maintainer: Timo Sarawinski <timo@it-kraut.net>
pkgname=ofork
pkgver=9.0.10
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
	"https://ftp.o-fork.de/ITSM/Bundle9/ITSM-${pkgver}.opm"
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
            '3c2b819bedaaac80015aeee657b9ae1bbdd5019081461688eeb4226c72453ce0'
            'd1dd33e754a41d7f83b61d4db5324572cf560df0bdfab619cce88cd58fcc257d'
            'd5c36681efcc621be766577da0c53d12c17e6fec540afba67555bcb0caa68d1d'
            'aaffe0f6a611287fb0d140c53dcc34320d0613eed3ce19a82bb5fb48428310bd'
            '13db38049236c30670477cd7bea4af9c8f1373a2def7eddd5e05ac4e0844d19b'
            '4752f7854c90f3e07112db562b6da14a147a17546ae4edd878a02e0ad9392483'
            '7af8a23a9e7bc4dfaea4298b812bc9d2309ef406d9338404eab06b66e900761b'
            'b71cdb63f92227d3a50ccbfbc5828f8171b42fe6bd29124e51c525519e85cbee'
            '724ad367a96931bf0c27680fef3848d47d846edc2362e2302ba6639674cd7cc1'
            '134cb56c82380978baf7035e5400fe15cefef01a1f35cc43cb9bb3735c0dfcba'
            'a10d01bd7117075047a874ec04546284e2abf0937acc90dc474cbd1c4075b1a0')

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
