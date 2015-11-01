# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Alex Merry <dev@randomguy3.me.uk>

set -u
pkgname='ipwatchd'
pkgver='1.2.1'
pkgrel='1'
pkgdesc='IP conflict detection daemon'
arch=('i686' 'x86_64')
url='http://ipwatchd.sourceforge.net/'
license=('GPL')
depends=('libpcap' 'libnet')
optdepends=('ipwatchd-gnotify: provide conflict notifications to the GNOME desktop environment')
backup=('etc/ipwatchd.conf')
_verwatch=("http://sourceforge.net/projects/ipwatchd/files/${pkgname}/" '.*href="'"/projects/ipwatchd/files/${pkgname}/\([^/]\+\)/"'".*' 'f')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'ipwatchd.service')
sha256sums=('f20d0f0ee956112a25fc7ecdb10e7b4277d0842b48d194ac8552373e29087646'
            '2fbf3937bcab45adce253fb5aea31f93064748e9b8b5023e8ec25a6245380fd6')

prepare() {
  set -u
  cd "${pkgname}-${pkgver}/src"
  sed -i -e 's:/sbin:/bin:g' 'Makefile' 'ipwatchd.conf' scripts/*
  set +u
}

build() {
  set -u
  cd "${pkgname}-${pkgver}/src"

  make
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}/src"

  make DESTDIR="${pkgdir}/" install
  rm -rf "${pkgdir}/etc/init.d"

  install -Dpm644 "${srcdir}/ipwatchd.service" -t "${pkgdir}/usr/lib/systemd/system/"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
