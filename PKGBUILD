# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname='dq'
pkgver='20181021'
pkgrel='2'
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
            'ab2e577ca9c18afee40704593119f3b10d21eb5c4cb5c77d7d7e8652687213f2bf67491aed4c0b4c194251f17909502b965e566dfbde64b052dde9dc0b8343f6'
            'ab7fcf301cfcbc1fa70ec6ff914c8b33b8c868e305990351d0dac5d28832a60368af3a79bbd635742583801eb8bf4226aac0c9e478d40c3b180f1d68e946bf0a'
            'f63008d6e50011a76ef5b7372ae01ef33eac598adc310d2d09980089510720d23767534694179014fc9e9e3a5f9473cb60dd4af3e3fa92616912003b1bd7cbb5')

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

	# Do not ship dqcache-start; the supplied systemd unit has its own
	# wrapper program.
	rm "${pkgdir}/usr/bin/dqcache-start" \
	   "${pkgdir}/usr/share/man/man1/dqcache-start.1"

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
