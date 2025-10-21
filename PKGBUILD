# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=kissfft-git
_pkgname=kissfft
pkgver=390.7bce415
pkgrel=1
pkgdesc='A Fast Fourier Transform (FFT) library that tries to Keep it Simple, Stupid'
arch=('x86_64' 'aarch64')
url='https://github.com/mborgerding/kissfft'
license=('BSD-3-Clause')
depends=('glibc' 'gcc-libs')
# Hack to allow building with Clang, this makes `makepkg --printsrcinfo` vary, but at least it builds
if [[ ${CC} == "clang" ]]; then depends+=(openmp); fi
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

	# Our makefile gets overwritten, save it so we can copy it back
	cp Makefile Makefile.bak

	_cmake_configs=(
		"KISSFFT_OPENMP=ON;KISSFFT_DATATYPE=float"
		"KISSFFT_OPENMP=OFF;KISSFFT_DATATYPE=float"
		"KISSFFT_OPENMP=ON;KISSFFT_DATATYPE=double"
		"KISSFFT_OPENMP=OFF;KISSFFT_DATATYPE=double"
		"KISSFFT_OPENMP=ON;KISSFFT_DATATYPE=int16_t"
		"KISSFFT_OPENMP=OFF;KISSFFT_DATATYPE=int16_t"
		"KISSFFT_OPENMP=ON;KISSFFT_DATATYPE=int32_t"
		"KISSFFT_OPENMP=OFF;KISSFFT_DATATYPE=int32_t"
		# SIMD (requires SSE instruction set support on target CPU)
		"KISSFFT_OPENMP=ON;KISSFFT_DATATYPE=simd"
		"KISSFFT_OPENMP=OFF;KISSFFT_DATATYPE=simd"
	)
	for _config in "${_cmake_configs[@]}"; do
		_cmake_args=""
		IFS=';' read -ra _pairs <<< "${_config}"
		for _pair in "${_pairs[@]}"; do
			_cmake_args="${_cmake_args} -D${_pair}"
		done

		cp Makefile.bak Makefile
		# shellcheck disable=SC2086
		cmake -B build -DCMAKE_INSTALL_PREFIX="/usr" ${_cmake_args}
		make -C build all
		#PREFIX="${srcdir}/usr" make install
	done
}

package() {
	cd kissfft
	install -dm755 "${pkgdir}/usr/include/kissfft/"
	install -m644 ./*.h "${pkgdir}/usr/include/kissfft/"

	install -dm755 "${pkgdir}/usr/lib/kissfft/"
	install -m644 ./*.c "${pkgdir}/usr/lib/kissfft/"

	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -dm755 "${pkgdir}/usr/share/pkgconfig"

	_data_types=(
		"float"
		"double"
		"int16_t"
		"int32_t"
		"simd"
	)
	for _data_type in "${_data_types[@]}"; do
		install -Dm644 "build/kissfft-${_data_type}.pc" "${pkgdir}/usr/share/pkgconfig/kissfft-${_data_type}.pc"
		ln -s "libkissfft-${_data_type}.so.131" "${pkgdir}/usr/lib/libkissfft-${_data_type}.so"
		ln -s "libkissfft-${_data_type}.so.131.1.0" "${pkgdir}/usr/lib/libkissfft-${_data_type}.so.131"
		install -Dm644 "build/libkissfft-${_data_type}.so.131.1.0" "${pkgdir}/usr/lib/libkissfft-${_data_type}.so.131.1.0"

		install -Dm644 "build/kissfft-${_data_type}-openmp.pc" "${pkgdir}/usr/share/pkgconfig/kissfft-${_data_type}-openmp.pc"
		ln -s "libkissfft-${_data_type}-openmp.so.131" "${pkgdir}/usr/lib/libkissfft-${_data_type}-openmp.so"
		ln -s "libkissfft-${_data_type}-openmp.so.131.1.0" "${pkgdir}/usr/lib/libkissfft-${_data_type}-openmp.so.131"
		install -Dm644 "build/libkissfft-${_data_type}-openmp.so.131.1.0" "${pkgdir}/usr/lib/libkissfft-${_data_type}-openmp.so.131.1.0"
	done
}
