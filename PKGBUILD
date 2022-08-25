# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname=dq
pkgver=20220822
pkgrel=1
pkgdesc='Small recursive DNS server and tools with DNSCurve support'
url=https://mojzis.com/software/dq/
arch=(x86_64 i686)
license=('custom:Public Domain')
depends=(bash)
install=dq.install
validpgpkeys=(AADF2EDF5529F1702772C8A2DEC4D246931EF49B)
source=("https://github.com/janmojzis/dq/archive/${pkgver}.tar.gz"
		"https://github.com/janmojzis/dq/releases/download/${pkgver}/${pkgver}.tar.gz.asc"
        root-servers dqcache@.service default.conf dqcache-sysusers.conf dqcache.sh)
sha512sums=('a743fc87b1db741b6348e1ebc30728963b239afe2629127d342608e0b80c96b8c8a70bb45edb29ad54297c5064ce821ebea697e2a13a5a581e8797f7b7dd01e3'
            'SKIP'
            '1444d75a559769044cabca730a11846f14c8db0096a33464fbd90b8c1f363525088b55801ea29554b46906792097ce8a84f1f5e763f018270600408cc9404614'
            '26793bbf5d0f2e7e153da763f36ec5962fded33e486b0aeaa0594c6570e79aaba36262f6c7cc7b3ab5ba5e3dda4be7fc54f957b9255161f6021b3797a6227d5f'
            '8b9b8510d77e831a0faca238b9fafbf9f5856dd38eff061cdc1b9194ee94f0ec366650f4f1b20884ac09f710379079a090adcb26baeb7e164266beb0e4436fa4'
            'ab7fcf301cfcbc1fa70ec6ff914c8b33b8c868e305990351d0dac5d28832a60368af3a79bbd635742583801eb8bf4226aac0c9e478d40c3b180f1d68e946bf0a'
            '53cac0d8962d1462092841d7f015b596cc6c56632095b3f129476e41f7244082ee852ea80fd8e1a0710ebd0d2fb6139676e1ad4d9c8a376f5387e6dd8fd4c9a1')

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
	mv "${pkgdir}/usr/sbin/dqcache" "${pkgdir}/usr/lib/dq/"
	mv "${pkgdir}/usr/sbin"/* "${pkgdir}/usr/bin"
	rmdir "${pkgdir}/usr/sbin"

	# Do not ship dqcache-start; the supplied systemd unit has its own
	# wrapper program.
	rm "${pkgdir}/usr/bin/dqcache-start"

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
