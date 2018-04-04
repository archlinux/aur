# Maintainer: aeris <aeris+arch@imirhil.fr>
pkgname=ekeyd
pkgver=1.1.4
pkgrel=1
pkgdesc="Daemon and CLI to manager Symtec Entropy Key"
arch=('x86_64')
url="http://www.entropykey.co.uk/"
license=('custom')
depends=(systemd lua51 'lua51-socket>=20171223')
install="${pkgname}.install"
source=(
	"http://www.entropykey.co.uk/res/download/ekeyd-1.1.4.tar.gz"
	"${pkgname}-${pkgver}.patch"
)
b2sums=(
	"7b0c6ed31f73ed559ed0a34325680618d700d069b873e7ebc92dc8d8082c9d03e5ea2d7ddfc2b31e927914a0d2cd130faed97ce07eea4af3005f1499b1fd2d1c"
	"b303e2d73982d43cceb87dcaa1cee7a278bb954911862b3bb5c0bd09aa189d32c7c062b438dc1d3458444660a00bbefef18aeebb491d96470a95c9acb0d625f5"
)

prepare() {
	cd "${pkgname}-${pkgver}"
	patch -p2 -i "${srcdir}/${pkgname}-${pkgver}.patch"
}

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
	rm -r "${pkgdir}/etc/munin" "${pkgdir}/usr/share/munin"
	install -Dm0644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm0644 "udev/debian/60-UDEKEY01.rules" -t "${pkgdir}/usr/lib/udev/rules.d/"
	install -Dm0744 "udev/entropykey.sh" -t "${pkgdir}/usr/lib/udev/"
	install -Dm0644 "${startdir}/${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
}
