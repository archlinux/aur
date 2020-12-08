# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=resource-agents
pkgver=4.7.0rc1
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
sha512sums=('7463031746c7a676729aaa18af11553f5ddb19287636a624a9b0d6ca0d6baffdb580b5fa6d4c01a5473bad7fb1c5cd45a094cd539129500deb4d52a20158540d')

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
    echo "d /run/resource-agents 0755 root root -"
    echo "d /run/heartbeat/rsctmp 0755 root root -"
  )>>"${pkgdir}/usr/lib/tmpfiles.d/resource-agents.conf"
}

# vim: set sw=2 et:

