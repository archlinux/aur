# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=qt-dab
_pkgname=Qt-DAB
pkgver=3.71
pkgrel=1
pkgdesc="Software DAB decoder for use with various SDR devices"
arch=(x86_64)
url="https://www.sdr-j.tk/"
license=('GPL2')
depends=(faad2 fftw hicolor-icon-theme libsamplerate libsndfile portaudio qwt)
makedepends=(libiio)
source=("https://github.com/JvanKatwijk/${pkgname}/archive/refs/tags/${_pkgname}${pkgver}.tar.gz")
sha256sums=('8a5ec68a7b920ee3b397fa8d9bd2e773f5e95ca5bb5a939dc907f4509d3df84f')

prepare() {
	sed -i 's/Qt_DAB/Qt-DAB/g' ${pkgname}-${_pkgname}${pkgver}/dab-maxi/${pkgname}.desktop
}

build() {
	mkdir -p build-maxi; cd build-maxi

	# cmake flags taken from .travis.yml to match the AppImage build
	cmake \
		-Wno-dev \
		-DTRY_EPG=ON \
		-DRTLSDR=ON \
		-DRTL_TCP=ON \
		-DAIRSPY=ON \
		-DSDRPLAY=ON \
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
