# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=qt-dab
_pkgname=Qt-DAB
pkgver=3.72
pkgrel=2
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
source=("https://github.com/JvanKatwijk/${pkgname}/archive/refs/tags/${_pkgname}${pkgver}.tar.gz"
        0001-mot_dir-changes.patch
        0002-padHandler-verify-data-length.patch
        0003-padHandler-correct-valid-range-for-last.patch
        0004-hackrf-update-gain-display-when-restoring-settings.patch)
sha256sums=('8e90bd7e35a2fb6e3f3f3aee61ee65d3c37ead5731ba0146fa29883685167ed4'
            'f4f60612d82afffbbd99b5549a4e4ddcd9745e046da9974fe373091251ace85c'
            'f20e66cd0a2f29ee90e20bcdf8aa6ca5b2f06e554e3373ef9118823d5b2ca9d6'
            '170fe2ce981e1d7bc4a7ea5924862887a5c752822375887935f67ea5c34341d6'
            '09ee42c73a928688e710d961c16d46f5d804fb00f7037e24109823b0898d22d4')

prepare() {
	cd "${pkgname}-${_pkgname}${pkgver}"

	# Some stability fixes
	patch -p1 < "$srcdir"/0001-mot_dir-changes.patch
	patch -p1 < "$srcdir"/0002-padHandler-verify-data-length.patch
	patch -p1 < "$srcdir"/0003-padHandler-correct-valid-range-for-last.patch

	# Fix for gain display for hackrf
	patch -p1 < "$srcdir"/0004-hackrf-update-gain-display-when-restoring-settings.patch

	# The program is officially called Qt-DAB.
	sed -i 's/Qt_DAB/Qt-DAB/g' dab-maxi/${pkgname}.desktop
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
		../$pkgname-$_pkgname$pkgver/dab-maxi

	make
}

package() {
	install -Dm 755 build-maxi/${pkgname}-${pkgver} "${pkgdir}"/usr/bin/${pkgname}
	install -Dm 644 ${pkgname}-${_pkgname}${pkgver}/dab-maxi/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
	install -Dm 644 ${pkgname}-${_pkgname}${pkgver}/dab-maxi/${pkgname}.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/${pkgname}.png
	install -Dm 644 ${pkgname}-${_pkgname}${pkgver}/docs/${pkgname}.pdf "${pkgdir}"/usr/share/doc/${pkgname}/${pkgname}.pdf
}
