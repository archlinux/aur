# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=qt-dab
pkgver=6.8
pkgrel=1
_prefix=qt-dab-  # name of tarball and contents change from release to release
_tagname=        # tag names may differ from the application version
_major=${pkgver::1}
_fullname=${pkgname}-${pkgver}
pkgdesc="Software DAB decoder for use with various SDR devices (formerly dab-maxi)"
arch=(x86_64)
url="https://www.sdr-j.tk/"
license=('GPL-2.0-only')
depends=(faad2 fftw gcc-libs glibc hicolor-icon-theme libsamplerate libsndfile portaudio qt5-base qt5-multimedia qwt zlib)
optdepends=('airspy: Support for Airspy'
            'hackrf: Support for HackRF'
            'limesuite: Support for LimeSDR'
            'libad9361: Support for Pluto'
            'rtl-sdr: Support for RTL-SDR'
            'libsdrplay: Support for SDRplay')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/JvanKatwijk/${pkgname}/archive/refs/tags/${_tagname}${pkgver}.tar.gz"
        0001-Allow-building-against-QWT-6.3.0.patch
        0002-hackrf-handler-fix-getSamples.patch
		0003-hackrf-handler-fix-wiring-of-biasT-checkbox.patch)
sha256sums=('d2ef997de6be84d17d98d2128db744d20eb210546fc5a48749c0a6e60966a935'
            'f008c29d2112f6e3be64825549dbf6a34487815c1a5045131c174807106d59d8'
            'd5d711d51747177647ba2dc5527013e442ea2026fd2fe9ff9c2cfd5252d69c90'
            '33adcc4f031957fb8515f2f8fa313fd673c30d698e73a117c8b2d211aae221ff')

prepare() {
	cd "${_prefix}${_tagname}${pkgver}"

	# The program is officially called Qt-DAB.
	sed -i 's/Qt_DAB/Qt-DAB/g' ${_fullname}/${_fullname}.desktop

	# Allow building against QWT 6.3.0
	patch -p1 < "$srcdir"/0001-Allow-building-against-QWT-6.3.0.patch

	# Fix some regressions in the HackRF backend
	patch -p1 < "$srcdir"/0002-hackrf-handler-fix-getSamples.patch
	patch -p1 < "$srcdir"/0003-hackrf-handler-fix-wiring-of-biasT-checkbox.patch
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
	install -Dm 755 build/Qt-DAB "${pkgdir}"/usr/bin/${_fullname}
	install -Dm 644 ${_prefix}${_tagname}${pkgver}/${_fullname}/${_fullname}.desktop "${pkgdir}"/usr/share/applications/${_fullname}.desktop
	install -Dm 644 ${_prefix}${_tagname}${pkgver}/${_fullname}/${_fullname}.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/${_fullname}.png

	install -Dm 644 ${_prefix}${_tagname}${pkgver}/docs/manual-${_major}.pdf "${pkgdir}"/usr/share/doc/${pkgname}/manual.pdf
}
