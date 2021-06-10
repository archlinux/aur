# Submitter: Sean Greenslade <aur@seangreenslade.com>
pkgname="onboard-sdk-git"
pkgdesc="DJI Onboard SDK - git version"
url="https://github.com/dji-sdk/Onboard-SDK"
pkgver=r1320.17b50bb0
arch=('any')
pkgrel=1

source=('git+https://github.com/dji-sdk/Onboard-SDK'
        'https://github.com/dji-sdk/Onboard-SDK/pull/740.patch')

depends=('cmake')
sha256sums=('SKIP' 'SKIP')

_pkgdir="Onboard-SDK"

prepare() {
    cd "${_pkgdir}"
    patch --forward --strip=1 --input="${srcdir}/740.patch"
}

pkgver() {
	cd "${_pkgdir}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -S ${srcdir}/${_pkgdir} \
        -DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release

	make -C build
}

package() {
	cd build
	make DESTDIR="${pkgdir}/" install
}
