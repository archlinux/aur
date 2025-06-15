# Maintainer: edward-p <edward AT edward-p DOT xyz>

_pkgname=sdrpp-brown
pkgname="$_pkgname-git"
pkgver=v1.1709823358.r414.ec20cc23
pkgrel=1
pkgdesc="SDR++Brown (fork), is not the original bloat-free SDR software"
arch=(x86_64)
url="https://github.com/sannysanoff/SDRPlusPlusBrown"
license=(GPL-3.0-or-later)
depends=(fftw glew glfw libvolk)
_plugindeps=(airspy airspyhf-git bladerf codec2 hackrf libad9361 libiio libsdrplay limesuite rtaudio rtl-sdr portaudio soapysdr)
makedepends=(cmake git "${_plugindeps[@]}")
optdepends=("${_plugindeps[@]}")
provides=("$_pkgname" "sdrpp" "sdrpp-git")
conflicts=("$_pkgname" "sdrpp" "sdrpp-git")
source=("$_pkgname::git+https://github.com/sannysanoff/SDRPlusPlusBrown.git")
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
		-DOPT_BUILD_M17_DECODER=ON \
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}
