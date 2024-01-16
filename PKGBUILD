# Maintainer: Alexandre Rouma <whatsthetgeek@gmail.com>
# Maintainer: éclairevoyant
# Contributor: Marin Atanasov Nikolov <dnaeon@gmail.com>

_pkgname=sdrpp
pkgname="$_pkgname-git"
pkgver=1.0.4.r537.ead2ac6
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
source=("$_pkgname::git+https://github.com/AlexandreRouma/SDRPlusPlus.git"
        "rtaudio.patch")
b2sums=('SKIP'
        '1a08a82edd076b292f1c420c33bc1ba4e038a0b05f32d71927c4f4c0be4f713c3265c11f765eb16721405a5e3abbc443ad57fa0566e36a14b4cb4ec95cd901f1')

prepare() {
    cd $_pkgname
    patch --forward --strip=1 --input="$srcdir/rtaudio.patch"
}

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
