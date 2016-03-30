# Maintainer: Akshay Srinivasan <akshays@cs.washington.edu>
# Original PKGBUILD by: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=clblas
pkgver=2.10
pkgrel=0
pkgdesc="A software library containing BLAS functions written in OpenCL"
arch=("i686" "x86_64")
url="https://github.com/clMathLibraries/clBLAS"
license=('APACHE')
builddepends=("amdapp-sdk" "boost")
depends=("amdapp-sdk")
source=("https://github.com/clMathLibraries/clBLAS/archive/v2.10.tar.gz")
sha512sums=('5ed43104aae565292e0df4cc9e014cf483ccc0ff89257ebb5817f6508bfc9593585ed658da639f2167fbfb5d92ef116be4d5de3694f56e1a1e228bd42b1c05c6')

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
