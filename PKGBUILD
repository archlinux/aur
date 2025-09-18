# Maintainer: Peter Cai <peter@typeblog.net>
# Contributor: septs <github@septs.pw>
# Contributor: Coelacanthus <uwu@coelacanthus.name>

pkgname=lpac-git
pkgver=r395.57c175d90052
pkgrel=1
pkgdesc="Local Profile Agent (LPA) for eSIM cards."
arch=(x86_64 aarch64 armv7h)
url="https://github.com/estkme-group/lpac"
license=('AGPL-3.0-only AND LGPL-2.0-only AND MIT')
depends=(curl cjson)
optdepends=(
	'pcsclite: PC/SC support'
	'libqmi: QMI support'
	'libmbim: MBIM support'
)
makedepends=(
	cmake
	pcsclite
	libqmi
	libmbim
	ninja
)
provides=(lpac)
conflicts=(lpac)
source=("$pkgname::git+$url.git")
sha256sums=(SKIP)

pkgver() {
	cd "$srcdir/$pkgname"
	COMMIT_COUNT="$(git rev-list --count HEAD)"
	HEAD_SHA="$(git rev-parse --short=12 HEAD)"
	echo "r$COMMIT_COUNT.$HEAD_SHA"
}

build() {
	local cmake_options=(
		-B build
		-S "$pkgname"
		-G Ninja
		-DCMAKE_INSTALL_PREFIX=/usr
		-DUSE_SYSTEM_DEPS=ON
		-DLPAC_DYNAMIC_DRIVERS=ON
		-DLPAC_DYNAMIC_LIBEUICC=ON
		-DLPAC_WITH_APDU_AT=ON
		-DLPAC_WITH_APDU_MBIM=ON
		-DLPAC_WITH_APDU_PCSC=ON
		-DLPAC_WITH_APDU_QMI=ON
		-DLPAC_WITH_APDU_QMI_QRTR=ON
	)
	cmake "${cmake_options[@]}"
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
}
