# Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

pkgname=kissfft-git
_pkgname=kissfft
pkgver=383.9feadb9
pkgrel=1
pkgdesc='A Fast Fourier Transform (FFT) library that tries to Keep it Simple, Stupid'
arch=('any')
url='https://github.com/mborgerding/kissfft'
license=('BSD-3-Clause') # TODO fix SPDX
makedepends=('git' 'cmake' 'fftw' 'libpng' 'python')
conflicts=('kissfft')
provides=('kissfft')
source=('git+https://github.com/mborgerding/kissfft.git')
sha256sums=('SKIP')

pkgver() {
	cd kissfft
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	cmake \
		-DCMAKE_INSTALL_PREFIX=/tmp/1234 \
		-DKISSFFT_OPENMP=ON
#		-DKISSFFT_STATIC=ON \
#$		-DKISSFFT_DATATYPE=int16_t \
	make all
	make install
}

package() {
	cd kissfft
	install -dm755 "${pkgdir}/usr/include/kissfft/"
	install -m644 ./*.h "${pkgdir}/usr/include/kissfft/"

	install -dm755 "${pkgdir}/usr/lib/kissfft/"
	install -m644 ./*.c "${pkgdir}/usr/lib/kissfft/"

	install -Dm644 LICENSES/BSD-3-Clause "${pkgdir}/usr/share/licenses/kissfft-git/LICENSE"

	install -dm755 "${pkgdir}/usr/share/pkgconfig"
	ls -lah .
	install -Dm644 "kissfft-int16_t-openmp.pc" "${pkgdir}/usr/share/pkgconfig/kissfft-int16_t-openmp.pc"
	install -Dm644 "libkissfft-int16_t-openmp.so" "${pkgdir}/usr/lib/libkissfft-int16_t-openmp.so"
	install -Dm644 "libkissfft-int16_t-openmp.so.131" "${pkgdir}/usr/lib/libkissfft-int16_t-openmp.so.131"
	install -Dm644 "libkissfft-int16_t-openmp.so.131.1.0" "${pkgdir}/usr/lib/libkissfft-int16_t-openmp.so.131.1.0"
}
