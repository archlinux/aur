# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=qt-dab
pkgver=4.3a
_prefix=qt-dab- # name of tarball and contents change from release to release
_pkgver=4.3a    # official versioning not compatible with pacman
#_binary=${pkgname}-${_pkgver}
_binary=${pkgname}-4.3
pkgrel=1
pkgdesc="Software DAB decoder for use with various SDR devices"
arch=(x86_64)
url="https://www.sdr-j.tk/"
license=('GPL2')
depends=(faad2 fftw hicolor-icon-theme libsamplerate libsndfile portaudio qwt)
optdepends=('airspy: Support for Airspy'
            'hackrf: Support for HackRF'
            'limesuite: Support for LimeSDR'
            'libad9361: Support for Pluto'
            'rtl-sdr: Support for RTL-SDR'
            'libsdrplay: Support for SDRplay')
source=("https://github.com/JvanKatwijk/${pkgname}/archive/refs/tags/${_prefix}${_pkgver}.tar.gz"
        "https://github.com/JvanKatwijk/qt-dab/commit/59a3761e8a2f9aba8fd6e5b471f9c6508c29f274.patch")
sha256sums=('3fbaa2f8ea05af99b364d2d47133cc0d79738dfd3a71d96761d3fdc6e4383d28'
            'e9e01b0df5afaee4b8cf564334f87ebd91d80725c557f3dcecc7805a54924c8d')

prepare() {
	cd "${_prefix}${pkgname}-${_pkgver}"

	# The program is officially called Qt-DAB.
	sed -i 's/Qt_DAB/Qt-DAB/g' dab-maxi/${pkgname}.desktop

	# Fix CMakeList.txt after introduction of tii-codes
	patch -p1 < "${srcdir}/59a3761e8a2f9aba8fd6e5b471f9c6508c29f274.patch"
}

build() {
	mkdir -p build-maxi; cd build-maxi

	cmake \
		-Wno-dev \
		-DTRY_EPG=ON \
		-DRTLSDR=ON \
		-DRTL_TCP=ON \
		-DAIRSPY=ON \
		-DSDRPLAY_V3=ON \
		-DLIMESDR=ON \
		-DHACKRF=ON \
		-DPLUTO=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		../${_prefix}${pkgname}-${_pkgver}/dab-maxi

	make
}

package() {
	install -Dm 755 build-maxi/${_binary} "${pkgdir}"/usr/bin/${pkgname}
	install -Dm 644 ${_prefix}${pkgname}-${_pkgver}/dab-maxi/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
	install -Dm 644 ${_prefix}${pkgname}-${_pkgver}/dab-maxi/${pkgname}.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/${pkgname}.png
	install -Dm 644 ${_prefix}${pkgname}-${_pkgver}/docs/manual.pdf "${pkgdir}"/usr/share/doc/${pkgname}/manual.pdf
}
