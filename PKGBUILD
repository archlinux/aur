# Contributor: Larry Hajali <larryhaja [at] gmail [dot] com>

pkgname=ndjbdns
pkgver=1.06
pkgrel=1
pkgdesc="ndjbdns is a fork of djbdns"
arch=('i686' 'x86_64')
url="http://pjp.dgplug.org/ndjbdns/"
license=('GPL2')
depends=('systemd')
source=("http://pjp.dgplug.org/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('6996f803bb6c6fed5a02ad45690d62ad')

build()
{
  cd ${pkgname}-${pkgver}

  ### Make sure root servers file is up to date.
  _root_servers=$(curl -s http://www.internic.net/domain/named.root | grep ' A ' | awk '{print $4}')
  if [ "${_root_servers}" != "" ]; then
    echo ${_root_servers} | tr ' ' '\n' > etc/servers/dnsroots.global
  fi

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-silent-rules
  make
}

package()
{
  cd ${pkgname}-${pkgver}
  make install DESTDIR="${pkgdir}"
}
