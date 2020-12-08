# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=fence-agents
pkgver=4.6.0
pkgrel=1
pkgdesc="OCF fence agents for rgmanager and pacemaker"
arch=('i686' 'x86_64')
url='http://clusterlabs.org/'
license=('GPL2')
makedepends=('libxslt' 'python' 'docbook-xsl')
depends=('python-pexpect' 'openwsman' 'python-pycurl' 'python-requests' 'python-boto3' 'python-suds')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ClusterLabs/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('dce8cdfd7b96654bed4140323cfccfdeeef62bb2252097ce9fca1fc9d51123d96925b0923b2b43c38980744688fe0a290af2d9f7fe472e1f4cb6f8ddfbe37e7a')

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

