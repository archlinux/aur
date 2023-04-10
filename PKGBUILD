# Maintainer: Alexandre Rouma <whatsthetgeek@gmail.com>
# Maintainer: éclairevoyant

_pkgname=sdrpp
pkgname="$_pkgname-git"
pkgver=1.0.4.r462.3336ae4
pkgrel=1
pkgdesc="The Bloat-free SDR Receiver"
arch=(x86_64)
url="https://github.com/AlexandreRouma/SDRPlusPlus"
license=(GPL3)
depends=(fftw glfw glew libvolk rtaudio)
_plugindeps=(airspy airspyhf-git bladerf hackrf libad9361 libiio libsdrplay limesuite rtl-sdr soapysdr)
makedepends=(cmake git "${_plugindeps[@]}")
optdepends=("${_plugindeps[@]}")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags --exclude nightly | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cmake -B build -S $_pkgname \
		-DOPT_BUILD_SDRPLAY_SOURCE=ON \
		-DOPT_BUILD_BLADERF_SOURCE=ON \
		-DOPT_BUILD_LIMESDR_SOURCE=ON
	make -C build $MAKEOPTS
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
