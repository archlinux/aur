# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=fence-agents-git
_pkgname=fence-agents
pkgver=4.6.0.r28.g17bd8552
pkgrel=1
pkgdesc="OCF fence agents for rgmanager and pacemaker"
arch=('i686' 'x86_64')
url='http://clusterlabs.org/'
license=('GPL2')
makedepends=('git' 'libxslt' 'python' 'docbook-xsl')
depends=('python-pexpect' 'openwsman' 'python-pycurl' 'python-requests' 'python-boto3' 'python-suds')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")
source=("$pkgname::git+https://github.com/ClusterLabs/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long|sed -E 's,^[^0-9]*,,;s,-([0-9]*),.r\1,;s,-,.,g'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
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
  cd $pkgname
  make DESTDIR="${pkgdir}" install
  rm -fr "${pkgdir}/var"
  rm -fr "${pkgdir}/etc/init.d"
  install -Dm644 /dev/null "${pkgdir}/usr/lib/tmpfiles.d/fence-agents.conf"
  ( echo "# /usr/lib/tmpfiles.d/fence-agents.conf"
    echo "d /run/fence-agents 0755 root root -"
  )>>"${pkgdir}/usr/lib/tmpfiles.d/fence-agents.conf"
}

# vim: set sw=2 et:
