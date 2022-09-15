# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Zion Nimchuk <zionnimchuk@gmail.com>
_pkgname=cubeb
pkgname=$_pkgname-git
pkgver=0.2.r1393.g4783607
pkgrel=2
pkgdesc="Cross platform audio library"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/mozilla/cubeb"
license=('ISC')
makedepends=('alsa-lib' 'cmake' 'doxygen' 'git' 'jack2' 'libpulse' 'sndio' 'speexdsp')
checkdepends=('gtest')
optdepends=(
	'alsa-lib: for ALSA backend'
	'jack: for JACK backend'
	'libpulse: for PulseAudio backend'
	'sndio: for sndio backend'
)
provides=("$_pkgname=$pkgver" 'libcubeb.so')
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^cubeb-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	sed -i '/install(TARGETS test_/d' CMakeLists.txt
	sed -i 's/@PACKAGE@/@CMAKE_PROJECT_NAME@/' docs/Doxyfile.in
	sed -i 's/@VERSION@/@CMAKE_PROJECT_VERSION@/' docs/Doxyfile.in
	sed -i '$a install(DIRECTORY ${CMAKE_BINARY_DIR}/docs/html/ TYPE DOC)' CMakeLists.txt
}

build() {
	cmake -S $_pkgname -B build \
		-DBUILD_SHARED_LIBS=ON \
		-DBUILD_TESTS="$CHECKFUNC" \
		-DBUNDLE_SPEEX=OFF \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DUSE_SANITIZERS=OFF \
		-Wno-dev
	cmake --build build
}

check() {
	ctest --test-dir build -E 'audio|callback_ret|device_changed_callback|devices|duplex|latency|record|sanity|tone'
}

package() {
	depends+=('libspeexdsp.so')
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE
}
