# Maintainer: Fibref <fibref_233@outlook.com>

pkgname=quickjs-ng
_basename=quickjs
pkgver=0.10.0
pkgrel=1
pkgdesc="Small and embeddable JavaScript engine"
url="https://quickjs-ng.github.io/quickjs"
arch=(x86_64)
license=(MIT)
options=(!strip)
conflicts=(quickjs)
depends=(glibc)
makedepends=(cmake)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quickjs-ng/quickjs/archive/refs/tags/v${pkgver}.tar.gz" gcc15.patch)
sha256sums=('c54007e6ce9893b0074d53feac47c64a362900df20493110800c9e1f5c43427b'
            'f4aee5e1ffc3af6fcfb581fba627e8ec14b79aaf49ce7d960af00862af2d5040')

prepare() {
	cd "${_basename}-${pkgver}"
	patch -p0 quickjs.c < "${srcdir}/gcc15.patch"
}

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
