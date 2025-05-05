# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=joymap
pkgver=0.5.9
pkgrel=3
pkgdesc='A linux userspace device driver that allows joystick events to be remapped.'
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/linuxjoymap'
license=('GPL-2.0-only')
depends=()
makedepends=()
source=(
	"$pkgname-$pkgver.tar.gz::${url}/files/$pkgname-${pkgver}.tar.gz/download"
	'joymap-user.service'
	'joymap-system.service'
	'joymap-sysuser.conf'
	'90-joymap-uinput.rules'
	"$pkgname-fix-minmax.patch::https://pastebin.com/raw/tgERWNfh")
sha256sums=('a4c178eae4693e51c114b2a1f462bde33b822edb31de2495693be2940b0fd1e7'
            '427aae12107225ed8e47a2c9ec77539723cce98f340316a08d9d68b0514b78ec'
            'fa6c5cf0a5104fffc5181db5a198554d86ddacc1230c481530ac197e798415e2'
            '1bbbbe0f795adcb11f7284d17b0e67dc6c3d8577f4509f83e64936d99e504fc7'
            '61068aaf6e67b8739acbdc93f44353f4666a00bfd3fae8b50c952a97b7a35ac6'
            '42849c9eb249b6ca6bcfe4f72e1fed710f5d609cc024635dee3c3e7bef6270f8')
install='joymap.install'

_srcdir="$pkgname-${pkgver}"

prepare() {
	cd "${_srcdir}"
	patch -p1 -i "${srcdir}/$pkgname-fix-minmax.patch"
}

build() {
	cd "${_srcdir}"
	make loadmap reserve_js joymap_blocker.so
}

package() {
	install -Dm644 'joymap-user.service' "${pkgdir}/usr/lib/systemd/user/joymap.service"
	install -Dm644 'joymap-system.service' "${pkgdir}/usr/lib/systemd/system/joymap.service"
	install -Dm644 'joymap-sysuser.conf' "${pkgdir}/usr/lib/sysusers.d/joymap.conf"
	install -Dm644 '90-joymap-uinput.rules' -t "${pkgdir}/usr/lib/udev/rules.d"

	cd "${_srcdir}"
	install -Dm755 'loadmap' "${pkgdir}/usr/bin/joymap"
	install -Dm755 'reserve_js' "${pkgdir}/usr/bin/joymap-reserve_js"
	install -Dm755 'joymap_blocker.so' -t "${pkgdir}/usr/lib"
}
