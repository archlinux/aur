# Maintainer: Timo Sarawinski <timo@it-kraut.net>
pkgname=ofork
pkgver=10.0.3
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
            'd141ed94ef654b9ae528890823c2584b0dfee69a3645a80a1618c323e135be26'
            '1241b926625e7221ce0e8080cf4d4f9fe4c4adc2bea80d8baa90cd784c0740eb'
            'e82c9406ee379879469543fd7c4fda6877d0637f54e1a2dc760bbf3fb497fd16'
            '710ecc57ba9d2567c20a13250a3be4800402d158f59bf24aba0292d72130820e'
            '6ee62fa4442dde5fc48967c389f46ee99ca31f4e5e700809c830e417bfef6887'
            '4059d4e9b1cd006da98c6b44c5df3dfe7da28f55f5217aee72426e2df5052d70'
            'c88671d505778b883eddbc3b9d207651d47fa155a210c42207d50c7434006ac1'
            '23dcdcef208c07a7ae01750d780d36173c29618eb4012d8fc0f1158eac4fb5df'
            '80d1007dd9aa097d021eb0504ab20b258bb873e477bd6aea78ed464f4325125c'
            '233b537c3a0e6cc6612a4eeb6709aef0dbbf305675a3aa13021e935a7e3bb53c'
            'b5e2d7cb597dd7bebf4c8848de2eac94f02c34affd2cf56b0794b2ae1e2f5945')

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
