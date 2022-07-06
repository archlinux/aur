# Maintainer: khvalera <khvalera[at]ukr[dot]net>

pkgname=glpi-agent
pkgver=1.4
pkgrel=2
pkgdesc="GLPI Agent"
arch=('any')
url='https://www.glpi-project.org'
source=("https://github.com/glpi-project/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
license=('GPL2')
makedepends=("make" "perl-module-install")
depends=( "perl-test-simple" "perl-cpanel-json-xs" "perl-datetime" "perl-file-which" "perl-data-uuid" "perl-file-copy-recursive" "perl-http-server-simple"
          "perl-io-socket-ssl" "perl-xml-xpath" "perl-text-template" "perl-test-deep" "perl-parallel-forkmanager" "perl-ipc-run"
          "perl-test-exception" "perl-net-snmp" "perl-net-ip" "perl-lwp-protocol-https" "perl-test-mockmodule" "perl-http-proxy"
          "perl-http-server-simple-authen" "perl-io-capture" "perl-test-mockobject" "perl-xml-treepp" "perl-test-compile" "perl-universal-require")
sha256sums=('d1ea1230c06ae4a410487e33ae6a85dcf4278af87de831f8a602e4bf0a0c0663')

backup=("etc/glpi-agent/agent.cfg"
        "etc/glpi-agent/inventory-server-plugin.cfg"
        "etc/glpi-agent/server-test-plugin.cfg"
        "etc/glpi-agent/ssl-server-plugin.cfg"
        "etc/glpi-agent/proxy-server-plugin.cfg"
        "etc/glpi-agent/proxy2-server-plugin.cfg"
        "etc/glpi-agent/toolbox-plugin.cfg"
        "usr/share/glpi-agent/pci.ids"
        "usr/share/glpi-agent/usb.ids")

#=========================================
build() {
   cd "$srcdir/${pkgname}-${pkgver}"

   perl Makefile.PL PREFIX=/usr SYSCONFDIR=/etc/glpi-agent LOCALSTATEDIR=/var/lib/glpi-agent
   make
}

#=========================================
check() {
   cd "$srcdir/${pkgname}-${pkgver}"

   make test
}

#=========================================
package() {
   cd "$srcdir/${pkgname}-${pkgver}"

   make DESTDIR="$pkgdir" install
   install -d "${pkgdir}/var/lib/glpi-agent"
   install -d "${pkgdir}/etc/glpi-agent/conf.d"
   install -d "${pkgdir}/usr/lib/systemd/system"
   install -Dm644 contrib/unix/glpi-agent.service "${pkgdir}/usr/lib/systemd/system/glpi-agent.service"
   install -d "${pkgdir}/usr/share/licenses/${pkgname}"
   install -Dm644 {LICENSE,README.*,THANKS} "${pkgdir}/usr/share/licenses/${pkgname}/"
}
