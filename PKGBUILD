# Maintainer: Rene Peinthor <peinthor@gmail.com>

_pkgbase="drbd"
pkgname="drbd-dkms-git"
pkgdesc="Kernel module for Distributed Replicated Block Device. (Git)"
pkgver=drbd.9.0.16.1.r0.gab9777df
pkgrel=1
license=('GPL2')
makedepends=("git")
depends=("dkms" "drbd-utils>=9.3.1")
provides=("drbd")
conflicts=("drbd" "drbd-dkms")
arch=("x86_64")
source=("git+https://github.com/LINBIT/drbd-9.0.git"
	"dkms.conf")
sha256sums=("SKIP"
	"1035849ccc4e50b2edd86a5e12d5b79bd8f92cb898d063fdc82c877436d56261")

pkgver() {
  cd "$srcdir/drbd-9.0"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/drbd-9.0"

	make
}

package() {
	dkmsdir="${pkgdir}/usr/src/drbd-${pkgver%%_*}"
	install -d "${dkmsdir}"
	cp -a ${srcdir}/drbd-9.0/. ${dkmsdir}

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
