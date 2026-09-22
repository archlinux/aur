# Maintainer: taotieren <admin@taotieren.com>

pkgname=cangaroo-hpmicro-canfd-analyzer-git
pkgver=r10.196d825
pkgrel=1
pkgdesc="Four-channel CANFD analyzer based on hpmicro hpm5361"
arch=($CARCH)
license=('GPL-2.0-only')
provides=(${pkgname%-git} cangaroo)
conflicts=(${pkgname%-git} cangaroo)
depends=(
	bash
    libgcc_s.so
    libstdc++.so
	libnl
	qt5-charts
	qt5-base
	qt5-serialport
)
makedepends=(git
	qt5-tools)
url="https://github.com/RCSN/cangaroo_hpmicro_canfd_analyzer"

source=("$pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	(
		set -o pipefail
		git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

prepare() {
	git -C "${srcdir}/${pkgname}" clean -dfx
	cd "${srcdir}/${pkgname}"
	git cherry-pick -n a87c6a70b4adb88b41a87853471e3af2f69e74c5
	git cherry-pick -n 9420a2b4204c6b0e6f712408cc4a1846f426eb75
	git cherry-pick -n bb9963e45ca497cb02cb191fa4f0f53d4eb29b48
	git cherry-pick -n 4b66c32fb0a15632d9282a04485863cbdba110b6
	git cherry-pick -n a7a3462922e891d91103c6b3c794c233ece4df31
}

build() {
	cd "$srcdir/$pkgname"
	qmake-qt5 CONFIG+=release
	make
	cd canifconfig
	qmake-qt5 CONFIG+=release
	make
}

package() {
	cd "$srcdir/$pkgname"
	make install INSTALL_ROOT=${pkgdir}/usr
	cd canifconfig
	make install INSTALL_ROOT=${pkgdir}/usr
}
