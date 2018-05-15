# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=resource-agents
pkgver=4.1.1
pkgrel=3
pkgdesc="OCF resource agents for rgmanager and pacemaker"
arch=('i686' 'x86_64')
url='http://clusterlabs.org/'
license=('GPL2')
makedepends=('libxslt' 'python' 'docbook-xsl')
depends=('bash' 'perl')
optdepends=('pacemaker: for these to be useful')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ClusterLabs/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('be34ac83d3fe49beabff647d23cf420356c6708f0acd8f1b51e4362e30d02adf2adadbd69bd24f300a9ded736c3884d4780d8221506ea1d35f12060470afdb56')

prepare() {
  cd $pkgname-$pkgver
  sed -i -e '/^ExecStartPost=/s,^,#,;/^ExecStopPost=/s,^,#,' \
      ldirectord/systemd/ldirectord.service.in
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
              --with-systemdsystemunitdir=/usr/lib/systemd/system
  make V=0
}

package() {
  local _var_dirs= _run_dirs=

  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
  rm -fr "${pkgdir}/var"
  rm -fr "${pkgdir}/etc/init.d"
  install -Dm644 /dev/null "${pkgdir}/usr/lib/tmpfiles.d/resource-agents.conf"
  ( echo "# /usr/lib/tmpfiles.d/resource-agents.conf"
    echo "d /var/lib/heartbeat/fifo 0755 root root -"
    echo "# corosync installs this one"
    echo "#d /var/log/cluster 0755 root root -"
    echo "d /run/resource-agents 0755 root root -"
    echo "d /run/heartbeat/rsctmp 0755 root root -"
  )>>"${pkgdir}/usr/lib/tmpfiles.d/resource-agents.conf"
}

# vim: set sw=2 et:

