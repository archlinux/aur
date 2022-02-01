# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=gptsync
pkgver=0.14
_pkgrel_debian=2
pkgrel=8
pkgdesc="gptsync maintains an MBR partition table synchronised with a GPT partition table used as reference."
arch=('i686' 'x86_64')
depends=('gnu-efi-libs')
makedepends=('python2' 'syslinux')
url='https://packages.debian.org/wheezy/gptsync'
license=('custom')
source=("https://cloudfront.debian.net/debian-archive/debian/pool/main/r/refit/refit_${pkgver}.orig.tar.gz"
	"https://cloudfront.debian.net/debian-archive/debian/pool/main/r/refit/refit_${pkgver}-${_pkgrel_debian}.debian.tar.gz")
sha256sums=('0101ac403c3a8c90813df20726c9e76a58515ca7d1a35a7b2ab42eaf28e25e1e'
            '5418b9d6645453ac53e831c59a255ecfe85a09038e0d5d08fc1a55cf6fb087a3')

build() {
	cd ${srcdir}/refit-${pkgver}/

	for PATCH in $(cat ${srcdir}/debian/patches/series); do
		patch -Np1 < ${srcdir}/debian/patches/${PATCH}
	done

	cd ${srcdir}/refit-${pkgver}/include/
	python2 ${srcdir}/debian/mbr/mkmbrhdr.py /usr/lib/syslinux/bios/mbr.bin > syslinux_mbr.h

	cd ${srcdir}/refit-${pkgver}/libeg/
	make

	cd ${srcdir}/refit-${pkgver}/gptsync/
	ln -s Makefile.unix Makefile
	make
}

package() {
	cd ${srcdir}/refit-${pkgver}/

	install -D -m0755 ${srcdir}/refit-${pkgver}/gptsync/gptsync ${pkgdir}/usr/bin/gptsync
	install -D -m0755 ${srcdir}/refit-${pkgver}/gptsync/showpart ${pkgdir}/usr/bin/showpart

	install -D -m0644 ${srcdir}/refit-${pkgver}/gptsync/gptsync.8 ${pkgdir}/usr/share/man/man8/gptsync.8
	install -D -m0644 ${srcdir}/debian/showpart.8 ${pkgdir}/usr/share/man/man8/showpart.8
}

