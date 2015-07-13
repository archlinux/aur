# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: Tom Kuther <archlinux@kuther.net>
# Contributor: N30N <archlinux@alunamation.com>
# Contributor: Aerion <this.id.was.still.free@aerion.co.uk>

pkgname=keyfuzz
pkgver=0.2
pkgrel=9
pkgdesc="A Utility for manipulating the scancode/keycode translation tables of keyboard drivers"
url="http://0pointer.de/lennart/projects/keyfuzz/"
license="GPL2"
arch=("i686" "x86_64")
depends=()
makedepends=("lynx")

# original source is down since 2014/08. It's small, so pack it in the aurball...
#source=("${url}${pkgname}-${pkgver}.tar.gz"
source=("${pkgname}-${pkgver}.tar.gz"
	"${pkgname}.systemd"
	"logitech_media_keyboard_600.keyfuzz"
	"support_by_id.patch")
sha256sums=('d3cea89fc0a66e37026a947263f85f2075dbabda017ad60bf3d6a1bb63f56977'
         '231fb0c51d4a0f9d018d84851486c669a0c9a42debf08ce1d27beefcf91e29b3'
         'de089c3769996398816f38ce68474be712e15a62a547f7f0e0f44842f7eb0c74'
         '5e1d8910f66053f269576e1fab94592e4df4e452a1a78153253b9df0fc8a129a')

build() {
	cd "${pkgname}-${pkgver}"
	patch -p0 < $srcdir/support_by_id.patch
	./configure --prefix=/usr \
		--with-initdir=/usr/lib/systemd/scripts \
		--sysconfdir=/etc \
		--sbindir=/usr/bin \
		--mandir=/usr/share/man
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -D -m644 ${srcdir}/keyfuzz.systemd "${pkgdir}/usr/lib/systemd/system/keyfuzz.service"
	install -D -m644 ${srcdir}/logitech_media_keyboard_600.keyfuzz "${pkgdir}/etc/keyfuzz/logitech_media_keyboard_600.keyfuzz"
}

# vim: set noet ff=unix:
