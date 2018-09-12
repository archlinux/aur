# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Alex Merry <dev@randomguy3.me.uk>

#   systemctl enable ipwatchd.service
#   systemctl start ipwatchd.service
# To see syslog notifications:
#   systemctl status ipwatchd.service

# Test by adding in-use IP to another computer
#   ip addr add 192.168.1.2/24 dev eno1
# Then ping to generate traffic from that dup address
#   ping -I 192.168.1.2 192.168.1.1

set -u
pkgname='ipwatchd'
pkgver='1.3.0'
pkgrel='1'
pkgdesc='IP conflict detection daemon'
arch=('i686' 'x86_64')
url='http://ipwatchd.sourceforge.net/'
license=('GPL')
depends=('libpcap' 'libnet')
optdepends=('ipwatchd-gnotify: provide conflict notifications to the GNOME desktop environment')
backup=('etc/ipwatchd.conf')
_verwatch=("https://sourceforge.net/projects/ipwatchd/rss" "\s\+<title><!\[CDATA[/${pkgname}/[0-9.]\+/${pkgname}-\([0-9\.]\+\)\.tar\.gz\].*" 'f')
_srcdir="${pkgname}-${pkgver}/src"
source=("https://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a8fbdd39f98e652b7ec34a4b6a894bbbcd2b8012cf3c35ef21fa37286fbf8efb')

prepare() {
  set -u
  cd "${_srcdir}"
  sed -e 's:/sbin:/bin:g' -i 'Makefile' 'ipwatchd.conf' 'ipwatchd.service' # scripts/*
  # This should be done with install -Dp ... -t
  sed -e 's:^\tcp\b:& -p:' \
      -e '# fix placement of service' \
      -e 's:(DESTDIR)/lib/systemd:(DESTDIR)/usr/lib/systemd:g' \
    -i 'Makefile'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make DESTDIR="${pkgdir}/" install
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
