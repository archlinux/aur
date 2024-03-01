# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=qt-dab
pkgver=6.5
pkgrel=1
_prefix=qt-dab-  # name of tarball and contents change from release to release
_tagname=Qt-DAB- # tag names may differ from the application version
_major=${pkgver::1}
_fullname=${pkgname}-${pkgver}
pkgdesc="Software DAB decoder for use with various SDR devices (formerly dab-maxi)"
arch=(x86_64)
url="https://www.sdr-j.tk/"
license=('GPL2')
depends=(faad2 fftw hicolor-icon-theme libsamplerate libsndfile portaudio qwt zlib)
optdepends=('airspy: Support for Airspy'
            'hackrf: Support for HackRF'
            'limesuite: Support for LimeSDR'
            'libad9361: Support for Pluto'
            'rtl-sdr: Support for RTL-SDR'
            'libsdrplay: Support for SDRplay')
source=("https://github.com/JvanKatwijk/${pkgname}/archive/refs/tags/${_tagname}${pkgver}.tar.gz")
sha256sums=('3890c128c05b10241be347428aa8a03b92e19ce5029f65e7a5e9dee073d193fb')

prepare() {
	cd "${_prefix}${_tagname}${pkgver}"

	# The program is officially called Qt-DAB.
	sed -i 's/Qt_DAB/Qt-DAB/g' ${_fullname}/${_fullname}.desktop
}

build() {
	mkdir -p build; cd build

	cmake \
		-Wno-dev \
		-DRTL_TCP=ON \
		-DAIRSPY=ON \
		-DLIMESDR=ON \
		-DHACKRF=ON \
		-DPLUTO=ON \
		-DRTLSDR_LINUX=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		../${_prefix}${_tagname}${pkgver}/${_fullname}

	make
}

package() {
	install -Dm 755 build/${_fullname} "${pkgdir}"/usr/bin/${_fullname}
	install -Dm 644 ${_prefix}${_tagname}${pkgver}/${_fullname}/${_fullname}.desktop "${pkgdir}"/usr/share/applications/${_fullname}.desktop
	install -Dm 644 ${_prefix}${_tagname}${pkgver}/${_fullname}/${_fullname}.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/${_fullname}.png

	install -Dm 644 ${_prefix}${_tagname}${pkgver}/docs/manual-${_major}.pdf "${pkgdir}"/usr/share/doc/${pkgname}/manual.pdf
}
