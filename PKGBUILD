# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=qt-dab
pkgver=6.3
pkgrel=2
_prefix=qt-dab-  # name of tarball and contents change from release to release
_tagname=qt-dab- # tag names may differ from the application version
_pkgver=6.30
_major=${pkgver::1}
_fullname=${pkgname}-${_major}
_fullname_s=${pkgname}-s${_major}
_binary=${pkgname}-${_pkgver}
pkgdesc="Software DAB decoder for use with various SDR devices (formerly dab-maxi)"
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
source=("https://github.com/JvanKatwijk/${pkgname}/archive/refs/tags/${_tagname}${_pkgver}.tar.gz"
        https://github.com/JvanKatwijk/qt-dab/commit/f260ae6ecba97a9e83bbbb7f1471286d5a8cf3ca.patch)
sha256sums=('bea7ecfa7f58e6bb41bc8eaa2159f6ee84ee1a6feba9ef598c33bf37b3cfe903'
            '53ddb4dfb36830720529d8846d420c96f543b29ffa858454129dd5fa6e5b72b5')

prepare() {
	cd "${_prefix}${_tagname}${_pkgver}"

	patch -p1 < "${srcdir}/f260ae6ecba97a9e83bbbb7f1471286d5a8cf3ca.patch"

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
	if [ $_major -gt 5 ]; then
		install -Dm 644 ${_prefix}${_tagname}${_pkgver}/${_fullname}.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/${_fullname}.png
	else
		install -Dm 644 ${_prefix}${_tagname}${_pkgver}/${_fullname_s}/${_fullname}.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/${_fullname}.png
	fi

	if [ $_major -gt 4 ]; then
		install -Dm 644 ${_prefix}${_tagname}${_pkgver}/docs/manual-${_major}.pdf "${pkgdir}"/usr/share/doc/${pkgname}/manual.pdf
	else
		install -Dm 644 ${_prefix}${_tagname}${_pkgver}/qt-dab.pdf "${pkgdir}"/usr/share/doc/${pkgname}/manual.pdf
	fi
}
