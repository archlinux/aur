# Maintainer: graysky <graysky AT archlinux DOT org>

pkgname=man-db-systemd
pkgver=1.00
pkgrel=1
pkgdesc="Systemd timer to rebuild man-db cache and speed up pacman install operations"
arch=('any')
url="http://github.com/graysky2/man-db-systemd"
license=('MIT')
depends=('systemd' 'man-db')
optdepends=('gzip')
install=${pkgname}.install
source=(https://github.com/graysky2/${pkgname}/archive/v1.00.tar.gz)
sha256sums=('1cf69d78295c2898cc57fbc67164b6e05a90eebf4e919ad8daf0b2004fbe06c9')


package() {
  cd ${pkgname}-${pkgver}

	# mute pacman hook for man-db
	install -dm755 ${pkgdir}/etc/pacman.d/hooks
	ln -s /dev/null ${pkgdir}/etc/pacman.d/hooks/man-db.hook

  # install man-db update timer
  install -Dm644 man-db.timer ${pkgdir}/usr/lib/systemd/system/man-db.timer
  install -Dm644 man-db.service ${pkgdir}/usr/lib/systemd/system/man-db.service

	# enable timer by default
  install -dm755 ${pkgdir}/usr/lib/systemd/system/multi-user.target.wants
  ln -s ../man-db.timer ${pkgdir}//usr/lib/systemd/system/multi-user.target.wants/man-db.timer
}
