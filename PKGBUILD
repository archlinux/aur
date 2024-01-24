# Maintainer: Alexandre Rouma <whatsthetgeek@gmail.com>
# Maintainer: éclairevoyant
# Contributor: Marin Atanasov Nikolov <dnaeon@gmail.com>

_pkgname=sdrpp
pkgname="$_pkgname-git"
pkgver=1.0.4.r561.eab4264
pkgrel=1
pkgdesc="The bloat-free SDR receiver"
arch=(x86_64)
url="https://www.sdrpp.org/"
license=(GPL3)
depends=(fftw glew glfw libvolk)
_plugindeps=(airspy airspyhf-git bladerf codec2 hackrf libad9361 libiio libsdrplay limesuite rtaudio rtl-sdr portaudio soapysdr)
makedepends=(cmake git "${_plugindeps[@]}")
optdepends=("${_plugindeps[@]}")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/AlexandreRouma/SDRPlusPlus.git")
b2sums=('SKIP')

pkgver() {
	git -C $_pkgname describe --long --tags --exclude nightly | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cmake -B build -S $_pkgname \
		-DOPT_BUILD_BLADERF_SOURCE=ON \
		-DOPT_BUILD_LIMESDR_SOURCE=ON \
		-DOPT_BUILD_SDRPLAY_SOURCE=ON \
		-DOPT_BUILD_NEW_PORTAUDIO_SINK=ON \
		-DOPT_BUILD_M17_DECODER=ON
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}
