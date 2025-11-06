# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Ted To <wintrymix@theo.to>

pkgname="brlaser"
pkgver=6.2.8
pkgrel=1
pkgdesc="Brother laser printer driver"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/Owl-Maintain/brlaser"
license=('GPL-2.0-or-later')
depends=('cups' 'ghostscript')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('6cbfb2376dbbc06f55a605a160b946ca810191d9a88c1380adb5fcbac10e37c36ec77604ab0ee0fb2595d86306f87d322b0cea314166a8a2d3999bd43b9365ce')

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
