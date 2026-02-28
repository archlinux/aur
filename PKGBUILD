# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Zion Nimchuk <zionnimchuk@gmail.com>
_pkgname=cubeb
pkgname=$_pkgname-git
pkgver=0.2.r1628.g4848575
pkgrel=1
pkgdesc="Cross platform audio library"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/mozilla/cubeb"
license=('ISC')
depends=('glibc')
makedepends=(
	'alsa-lib'
	'cargo'
	'cmake'
	'doxygen'
	'git'
	'jack'
	'libgcc'
	'libpulse'
	'libstdc++'
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
b2sums=('SKIP'{,})

pkgver() {
	cd $_pkgname
	git describe --long --tags --abbrev=7 | sed 's/^cubeb-//;s/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd $_pkgname
	git config submodule.src/cubeb-pulse-rs.url ../cubeb-pulse-rs
	git -c protocol.file.allow=always submodule update
	# https://github.com/mozilla/cubeb/issues/736
	sed -i '/cubeb_add_test(logging)/d' CMakeLists.txt
}

build() {
	local options=(
		-D BUILD_RUST_LIBS=ON
		-D BUILD_SHARED_LIBS=ON
		-D BUILD_TESTS="$CHECKFUNC"
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_C_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_INSTALL_PREFIX=/usr
		-D USE_SANITIZERS=OFF
		-G "Unix Makefiles"
		-Wno-dev
	)
	LDFLAGS+=" -Wl,-z,undefs"
	cmake "${options[@]}" -B build -S $_pkgname
	cmake --build build
}

check() {
	ctest --output-on-failure --test-dir build -E 'audio|callback_ret|devices|latency|sanity|tone'
}

package() {
	depends+=(
		'libgcc_s.so'
		'libpulse.so'
		'libspeexdsp.so'
		'libstdc++.so'
	)

	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE
}
