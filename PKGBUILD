# Maintainer: fibref <fibref_233@outlook.com>

pkgname=quickjs-ng
_basename=quickjs
pkgver=0.13.0
pkgrel=1
pkgdesc="Small and embeddable JavaScript engine"
url="https://quickjs-ng.github.io/quickjs"
arch=(x86_64)
license=(MIT)
options=(!strip)
conflicts=(quickjs)
depends=(glibc libgcc)
makedepends=(cmake)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quickjs-ng/quickjs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('13ed1d22cd4b2b693a94a234e752d1ea6a0064434a740031ff90439679257c6c')

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
