# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname='dq'
pkgver='20160523'
pkgrel='1'
pkgdesc='Small recursive DNS server and tools with DNSCurve support'
url='https://mojzis.com/software/dq/'
arch=('x86_64' 'i686')
license=('Public Domain')
depends=('bash')
makedepends=('gcc' 'make')
install='dq.install'
source=("${pkgname}-${pkgver}.tar.gz::https://mojzis.com/software/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        root-servers dqcache@.service default.conf dqcache-sysusers.conf dqcache.sh)
sha512sums=('66857b54ea42329df9b583d40de00d1d3886bbb9e0f73679d12365df4a66cbadf1db73fd2bbc2bba4e1eff6af495993ceff23e8fe4897a116ad9b19e80a4dcd0'
            '1444d75a559769044cabca730a11846f14c8db0096a33464fbd90b8c1f363525088b55801ea29554b46906792097ce8a84f1f5e763f018270600408cc9404614'
            '0c19ce8d81bf2bed090e232c338dce466e7ff172f8698f7ecbff59a999a534bc37d2a194d3749a3fea5d3b0c26ff283526861beefd4bef810caa022beff58c5d'
            '1d374937af59ea43237fcdc5089f940c9b97240a22ccc9ad6ea9ece450550dddb82c0bba4f579cf1a89baa184698fa2d7d4f1eee7ce88e070521b55a72c49ec4'
            'ab7fcf301cfcbc1fa70ec6ff914c8b33b8c868e305990351d0dac5d28832a60368af3a79bbd635742583801eb8bf4226aac0c9e478d40c3b180f1d68e946bf0a'
            '709ac3e2553a7a035b46622288857d6b2bcf249f3a568400a3d973ead759a65e286f7717b591dee0bef7374f34a61e1600610f8dc526377f666cdf8440e48462')

build () {
	cd "${srcdir}/${pkgname}-${pkgver//./}"
	echo '/usr/lib/dq' > conf-sbin
	echo '/usr/bin' > conf-bin
	make
}

package () {
	cd "${srcdir}/${pkgname}-${pkgver//./}"
	make install DESTDIR="${pkgdir}"
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
