# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=qt-dab
pkgver=6.9
pkgrel=1
_prefix=qt-dab-  # name of tarball and contents change from release to release
_tagname=Qt-DAB- # tag names may differ from the application version
_major=${pkgver::1}
_fullname=${pkgname}-${pkgver}
pkgdesc="Software DAB decoder for use with various SDR devices (formerly dab-maxi)"
arch=(x86_64)
url="https://www.sdr-j.tk/"
license=('GPL-2.0-only')
depends=(faad2 fftw gcc-libs glibc hicolor-icon-theme libsamplerate portaudio qt6-base qt6-multimedia qwt-qt6 zlib)
optdepends=('airspy: Support for Airspy'
            'hackrf: Support for HackRF'
            'limesuite: Support for LimeSDR'
            'libad9361: Support for Pluto'
            'rtl-sdr: Support for RTL-SDR'
            'libsdrplay: Support for SDRplay')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/JvanKatwijk/${pkgname}/archive/refs/tags/${_tagname}${pkgver}.tar.gz"
        0001-Allow-building-against-QWT-6.3.0.patch)
sha256sums=('7639b73bbe50499108f0d0334c4ed0a07c7928de88ca04bb21f8d7520b417df6'
            '1d014837d8ca16a45dcf6d5d40ed36c40fb3081218eaaaceaaad0d51a7b7f16d')

prepare() {
	cd "${_prefix}${_tagname}${pkgver}"

	# The program is officially called Qt-DAB.
	sed -i 's/Qt_DAB/Qt-DAB/g' ${_fullname}/${_fullname}.desktop

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
		../${_prefix}${_tagname}${pkgver}/${_fullname}

	make
}

package() {
	install -Dm 755 build/Qt-DAB "${pkgdir}"/usr/bin/${_fullname}
	install -Dm 644 ${_prefix}${_tagname}${pkgver}/${_fullname}/${_fullname}.desktop "${pkgdir}"/usr/share/applications/${_fullname}.desktop
	install -Dm 644 ${_prefix}${_tagname}${pkgver}/${_fullname}/${_fullname}.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/${_fullname}.png

	install -Dm 644 ${_prefix}${_tagname}${pkgver}/docs/manual-${_major}.pdf "${pkgdir}"/usr/share/doc/${pkgname}/manual.pdf
}
