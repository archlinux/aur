# Maintainer: Fibref <fibref_233@outlook.com>

pkgname=quickjs-ng
_basename=quickjs
pkgver=0.12.1
pkgrel=1
pkgdesc="Small and embeddable JavaScript engine"
url="https://quickjs-ng.github.io/quickjs"
arch=(x86_64)
license=(MIT)
options=(!strip)
conflicts=(quickjs)
depends=(glibc)
makedepends=(cmake)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quickjs-ng/quickjs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c2c54b76ca2f52ffea49658a61c5111449cfe0f94e62510bd3bd7a12e2e18884')

build() {
	local _jobs=$(nproc 2>/dev/null || echo 4)
	cd "${_basename}-${pkgver}"

	cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DQJS_BUILD_LIBC=ON
	cmake --build build -j ${_jobs}
	cmake --build build --target qjsc -j ${_jobs}
}

package() {
	cd "${_basename}-${pkgver}"
	DESTDIR="${pkgdir}" cmake --build build --target install
	install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
