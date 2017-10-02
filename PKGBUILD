# Submitter: Sean Greenslade <aur@seangreenslade.com>
pkgname="onboard-sdk-git"
pkgdesc="DJI Onboard SDK - git version, 3.3 branch"
url="https://github.com/dji-sdk/Onboard-SDK"
pkgver=3.3.r7.g2295710
arch=('any')
pkgrel=2

source=('git+https://github.com/dji-sdk/Onboard-SDK#branch=3.3'
		'includes_fix.patch')

depends=('cmake')
sha256sums=('SKIP'
'e3bca20b6932521830e41f300602560bd5e6492fea096709d5dbcfce8accf518')

_pkgdir="Onboard-SDK"

pkgver() {
	cd "${_pkgdir}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	[ -d ${srcdir}/${_pkgdir}/build ] || mkdir ${srcdir}/${_pkgdir}/build
	cd "${srcdir}/${_pkgdir}"
	patch -p1 -i ../includes_fix.patch
}

build() {
	cd "${srcdir}/${_pkgdir}/build"

	# Build project
	cmake ${srcdir}/${_pkgdir} \
        -DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release

	make djiosdk-core
}

package() {
	cd "${srcdir}/${_pkgdir}/build"
	make DESTDIR="${pkgdir}/" install
}
