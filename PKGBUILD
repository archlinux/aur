# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=qt-dab
pkgver=6.4
pkgrel=1
_prefix=qt-dab-  # name of tarball and contents change from release to release
_tagname=qt-dab- # tag names may differ from the application version
_pkgver=6.40
_major=${pkgver::1}
_fullname=${pkgname}-${_major}
_fullname_s=${pkgname}-s${_major}
_binary=${pkgname}-${_pkgver}
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
source=("https://github.com/JvanKatwijk/${pkgname}/archive/refs/tags/${_tagname}${_pkgver}.tar.gz")
sha256sums=('78195166cfe67f9a4ac229bfdcded284b3f88b8af3e449ac91406cc93e1e4c07')

prepare() {
	cd "${_prefix}${_tagname}${_pkgver}"

	# The program is officially called Qt-DAB.
	sed -i 's/Qt_DAB/Qt-DAB/g' ${_fullname_s}/${_fullname}.desktop
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
		../${_prefix}${_tagname}${_pkgver}/${_fullname_s}

	make
}

package() {
	install -Dm 755 build/${_binary} "${pkgdir}"/usr/bin/${_fullname}
	install -Dm 644 ${_prefix}${_tagname}${_pkgver}/${_fullname_s}/${_fullname}.desktop "${pkgdir}"/usr/share/applications/${_fullname}.desktop
	install -Dm 644 ${_prefix}${_tagname}${_pkgver}/${_fullname_s}/${_fullname}.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/${_fullname}.png

	if [ $_major -gt 4 ]; then
		install -Dm 644 ${_prefix}${_tagname}${_pkgver}/docs/manual-${_major}.pdf "${pkgdir}"/usr/share/doc/${pkgname}/manual.pdf
	else
		install -Dm 644 ${_prefix}${_tagname}${_pkgver}/qt-dab.pdf "${pkgdir}"/usr/share/doc/${pkgname}/manual.pdf
	fi
}
