# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Ted To <wintrymix@theo.to>

pkgname="brlaser"
pkgver=6.2.7
pkgrel=2
pkgdesc="Brother laser printer driver"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/Owl-Maintain/brlaser"
license=('GPL-2.0-or-later')
depends=('cups' 'ghostscript')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('f82364376df149710cf63eb49a13fa900c6bdd39543eed156c6b396fd4156e612b2de36a8c9e71e691c4c22de3cc83c0ac818477514be5a48edfaf9d5beee57c')

build() {
	local cmake_options=(
		-B build
		-S "$pkgname-$pkgver"
		-Wno-dev
		-DCMAKE_BUILD_TYPE=None
		-DCMAKE_INSTALL_PREFIX=/usr
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5
	)
	cmake "${cmake_options[@]}"
	cmake --build build
}

check() {
	local ctest_flags=(
		--test-dir build
		--output-on-failure
		--parallel $(nproc)
	)
	ctest "${ctest_flags[@]}"
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
