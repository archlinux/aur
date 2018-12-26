# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname='dq'
pkgver='20181021'
pkgrel='1'
pkgdesc='Small recursive DNS server and tools with DNSCurve support'
url='https://mojzis.com/software/dq/'
arch=('x86_64' 'i686')
license=('custom:Public Domain')
depends=('bash')
makedepends=('gcc' 'make')
install='dq.install'
validpgpkeys=('AADF2EDF5529F1702772C8A2DEC4D246931EF49B')
source=("https://github.com/janmojzis/dq/archive/${pkgver}.tar.gz"
		"https://github.com/janmojzis/dq/releases/download/${pkgver}/${pkgver}.tar.gz.asc"
        root-servers dqcache@.service default.conf dqcache-sysusers.conf dqcache.sh)
sha512sums=('2f59b96e08dc452ee0db2b5e6f9546a6c279d125cbc85052ed2ae3b7fabb43067d41610d27dcb226dac1229c957e71678ee10c733498e680fabb1a47f89d0363'
            'SKIP'
            '1444d75a559769044cabca730a11846f14c8db0096a33464fbd90b8c1f363525088b55801ea29554b46906792097ce8a84f1f5e763f018270600408cc9404614'
            '0c19ce8d81bf2bed090e232c338dce466e7ff172f8698f7ecbff59a999a534bc37d2a194d3749a3fea5d3b0c26ff283526861beefd4bef810caa022beff58c5d'
            '1d374937af59ea43237fcdc5089f940c9b97240a22ccc9ad6ea9ece450550dddb82c0bba4f579cf1a89baa184698fa2d7d4f1eee7ce88e070521b55a72c49ec4'
            'ab7fcf301cfcbc1fa70ec6ff914c8b33b8c868e305990351d0dac5d28832a60368af3a79bbd635742583801eb8bf4226aac0c9e478d40c3b180f1d68e946bf0a'
            '709ac3e2553a7a035b46622288857d6b2bcf249f3a568400a3d973ead759a65e286f7717b591dee0bef7374f34a61e1600610f8dc526377f666cdf8440e48462')

build () {
	cd "${pkgname}-${pkgver}"
	echo '/usr/bin' > conf-sbin
	echo '/usr/bin' > conf-bin
	make
}

package () {
	cd "${pkgname}-${pkgver}"
	make install DESTDIR="${pkgdir}"

	install -m 755 -d "${pkgdir}/usr/lib/dq"
	mv "${pkgdir}/usr/bin/dqcache" "${pkgdir}/usr/lib/dq/"

	# Manpages are no installed by "make install"
	install -m 644 -D man/dq.1 \
		"${pkgdir}/usr/share/man/man1/dq.1"
	install -m 644 -D man/dqcache-makekey.1 \
		"${pkgdir}/usr/share/man/man1/dqcache-makekey.1"
	install -m 644 -D man/dqcache.8 \
		"${pkgdir}/usr/share/man/man8/dqcache.8"

	install -m 644 -D LICENCE.md \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENCE.md"

	install -m 755 -D "${srcdir}/dqcache.sh" \
		"${pkgdir}/usr/bin/dqcache"
	install -m 644 -D "${srcdir}/default.conf" \
		"${pkgdir}/etc/dqcache/default.conf"
	install -m 644 -D "${srcdir}/root-servers" \
		"${pkgdir}/etc/dqcache/default/servers/@"
        install -m 644 -D "${srcdir}/dqcache@.service" \
		"${pkgdir}/usr/lib/systemd/system/dqcache@.service"
	install -m 644 -D "${srcdir}/dqcache-sysusers.conf" \
		"${pkgdir}/usr/lib/sysusers.d/dqcache.conf"
}
