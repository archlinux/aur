# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=resource-agents
pkgver=4.1.0
pkgrel=1
pkgdesc="OCF resource agents for rgmanager and pacemaker"
arch=('i686' 'x86_64')
url='http://clusterlabs.org/'
license=('GPL2')
makedepends=('libxslt' 'python' 'docbook-xsl')
depends=('bash' 'perl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ClusterLabs/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('b094238ef7fd65ff8a28611da5a3be97aa599796a8efd2771acecf1e82840a8484e871fb4ef0d1ae5f8009a06196056ba7d93ebab271cb3c9288a60b5934c695')

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
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
  rm -fr "${pkgdir}/var"
  rm -fr "${pkgdir}/etc/init.d"
  install -Dm644 /dev/null "${pkgdir}/usr/lib/tmpfiles.d/resource-agents.conf"
  ( echo "# /usr/lib/tmpfiles.d/resource-agents.conf"
    echo "d /run/resource-agents 0755 root root -"
    echo "d /var/log/cluster 0755 root root 30d"
  )>>"${pkgdir}/usr/lib/tmpfiles.d/resource-agents.conf"
}

# vim: set sw=2 et:

