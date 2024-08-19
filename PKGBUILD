# Maintainer: omgold@aur
# Contibutor: Brian Bidulock <bidulock@openss7.org>

pkgname=resource-agents
pkgver=4.15.1
pkgrel=1
pkgdesc="OCF resource agents for rgmanager and pacemaker"
arch=('x86_64')
url='http://clusterlabs.org/'
license=('GPL2')
makedepends=('libxslt' 'python' 'docbook-xsl' 'libqb')
depends=('perl')
optdepends=('pacemaker: for these to be useful'
            'python: for azure-events')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ClusterLabs/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('cc91cf9f4d277f226522782116b4e2ac643d1f23093ce65c4c98a7e0f5c67c25')

prepare() {
  cd $pkgname-$pkgver
  sed -i -e '/^ExecStartPost=/s,^,#,;/^ExecStopPost=/s,^,#,' \
      ldirectord/systemd/ldirectord.service.in
  sed -i -e '/size=%zu/s,devsize,(size_t)devsize,' \
      tools/storage_mon.c
  sed -i -e '/read %ld bytes/s,sizeof,(long)sizeof,' \
      tools/storage_mon.c
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
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
  rm -fr "${pkgdir}/var"
  rm -fr "${pkgdir}/etc/init.d"
  install -Dm644 /dev/null "${pkgdir}/usr/lib/tmpfiles.d/resource-agents.conf"
  ( echo "# /usr/lib/tmpfiles.d/resource-agents.conf"
    echo "d /var/lib/heartbeat/fifo 0755 root root -"
    echo "d /run/resource-agents 0755 root root -"
    echo "d /run/heartbeat/rsctmp 0755 root root -"
  )>>"${pkgdir}/usr/lib/tmpfiles.d/resource-agents.conf"
}

# vim: set sw=2 et:

