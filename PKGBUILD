# Maintainer: Timothée Ravier < tim at siosm dot fr >
# Contributor: Tom < reztho at archlinux dot org >

pkgname=tuned-git
pkgver=2.5.0.r6.ge32bd6b
pkgrel=1
pkgdesc='Daemon that performs monitoring and adaptive configuration of devices in the system'
arch=('any')
url='https://fedorahosted.org/tuned/'
license=('GPL')
depends=('ethtool' 'python2-configobj' 'python2-pyudev' 'python2-gobject2'
         'python2-decorator' 'python2-dbus')
optdepends=('virt-what' 'systemtap')
makedepends=('git')
provides=('tuned')
backup=('etc/tuned/active_profile')
install="${pkgname/-git}.install"
source=("${pkgname}::git://git.fedorahosted.org/git/${pkgname/-/.}")
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

  find "${pkgdir}"/usr/bin/ -type f -exec sed -i 's@#!/usr/bin/python@#!/usr/bin/python2@' {} \;

  install -Dm 0644 "${srcdir}"/${pkgname}/tuned.service "${pkgdir}"/usr/lib/systemd/system/tuned.service
}

# vim:set ts=2 sw=2 et:
