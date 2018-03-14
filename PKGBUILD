# Maintainer: Michael Corcoran <michael.corcoran@outlook.com>
pkgname=systemd-netlogd
pkgver=1.0
pkgrel=1
pkgdesc="Forwards messages from the journal to other hosts over the network using syslog format RFC 5424 "
arch=('x86_64')
url="https://github.com/systemd/systemd-netlogd"
license=('LGPL')
depends=('libsystemd')
makedepends=('meson')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "systemd-netlogd.sysusers")
md5sums=('eb7c9a9c24ef0b6acb10d9756b62f03c'
         'bfee4a55b61044b0e3a76f13525f3788')

build() {
	arch-meson "${srcdir}/${pkgname}-${pkgver}" build --sysconfdir='/etc/systemd/system'
	ninja -C build
}

check() {
	cd build
	meson test
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install

	mkdir -p "${pkgdir}/usr/lib/systemd/system"

	mv "${pkgdir}/lib/systemd/systemd-netlogd" "${pkgdir}/usr/lib/systemd/"
	rm -r "${pkgdir}/lib"

	mv "${pkgdir}/etc/systemd/system/systemd-netlogd.service" "${pkgdir}/usr/lib/systemd/system"
	mv "${pkgdir}/etc/systemd/system/systemd-netlogd.conf" "${pkgdir}/etc/systemd/system/systemd-netlogd.conf.example"

	install -Dm644 "$srcdir"/systemd-netlogd.sysusers "${pkgdir}/usr/lib/sysusers.d/systemd-netlogd.conf"
}
