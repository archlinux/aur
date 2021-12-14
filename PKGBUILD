# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=resource-agents
pkgver=4.10.0
pkgrel=1
pkgdesc="OCF resource agents for rgmanager and pacemaker"
arch=('i686' 'x86_64')
url='http://clusterlabs.org/'
license=('GPL2')
makedepends=('libxslt' 'python' 'docbook-xsl')
depends=('bash' 'perl')
optdepends=('pacemaker: for these to be useful'
            'python: for azure-events')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ClusterLabs/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('f32b1b45f6c51ddd7e87b438c776a0a7f7d23cf4af2531ea921f4811bebfff9e32f702234bf12056590f8c5745b53ec1d3d06a4e38a6f69653752779627d197c')

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

