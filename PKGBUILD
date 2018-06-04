# Maintainer: Benjamin Hodgetts <ben@xnode.org>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=xboxdrv-ex-git
pkgver=r1187.fbbb7d8
pkgrel=1
pkgdesc="XBox 360 driver with strong configurability and support for third-party gamepads."
arch=('i686' 'x86_64')
url="http://pingus.seul.org/~grumbel/xboxdrv/"
license=('GPL3')
depends=('libx11' 'dbus-glib' 'libusbx')
makedepends=('git' 'scons' 'boost' 'pkg-config' 'libx11' 'dbus-glib' 'libusb')
provides=('xboxdrv')
conflicts=('xboxdrv')
source=("${pkgname}::git://github.com/xboxdrv/xboxdrv.git" 'xboxdrv.service' 'xboxdrv.conf')
md5sums=('SKIP' '7a4e85c98e16b52836de19673a4370d5' 'c73bb9cf8ff763e7c477366472d19813')

pkgver() {
	cd ${srcdir}/${pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${srcdir}/${pkgname}
	sed "s/'-O3'/'-march=native', '-O3'/g" -i SConstruct
	make PREFIX=/usr
}

package() {
	cd ${srcdir}/${pkgname}
	make PREFIX=/usr DESTDIR="${pkgdir}/" install
	install -D -m644 "${srcdir}/xboxdrv.service" "${pkgdir}/usr/lib/systemd/system/xboxdrv.service"
	install -D -m644 "${srcdir}/xboxdrv.conf" "${pkgdir}/etc/conf.d/xboxdrv"
}
