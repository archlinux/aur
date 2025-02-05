# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname=dq
pkgver=20250201
pkgrel=1
pkgdesc='Small recursive DNS server and tools with DNSCurve support'
url=https://mojzis.com/software/dq/
arch=(x86_64 i686)
license=(CC0-1.0)
depends=(glibc)
install=dq.install
source=("https://github.com/janmojzis/dq/archive/${pkgver}.tar.gz"
        root-servers dqcache@.service default.conf dqcache-sysusers.conf)
b2sums=('12c06befea5d518df8b483778ffe1dfe113589f619e92bdd536644a70a19cdf4a9656250434db28691bbbd0634f80628bceb1234b98bcf2268cc78a3a200a5c8'
        'e235639a1ad4342ef2ec25b8bfc1b97270137bea5804f48ccc04d71eb289eda7f0372e93bac5fd1bf8b5e2f71b447d99363d8c0740bfee52a6567b79b003b591'
        'e1dc8d1a6dea6b51b0ce1722b33fb7f1d489af8cfc8c390b2b652de6802b9b893832a4f7fb04a599b4f31cc59324e50467e35d9a775e84dd6a0117c01932c9c9'
        '0001c07656ead8f3df72e75478ca1352bab3b266131eed5d065b690cc07dcd97be1d12987bc6ab49542ebc7f08d056c48ff2346b56ad31e717c11a302754cc9c'
        'f2c276dbe25a8f98d61c0851e47757fb878f884f29d1bbfb2a692f6c66bc7b2f02f91b9e95b1b2f82ea4af734dda500dc80f89a840d18c6912787194cc780d0e')

build () {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr
}

package () {
	cd "${pkgname}-${pkgver}"
	make install PREFIX=/usr DESTDIR="${pkgdir}"

	for num in 1 8 ; do
		install -m 644 -D -t "${pkgdir}/usr/share/man/man${num}" man/*.${num}
	done

	mv "${pkgdir}/usr/sbin"/* "${pkgdir}/usr/bin"
	rmdir "${pkgdir}/usr/sbin"

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
