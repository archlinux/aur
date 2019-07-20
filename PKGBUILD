# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=s3blkdev
pkgdesc='Exposes S3 storage buckets as NBD devices'
pkgver=0.10
pkgrel=1
url='https://ogris.de/s3blkdev/'
license=(custom:BSD)
arch=(x86_64)
depends=(gnutls snappy systemd nbd)
optdepends=('nodejs: for the s3blkdev.js Web interface')
source=("${url}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('441d20e08ada38bc8d51b8373cc9c8145286d0e1950e53f073a1977520663027620244b9a7e86e7ccbae5752b6221304f2a86ab167071323d4bafc41372aacb4')

prepare () {
	cd "${pkgname}-${pkgver}"
	sed -e 's,/usr/local/etc,/etc,' \
	    -e 's,/usr/local/sbin,/usr/bin,' \
		-e 's,/tmp/s3blkdevd.sock,/run/s3blkdevd.socket,' \
		-i scripts/*.service s3blkdev.conf.dist s3blkdev.h
}

build () {
	make -C "${pkgname}-${pkgver}" \
		CFLAGS="${CFLAGS} -DUSE_SYSTEMD" \
		LDFLAGS="${LDFLAGS}"
}

package () {
	cd "${pkgname}-${pkgver}"
	install -Dm755 -t "${pkgdir}/usr/bin" s3blkdevd s3blkdev-sync s3blkdev.js
	install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" scripts/*.service
	install -Dm644 -t "${pkgdir}/etc" s3blkdev.conf.dist
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
