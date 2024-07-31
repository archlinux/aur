# Maintainer: doclai <toi@doclai.com>

_pkgbase="drbd"
pkgname="drbd-dkms"
pkgdesc="Kernel module for Distributed Replicated Block Device."
pkgver=9.2.10
pkgrel=1
license=('GPL2')
makedepends=("git")
depends=("dkms" "drbd-utils>=9.3.1")
provides=("drbd")
conflicts=("drbd" "drbd-dkms")
arch=("x86_64")
source=("https://linbit.gateway.scarf.sh//downloads/drbd/9/drbd-${pkgver}.tar.gz"
	"dkms.conf")
sha256sums=("9d70b9930763a67800a894d25a9cc1d442fe7a2a9a3984831a7ddca341ecb988"
	"1035849ccc4e50b2edd86a5e12d5b79bd8f92cb898d063fdc82c877436d56261")

build() {
	cd "${srcdir}/drbd-${pkgver}"

	make
}

package() {
	dkmsdir="${pkgdir}/usr/src/drbd-${pkgver%%_*}"
	install -d "${dkmsdir}"
	cp -a ${srcdir}/drbd-${pkgver}/. ${dkmsdir}

	# Copy dkms.conf
	install -Dm644 dkms.conf ${dkmsdir}/dkms.conf

	# Set name and version
	sed -e "s/@_PKGBASE@/${_pkgbase}/" \
		-e "s/@PKGVER@/${pkgver}/" \
		-i ${dkmsdir}/dkms.conf

	cd ${dkmsdir}
	make clean
	make distclean
	find . -name ".git*" -print0 | xargs -0 rm -fr --
}

