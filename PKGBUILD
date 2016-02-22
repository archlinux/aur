# Contributor: Larry Hajali <larryhaja [at] gmail [dot] com>

pkgname=ndjbdns
pkgver=1.06
pkgrel=2
pkgdesc="ndjbdns is a fork of djbdns"
arch=('i686' 'x86_64')
url="http://pjp.dgplug.org/ndjbdns/"
license=('GPL2')
depends=('systemd')
source=("http://pjp.dgplug.org/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'arch-systemd-bin-directory.patch')
sha256sums=('5ce5a7c5031f220a85fc8bca903f2d3cf484ff77e4c85e7144a0e2a5922a1127'
            '437486cdedac54600ef5152d1ccb6fedd6b8df785b6880805b1762d70287d9c7')

build()
{
  cd ${pkgname}-${pkgver}

  ### Make sure root servers file is up to date.
  _root_servers=$(curl -s http://www.internic.net/domain/named.root | grep ' A ' | awk '{print $4}')
  if [ "${_root_servers}" != "" ]; then
    echo ${_root_servers} | tr ' ' '\n' > etc/servers/dnsroots.global
  fi

  # Fix sbin directory in systemd files.
  patch -p1 < "${srcdir}"/arch-systemd-bin-directory.patch

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --disable-silent-rules
  make
}

package()
{
  cd ${pkgname}-${pkgver}
  make install DESTDIR="${pkgdir}"
}
