# Maintainer: Wes Jackson < icebal dot 7 at gmail dot com >
# Contributor: Tom < reztho at archlinux dot org >

pkgname=tuned-git
pkgver=v2.10.0.r40.gb9e1316
pkgrel=1
pkgdesc='Daemon that performs monitoring and adaptive configuration of devices in the system'
arch=('any')
url='https://github.com/redhat-performance/tuned'
license=('GPL')
depends=('ethtool' 'python-configobj' 'python-pyudev' 'python-gobject2'
         'python-decorator' 'python-dbus' 'python-dmidecode')
optdepends=('virt-what' 'systemtap')
makedepends=('git')
provides=('tuned')
backup=('etc/tuned/active_profile')
install="${pkgname/-git}.install"
source=("${pkgname}::git://github.com/redhat-performance/tuned")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  local ver=$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
  printf "%s\n" "${ver:1}"
}

package() {
  cd ${pkgname}

  make DESTDIR="${pkgdir}" install

  mv "${pkgdir}"/usr/sbin/* "${pkgdir}"/usr/bin/
  mv "${pkgdir}"/usr/libexec/tuned/* "${pkgdir}"/usr/lib/tuned/
  rm -r "${pkgdir}"/run "${pkgdir}"/usr/sbin "${pkgdir}"/usr/libexec
  install -Dm 0644 "${srcdir}"/${pkgname}/tuned.service "${pkgdir}"/usr/lib/systemd/system/tuned.service
}

# vim:set ts=2 sw=2 et:
