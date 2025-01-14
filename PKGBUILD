# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Zion Nimchuk <zionnimchuk@gmail.com>
_pkgname=cubeb
pkgname=$_pkgname-git
pkgver=0.2.r1548.g048f4a0
pkgrel=1
pkgdesc="Cross platform audio library"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/mozilla/cubeb"
license=('ISC')
depends=('gcc-libs' 'glibc')
makedepends=(
	'alsa-lib'
	'cargo'
	'cmake'
	'doxygen'
	'git'
	'jack'
	'libpulse'
	'sndio'
	'speexdsp'
)
checkdepends=('gtest')
optdepends=(
	'alsa-lib: for ALSA backend'
	'jack: for JACK backend'
	'sndio: for sndio backend'
)
provides=("$_pkgname=$pkgver" 'libcubeb.so')
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+$url.git"
	"cubeb-pulse-rs::git+https://github.com/mozilla/cubeb-pulse-rs.git"
)
b2sums=(
	'SKIP'
	'SKIP'
)

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^cubeb-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	git config submodule.src/cubeb-pulse-rs.url ../cubeb-pulse-rs
	git -c protocol.file.allow=always submodule update
	# https://github.com/mozilla/cubeb/issues/736
	sed -i '/cubeb_add_test(logging)/d' CMakeLists.txt
}

build() {
	LDFLAGS+=" -Wl,-z,undefs"
	cmake -S $_pkgname -B build -G "Unix Makefiles" \
		-DBUILD_RUST_LIBS=ON \
		-DBUILD_SHARED_LIBS=ON \
		-DBUILD_TESTS="$CHECKFUNC" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DUSE_SANITIZERS=OFF \
		-Wno-dev
	cmake --build build
}

check() {
	ctest --test-dir build -E 'audio|callback_ret|devices|latency|sanity|tone'
}

package() {
	depends+=('libpulse.so' 'libspeexdsp.so')
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE
}
