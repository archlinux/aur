# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=qt-dab
_pkgname=Qt-DAB
pkgver=3.71
pkgrel=3
pkgdesc="Software DAB decoder for use with various SDR devices"
arch=(x86_64)
url="https://www.sdr-j.tk/"
license=('GPL2')
#options=(!strip) # for debugging
depends=(faad2 fftw hicolor-icon-theme libsamplerate libsndfile portaudio qwt)
optdepends=('airspy: Support for Airspy'
            'hackrf: Support for HackRF'
            'limesuite: Support for LimeSDR'
            'libad9361: Support for Pluto'
            'rtl-sdr: Support for RTL-SDR'
            'libsdrplay: Support for SDRplay')
source=("https://github.com/JvanKatwijk/${pkgname}/archive/refs/tags/${_pkgname}${pkgver}.tar.gz"
        "0001-Remove-liio-from-linker-flags-when-using-CMAKE.patch"
        "0002-Fix-illegal-memory-access-in-fibDecoder-FIG1Extensio.patch"
        "0003-Leave-K-loop-in-reedSolomon-computeLambda-in-time.patch"
        "0004-Fix-index-computation-in-SpectrogramData-value.patch")
sha256sums=('8a5ec68a7b920ee3b397fa8d9bd2e773f5e95ca5bb5a939dc907f4509d3df84f'
            'eecc7813f00586dc37212971a5106a0ba4c106a3970a79e90fe8de1afd13a35a'
            '914eff3d5230d161af38ef1f85e3cecd45f2b150efc9ff8460e4be22f175319c'
            '1e22af5dc6ac8ec4ed512675d3606a8fa68245ba37ecf6a09045cbcf21a1a3c4'
            'e2f998ec4495acc1141a9c8afa8a3fcc48de53a9214430443f474b6955c54490')

prepare() {
	cd "${pkgname}-${_pkgname}${pkgver}"

	# The program is officially called Qt-DAB.
	sed -i 's/Qt_DAB/Qt-DAB/g' dab-maxi/${pkgname}.desktop

	# Various stability and build system fixes
        patch -p1 < "${srcdir}/0001-Remove-liio-from-linker-flags-when-using-CMAKE.patch"
        patch -p1 < "${srcdir}/0002-Fix-illegal-memory-access-in-fibDecoder-FIG1Extensio.patch"
        patch -p1 < "${srcdir}/0003-Leave-K-loop-in-reedSolomon-computeLambda-in-time.patch"
        patch -p1 < "${srcdir}/0004-Fix-index-computation-in-SpectrogramData-value.patch"
}

build() {
	mkdir -p build-maxi; cd build-maxi

	# for debugging
	# CXXFLAGS="$CXXFLAGS -fsanitize=address -g" \
	# LDFLAGS="$LDFLAGS -fsanitize=address -g" \
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
