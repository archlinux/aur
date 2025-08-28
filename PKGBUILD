# Maintainer: taotieren <admin@taotieren.com>

pkgname=cangaroo-hpmicro-canfd-analyzer-git
pkgver=r18.01a523c
pkgrel=1
pkgdesc="Four-channel CANFD analyzer based on hpmicro hpm5361"
arch=($CARCH)
license=('GPL-2.0-only')
provides=(${pkgname} cangaroo)
conflicts=(${pkgname} cangaroo)
depends=(
	bash
	gcc-libs
	glibc
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
	git config --global user.email "admin@taotieren.com"
	git config --global user.name "taotieren"
	git remote add taotieren https://github.com/taotieren/cangaroo_hpmicro_canfd_analyzer.git
	git fetch --all
	git merge taotieren/update-linux
	git merge taotieren/rename-autoheightdelegate.h
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
