# Maintainer: John A. Leuenhagen <john@zlima12.com>
# Maintainer: Horror Proton <107091537+horror-proton@users.noreply.github.com> -> https://github.com/horror-proton
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=cpr
pkgver=1.14.1
pkgrel=1
pkgdesc='C++ Requests: Curl for People, a spiritual port of Python Requests.'
arch=('x86_64')
url="https://github.com/libcpr/cpr"
license=('MIT')
depends=('curl')
makedepends=('cmake' 'git' 'gtest>=1.17') # gtest 1.17 fixes an issue that made this build fail
provides=('libcpr.so=1-64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        '0001-fix-tests.patch')
sha256sums=('213ccc7c98683d2ca6304d9760005effa12ec51d664bababf114566cb2b1e23c'
            'd45f8f1a1932cfa1ac49f75a84bebbbf490e5d03a118aca7b1f4a760c15577c9')

prepare() {
	cd "${pkgname}-${pkgver}"
	patch -p1 -i ../0001-fix-tests.patch
}

build() {
	local _flags=(
		-DCPR_USE_SYSTEM_CURL=ON
		-DCPR_USE_SYSTEM_GTEST=ON
		-DBUILD_SHARED_LIBS=ON
	)

	# This depends on makepkg internals, and is probably evil.
	# However, it seems to be the only way to selectively build tests as of pacman 7.0.0.
	# The idea is that we will only build tests if they're actually going to be run.
	# Default to building tests, so that we aren't skipping them if makepkg internals change.
	if [ "$CHECKFUNC" -eq "0" ];
	then
		_flags+=(
			-DCPR_BUILD_TESTS=OFF
		)
	else
		_flags+=(
			-DCPR_BUILD_TESTS=ON
		)
	fi

	cmake -B build -S "${pkgname}-${pkgver}" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev \
		"${_flags[@]}"

	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	install -Dm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
