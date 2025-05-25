# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=joymap
pkgver=0.6.2
pkgrel=1
pkgdesc='A linux userspace device driver that allows joystick events to be remapped.'
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/linuxjoymap'
license=('GPL-2.0-only')
depends=()
makedepends=()
source=(
	"$pkgname-$pkgver.tar.gz::${url}/files/$pkgname-${pkgver}.tar.gz/download"
	"${pkgname}-user.service"
	"${pkgname}-system.service"
	"${pkgname}-sysuser.conf"
	"90-${pkgname}-uinput.rules")
sha256sums=('b03752350e4c1c97b4c578c06b2bae715b153cfe22de006f4555278bf4a23838'
            '427aae12107225ed8e47a2c9ec77539723cce98f340316a08d9d68b0514b78ec'
            'fa6c5cf0a5104fffc5181db5a198554d86ddacc1230c481530ac197e798415e2'
            '1bbbbe0f795adcb11f7284d17b0e67dc6c3d8577f4509f83e64936d99e504fc7'
            '61068aaf6e67b8739acbdc93f44353f4666a00bfd3fae8b50c952a97b7a35ac6')
install="${pkgname}.install"

_srcdir="$pkgname-${pkgver}"

build() {
	cd "${_srcdir}"
	make loadmap reserve_js joymap_blocker.so
}

package() {
	install -Dm644 "${pkgname}-user.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
	install -Dm644 "${pkgname}-system.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -Dm644 "${pkgname}-sysuser.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -Dm644 "90-${pkgname}-uinput.rules" -t "${pkgdir}/usr/lib/udev/rules.d"

	cd "${_srcdir}"
	install -Dm755 'loadmap' "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 'reserve_js' "${pkgdir}/usr/bin/${pkgname}-reserve_js"
	install -Dm755 'joymap_blocker.so' -t "${pkgdir}/usr/lib"
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
	cp -rf 'doc'/* "${pkgdir}/usr/share/doc/${pkgname}"
}
