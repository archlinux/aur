# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname=dq
pkgver=20220822
pkgrel=6
pkgdesc='Small recursive DNS server and tools with DNSCurve support'
url=https://mojzis.com/software/dq/
arch=(x86_64 i686)
license=('custom:Public Domain')
depends=(glibc)
install=dq.install
source=("https://github.com/janmojzis/dq/archive/${pkgver}.tar.gz"
        root-servers dqcache@.service default.conf dqcache-sysusers.conf)
sha512sums=('a743fc87b1db741b6348e1ebc30728963b239afe2629127d342608e0b80c96b8c8a70bb45edb29ad54297c5064ce821ebea697e2a13a5a581e8797f7b7dd01e3'
            '1444d75a559769044cabca730a11846f14c8db0096a33464fbd90b8c1f363525088b55801ea29554b46906792097ce8a84f1f5e763f018270600408cc9404614'
            'aa93087abdb63a5b0a4e9a4441add6f1bae661674ae1214397720fcd8badbf12d6ca5cdf819c53b28c50075e36d4b53ad6d9f347b0a612db78fd60ed90e5c6c8'
            '8b9b8510d77e831a0faca238b9fafbf9f5856dd38eff061cdc1b9194ee94f0ec366650f4f1b20884ac09f710379079a090adcb26baeb7e164266beb0e4436fa4'
            'ab7fcf301cfcbc1fa70ec6ff914c8b33b8c868e305990351d0dac5d28832a60368af3a79bbd635742583801eb8bf4226aac0c9e478d40c3b180f1d68e946bf0a')

build () {
	cd "${pkgname}-${pkgver}"
	make
}

package () {
	cd "${pkgname}-${pkgver}"
	make install DESTDIR="${pkgdir}"

	for num in 1 8 ; do
		install -m 644 -D -t "${pkgdir}/usr/share/man/man${num}" man/*.${num}
	done

	mv "${pkgdir}/usr/sbin"/* "${pkgdir}/usr/bin"
	rmdir "${pkgdir}/usr/sbin"

	install -m 644 -D LICENCE.md \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENCE.md"

	install -m 755 -d "${srcdir}/etc/dqcache/default/dump"

	install -m 644 -D "${srcdir}/default.conf" \
		"${pkgdir}/etc/dqcache/default.conf"
	install -m 644 -D "${srcdir}/root-servers" \
		"${pkgdir}/etc/dqcache/default/servers/@"
        install -m 644 -D "${srcdir}/dqcache@.service" \
		"${pkgdir}/usr/lib/systemd/system/dqcache@.service"
	install -m 644 -D "${srcdir}/dqcache-sysusers.conf" \
		"${pkgdir}/usr/lib/sysusers.d/dqcache.conf"
}
