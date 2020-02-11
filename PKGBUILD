pkgname=miopen-deps
pkgver=3.0.0
pkgrel=2
pkgdesc="AMD's Machine Intelligence Library - dependencies"
arch=('x86_64')
url="https://github.com/ROCmSoftwarePlatform/MIOpen"
license=('MIT')
options=('!strip' 'staticlibs')
source=("MIOpen-roc-${pkgver}.tar.gz::https://github.com/ROCmSoftwarePlatform/MIOpen/archive/roc-${pkgver}.tar.gz")
sha256sums=('7a5e7b6dca1e70d70683c1403d63128e739fe63a7f68d6c9fc7f9a7af1465a5c')

rocmdir="/opt/rocm"

build() {
	mkdir -p "${srcdir}/build_${pkgname}"
	cd "${srcdir}/build_${pkgname}"

	cmake -P "${srcdir}/MIOpen-roc-${pkgver}/install_deps.cmake" --minimum --prefix ./${pkgname}
}

package() {
	mkdir -p ${pkgdir}${rocmdir}
	cd "${srcdir}/build_${pkgname}"

	# Fix paths in pkg-config files
	find -iname "*.pc" -exec sed -e "s|/.*build_${pkgname}/|${rocmdir}/|g" -i {} \;

	cp -rp ./${pkgname} ${pkgdir}${rocmdir}/${pkgname}
}
