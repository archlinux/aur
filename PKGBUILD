# Maintainer: Tercio Martins <tecnotercio {at} yahoo {dot} com {dot} br>

pkgname=shenidam-git
_pkgname=shenidam
pkgver=1.0.r9.g08b029a
pkgrel=1
pkgdesc="Lightweight audio mapping software for AV footage"
arch=('i686' 'x86_64')
url="https://stendardo.org/shenidam"
license=('GPL')
depends=('boost-libs' 'ffmpeg' 'fftw' 'libsamplerate' 'libsndfile' 'python2-pyqt4')
makedepends=('boost' 'git')
provides=('shenidam')
conflicts=('shenidam')
source=('git+https://github.com/stendardo/shenidam')
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	# Change references from libav to ffmpeg
	cd "${srcdir}/${_pkgname}/python"
	sed -i 's/AVCONV/FFmpeg/g' qshenidam.py
	sed -i 's/avconv/ffmpeg/g' qshenidam.py
	
	sed -i 's/AVCONV/FFMPEG/g' shenidam_av.py
	sed -i 's/avconv/ffmpeg/g' shenidam_av.py
	
	sed -i 's/AVCONV/FFmpeg/g' shenidam.py
	sed -i 's/avconv/ffmpeg/g' shenidam.py
}

build() {
	cd "${srcdir}/${_pkgname}"
	mkdir build
	cd build
	cmake -DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2 \
	-DCMAKE_INSTALL_PREFIX:PATH=/usr ..
	make
}

package() {
	cd "${srcdir}/${_pkgname}/build"
	make DESTDIR="${pkgdir}/" install
	
	install -Dm644 "${srcdir}/${_pkgname}/LICENSE.GPL2.txt" \
		"${pkgdir}/usr/doc/${_pkgname}/LICENSE.GPL2.txt"
	install -Dm644 "${srcdir}/${_pkgname}/LICENSE.GPL3.txt" \
		"${pkgdir}/usr/doc/${_pkgname}/LICENSE.GPL3.txt"
	install -Dm644 "${srcdir}/${_pkgname}/README.txt" \
		"${pkgdir}/usr/doc/${_pkgname}/README.txt"
}
