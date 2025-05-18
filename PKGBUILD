# Maintainer: Fibref <fibref_233@outlook.com>

pkgname=quickjs-ng
_basename=quickjs
pkgver=0.10.1
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
sha256sums=('4e917eea3bb6051a0551fdd3aac45199ff705fa08920c15b824a08c5fbb032e4')

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
