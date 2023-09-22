# Maintainer: khvalera <khvalera[at]ukr[dot]net>

pkgname=glpi-agent
pkgver=1.5
pkgrel=3
pkgdesc="GLPI Agent"
arch=('any')
url='https://www.glpi-project.org'
source=("https://github.com/glpi-project/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
        "fix-serial-number.patch")
license=('GPL2')
makedepends=("make" "perl-module-install" "perl-test-simple" "perl-test-deep" "perl-test-exception" "perl-test-mockmodule" "perl-test-mockobject" "perl-test-compile")
depends=( "perl-cpanel-json-xs" "perl-datetime" "perl-file-which" "perl-data-uuid" "perl-file-copy-recursive" "perl-http-server-simple"
          "perl-io-socket-ssl" "perl-xml-xpath" "perl-text-template" "perl-parallel-forkmanager" "perl-ipc-run" "perl-edid"
          "perl-net-snmp" "perl-net-ip" "perl-lwp-protocol-https" "perl-http-proxy" "perl-yaml-tiny"
          "perl-http-server-simple-authen" "perl-io-capture" "perl-xml-treepp" "perl-universal-require"
          "perl-xml-libxml")
sha256sums=('bbbc700d51a9d28a265af55a70213f00c8340e3dfd993750e1ac6bdd65fb1c5b'
            'd9aaa2915b9218b9d001017ed95046967de34c0e2be6506eea6f695edc934e3a')

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
prepare() {
   cd "$srcdir/${pkgname}-${pkgver}"

   patch --forward --strip=1 --input="../fix-serial-number.patch"
}

#=========================================
build() {
   cd "$srcdir/${pkgname}-${pkgver}"

   perl Makefile.PL PREFIX=/usr SYSCONFDIR=/etc/glpi-agent LOCALSTATEDIR=/var/lib/glpi-agent
   make
}

#=========================================
check() {
   cd "$srcdir/${pkgname}-${pkgver}"

   #make test
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
