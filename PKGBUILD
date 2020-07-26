# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=bandwidthd
_repouser=post-factum
_reponame=bandwidthd
pkgver=2.0.4
pkgrel=1
epoch=1
pkgdesc="Daemon for graphing traffic of subnet machines"
arch=(x86_64)
url="https://gitlab.com/post-factum/bandwidthd"
license=(GPL)
depends=(sqlite libpcap libpng gd nginx)

source=(${pkgname}-${pkgver}.tar.bz2::https://gitlab.com/${_repouser}/${_reponame}/-/archive/v${pkgver}/${_reponame}-v${pkgver}.tar.bz2)

sha256sums=('48ab79e81dcde5a5aeaab6ffe262c0d51c8739c7773d4dd9fa503d0f122e1e80')

backup=('etc/bandwidthd/bandwidthd.conf'
		'etc/bandwidthd/bandwidthd-webui.conf')

prepare () {
	cd "${_reponame}-v${pkgver}"

	autoreconf

	CFLAGS="-std=gnu89 -march=x86-64 -mtune=generic -O2 -pipe -fno-plt" ./configure \
		--prefix=/usr \
		--sysconfdir=/etc/bandwidthd \
		--localstatedir=/var/lib \
		--without-x
}

build() {
	cd "${_reponame}-v${pkgver}"
}

package() {
	cd "${_reponame}-v${pkgver}"

	install -dm700 "${pkgdir}/var/lib/bandwidthd"

	make DESTDIR="${pkgdir}" install

	install -Dm644 "etc/bandwidthd.service" -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm644 "etc/bandwidthd-webui.service" -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm644 "etc/bandwidthd-webui.conf" -t "${pkgdir}/etc/bandwidthd"
	install -Dm644 "etc/bandwidthd-rotate.timer" -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm644 "etc/bandwidthd-rotate.service" -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm644 "etc/bandwidthd.sysusers" "${pkgdir}/usr/lib/sysusers.d/bandwidthd.conf"
	install -Dm644 "etc/bandwidthd.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/bandwidthd.conf"
}

# vim: set tabstop=4:softtabstop=4:shiftwidth=4:noexpandtab
