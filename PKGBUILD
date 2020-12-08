# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=resource-agents-git
_pkgname=resource-agents
pkgver=4.7.0rc1.r4.gef4ec184f
pkgrel=1
pkgdesc="OCF resource agents for rgmanager and pacemaker"
arch=('i686' 'x86_64')
url='http://clusterlabs.org/'
license=('GPL2')
makedepends=('git' 'libxslt' 'python' 'docbook-xsl')
depends=('bash' 'perl')
optdepends=('pacemaker-git: for these to be useful'
            'python: for dummypy and azure-events scripts')
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
  sed -i -e '/^ExecStartPost=/s,^,#,;/^ExecStopPost=/s,^,#,' \
      ldirectord/systemd/ldirectord.service.in
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
              --with-systemdsystemunitdir=/usr/lib/systemd/system
  make V=0
}

package() {
  cd $pkgname
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
