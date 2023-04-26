# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=qt-dab
pkgver=4.6
_prefix=qt-dab- # name of tarball and contents change from release to release
_pkgver=4.6-5.3 # tag names may combine v4 and v5
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
source=("https://github.com/JvanKatwijk/${pkgname}/archive/refs/tags/${_prefix}${_pkgver}.tar.gz")
sha256sums=('c4b52260bb8b6f6fe8af57e808b95d88cf35e1f297f0fdfdb7dcdbe701beaa0b')

prepare() {
	cd "${_prefix}${pkgname}-${_pkgver}"

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
