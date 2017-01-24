# Maintainer: Akshay Srinivasan <akshays@cs.washington.edu>
# Original PKGBUILD by: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=clblas
pkgver=2.12
pkgrel=1
pkgdesc="A software library containing BLAS functions written in OpenCL"
arch=("i686" "x86_64")
url="https://github.com/clMathLibraries/clBLAS"
license=('APACHE')
depends=("opencl-headers" "ocl-icd" "boost")
provides=('clblas')
source=("https://github.com/clMathLibraries/clBLAS/archive/v2.12.tar.gz")
sha512sums=('5d9b0c58adde69e83d95e9c713e0cdc5f64785fe7e05553a14c57fa483c4ef39e9dc780c26880a7f15924967d5ce4ea29035c29d63eac7ee5a2ae5ddacac2b72')

if [ "$CARCH" == "x86_64" ]; then
    _bits=64
elif [ "$CARCH" == "i686" ]; then
    _bits=32
fi

build() {
	export DESTDIR="${pkgdir}"
	cd "${srcdir}/clBLAS-${pkgver}/src"
	cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_TEST=OFF -DCMAKE_INSTALL_PREFIX=/usr ./
	make clBLAS
}

package() {
	cd "${srcdir}/clBLAS-${pkgver}/src"
	make install
	rm -rf "${pkgdir}/usr/bin${_bits}"
	mv "${pkgdir}/usr/lib${_bits}" "${pkgdir}/usr/lib"
	mkdir "${pkgdir}/usr/include/clBLAS/"
	mv -t "${pkgdir}/usr/include/clBLAS/" "${pkgdir}"/usr/include/*.h
}
