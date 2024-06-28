# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=srt-xtransmit
pkgver=0.1.0.r76.gf43cfff
pkgrel=1
pkgdesc="Secure Reliable Transport (SRT) transmission utility used for internal testing and performance evaluation."
url="https://github.com/maxsharabayko/srt-xtransmit"
arch=('x86_64')
license=()
depends=('srt' 'gcc-libs' 'openssl')
makedepends=('cmake' 'git' 'ninja')
source=("git+https://github.com/maxsharabayko/srt-xtransmit")
sha256sums=('SKIP')

pkgver() {
	cd srt-xtransmit
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
