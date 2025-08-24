# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=qt-dab
pkgver=6.9.3
pkgrel=1
_prefix=qt-dab-  # name of tarball and contents change from release to release
_tagname=Qt-DAB- # tag names may differ from the application version
_major=${pkgver::1}
_majorminor=${pkgver::3}
_fullname=${pkgname}-${_majorminor}
_suffix=
pkgdesc="Software DAB decoder for use with various SDR devices (formerly dab-maxi)"
arch=(x86_64)
url="https://www.sdr-j.tk/"
license=('GPL-2.0-only')
depends=(faad2 fftw gcc-libs glibc hicolor-icon-theme portaudio qt6-base qt6-multimedia qwt-qt6 zlib)
optdepends=('airspy: Support for Airspy'
            'hackrf: Support for HackRF'
            'limesuite: Support for LimeSDR'
            'libad9361: Support for Pluto'
            'rtl-sdr: Support for RTL-SDR'
            'libsdrplay: Support for SDRplay')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/JvanKatwijk/${pkgname}/archive/refs/tags/${_tagname}${pkgver}${_suffix}.tar.gz"
        0001-Allow-building-against-QWT-6.3.0.patch)
sha256sums=('b04c6ece055f40725f0cfeb3800b0635a9778ab30931a30ff70385a91b3c0d7b'
            '396f8eaaa0bf080dfc766a1c590ef534360e3e19e4b79208bced794a3cd1473b')

prepare() {
	cd "${_prefix}${_tagname}${pkgver}${_suffix}"

	# Allow building against QWT 6.3.0
	patch -p1 < "$srcdir"/0001-Allow-building-against-QWT-6.3.0.patch
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
		../${_prefix}${_tagname}${pkgver}${_suffix}

	make
}

package() {
	install -Dm 755 build/Qt-DAB "${pkgdir}"/usr/bin/${pkgname}-${pkgver}
	install -Dm 644 ${_prefix}${_tagname}${pkgver}${_suffix}/app-files/${_fullname}.desktop "${pkgdir}"/usr/share/applications/${_fullname}.desktop
	install -Dm 644 ${_prefix}${_tagname}${pkgver}${_suffix}/app-files/${_fullname}.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/${_fullname}.png

	install -Dm 644 ${_prefix}${_tagname}${pkgver}${_suffix}/docs/manual-${_major}.pdf "${pkgdir}"/usr/share/doc/${pkgname}/manual.pdf
	install -Dm 644 ${_prefix}${_tagname}${pkgver}${_suffix}/docs/build-dab.pdf "${pkgdir}"/usr/share/doc/${pkgname}/build-dab.pdf
	install -Dm 644 ${_prefix}${_tagname}${pkgver}${_suffix}/docs/using-qt${_major}.pdf "${pkgdir}"/usr/share/doc/${pkgname}/using.pdf
}
