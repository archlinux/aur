# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
pkgname=atvclient-git
pkgver=r11.9921269
pkgrel=1
pkgdesc="Background application implementing the functionality of the AppleTV OS HID driver"
arch=('i686' 'x86_64')
url="http://wiki.github.com/Evinyatar/atvclient/"
license=('GPL2')
depends=('libusb-compat')
provides=('atvclient')
conflicts=('atvclient-git')
makedepends=('git')
source=("atvclient::git+https://github.com/Evinyatar/atvclient.git"
	"atvclient.service"
	"atvclient.conf")
md5sums=("SKIP"
	 "f010c482079177fa8c2f22d87f0972b8"
	 "9e5b14fb17b47d0e203fbd08473e9d76")

changelog=$pkgname.changelog
install=$pkgname.install

pkgver() {
  cd "${srcdir}/atvclient"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/atvclient"
	autoreconf
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
	make
}

package() {
	cd "${srcdir}/atvclient"
	make install DESTDIR="${pkgdir}"
	install -Dm 755 "${pkgdir}/usr/sbin/atvclient" "${pkgdir}/usr/bin/atvclient"
	rm -r "${pkgdir}/usr/sbin"
	install -Dm 644 "${srcdir}/atvclient.service" "${pkgdir}/usr/lib/systemd/system/atvclient.service"
	install -Dm 644 "${srcdir}/atvclient.conf" "${pkgdir}/etc/conf.d/atvclient.conf"
	install -d "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "${srcdir}/atvclient/AUTHORS" "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "${srcdir}/atvclient/NEWS" "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "${srcdir}/atvclient/README" "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "${srcdir}/atvclient/COPYING" "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "${srcdir}/atvclient/ChangeLog" "${pkgdir}/usr/share/doc/${pkgname}/"
}
