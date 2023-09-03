# Maintainer: Nikos Toutountzoglou <nikos.toutou@gmail.com>

pkgname=srt-xtransmit
pkgver=0.1.0
pkgrel=2
pkgdesc="Secure Reliable Transport (SRT) transmission utility used for internal testing and performance evaluation."
url="https://github.com/maxsharabayko/srt-xtransmit"
arch=(x86_64)
license=(MPL2)
depends=(
	srt
	gcc-libs
	openssl
)
makedepends=(
	cmake
	git
	ninja
)
_commit=27186a694e075ed267c3ac463f55b956c0e7b17c  # tags/v0.1.0
source=("git+https://github.com/maxsharabayko/srt-xtransmit#commit=$_commit")
b2sums=('SKIP')

pkgver() {
	cd srt-xtransmit
	git describe --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
	cd srt-xtransmit

	# Initialize, fetch and checkout submodules
	git submodule update --init --recursive

	# Checkout srt version (optional)
	#cd submodule/srt
	#_srtver=x.y.z
	#git checkout v$_srtver
}

build() {
	local cmake_options=(
		-DCMAKE_INSTALL_PREFIX=/usr
		-DCMAKE_BUILD_TYPE=None
		-DENABLE_TESTING=ON
		-DENABLE_APPS=ON
		-DENABLE_SHARED=OFF
		-DENABLE_ENCRYPTION=ON
		-DENABLE_CXX17=ON
	)

	cmake -S srt-xtransmit -B build -G Ninja "${cmake_options[@]}"
	cmake --build build
}

check() {
	cd build
	./uriparser-test
	./utility-test
}

package() {
	cd build
	install -Dvm755 bin/srt-xtransmit "$pkgdir/usr/bin/srt-xtransmit"
}
