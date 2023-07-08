# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=qt-dab
pkgver=4.7
_prefix=qt-dab- # name of tarball and contents change from release to release
_tagname=4.7/5.4 # tag names may combine v4 and v5
_pkgver=${_tagname//\//-}
_fullname=${pkgname}-4
_fullname_s=${pkgname}-s4
_binary=${pkgname}-${pkgver}
pkgrel=1
pkgdesc="Software DAB decoder for use with various SDR devices (version 4, formerly dab-maxi)"
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
source=("https://github.com/JvanKatwijk/${pkgname}/archive/refs/tags/${_prefix}${_tagname}.tar.gz"
        "https://github.com/JvanKatwijk/qt-dab/commit/a9d1817f0a940a7b8caf65e29016f94dec3d0c93.patch")
sha256sums=('1da2813dd03a5d0ca2965e8dfa0152b3aaaeec7e749ce1788ae085af3676cbe5'
            '6c30604dd396fb947bd3865249c17c8271b7487225479ea2e1837e6858a0ccde')

prepare() {
	cd "${_prefix}${pkgname}-${_pkgver}"

	# The program is officially called Qt-DAB.
	sed -i 's/Qt_DAB/Qt-DAB/g' ${_fullname_s}/${_fullname}.desktop

	# https://github.com/JvanKatwijk/qt-dab/pull/294
	patch -p1 < "${srcdir}"/a9d1817f0a940a7b8caf65e29016f94dec3d0c93.patch
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
		../${_prefix}${pkgname}-${_pkgver}/${_fullname_s}

	make
}

package() {
	install -Dm 755 build/${_binary} "${pkgdir}"/usr/bin/${_fullname}
	install -Dm 644 ${_prefix}${pkgname}-${_pkgver}/${_fullname_s}/${_fullname}.desktop "${pkgdir}"/usr/share/applications/${_fullname}.desktop
	install -Dm 644 ${_prefix}${pkgname}-${_pkgver}/${_fullname_s}/${_fullname}.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/${_fullname}.png
	install -Dm 644 ${_prefix}${pkgname}-${_pkgver}/qt-dab.pdf "${pkgdir}"/usr/share/doc/${pkgname}/manual.pdf
}
