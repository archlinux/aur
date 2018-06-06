# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=fence-agents
pkgver=4.2.1
pkgrel=1
pkgdesc="OCF fence agents for rgmanager and pacemaker"
arch=('i686' 'x86_64')
url='http://clusterlabs.org/'
license=('GPL2')
makedepends=('libxslt' 'python' 'docbook-xsl')
depends=('python-pexpect' 'openwsman' 'python-pycurl' 'python-requests' 'python-boto3' 'python-suds')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ClusterLabs/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('1de82a66b92fd585b4349e6881328614e4cd85013fd8db5fe2fee72efb7a5850ad96de9f177de977d6c7ccbdf6c76a8659e4e0f092c0ee36463d681effabfa43')

prepare() {
  cd $pkgname-$pkgver
  ./autogen.sh
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
              --bindir=/usr/bin \
              --sbindir=/usr/bin \
              --libdir=/usr/lib \
              --libexecdir=/usr/lib \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --with-systemdsystemunitdir=/usr/lib/systemd/system \
              --with-agents="alom amt amt_ws apc apc_snmp aws azure_arm bladecenter brocade cisco_mds cisco_ucs compute docker drac dummy eaton_snmp emerson eps evacuate hds_cb heuristics_ping hpblade ibmblade ifmib ilo ilo_moonshot ilo_mp ilo_ssh intelmodular ipdu ipmilan ironic kdump ldom lpar manual mpath netio ovh powerman pve raritan rcd_serial rhevm rsa rsb sanbox2 sbd scsi vbox virsh vmware vmware_rest vmware_soap vmware_vcloud wti xenapi zvm"
  make V=0
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
  rm -fr "${pkgdir}/var"
  rm -fr "${pkgdir}/etc/init.d"
  install -Dm644 /dev/null "${pkgdir}/usr/lib/tmpfiles.d/fence-agents.conf"
  ( echo "# /usr/lib/tmpfiles.d/fence-agents.conf"
    echo "d /run/fence-agents 0755 root root -"
  )>>"${pkgdir}/usr/lib/tmpfiles.d/fence-agents.conf"
}

# vim: set sw=2 et:

