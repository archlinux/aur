# Maintainer: fibref <fibref_233@outlook.com>

pkgname=quickjs-ng
_basename=quickjs
pkgver=0.15.0
pkgrel=1
pkgdesc="Small and embeddable JavaScript engine"
url="https://quickjs-ng.github.io/quickjs"
arch=(x86_64)
license=(MIT)
options=(!strip staticlibs)
conflicts=(quickjs)
depends=(glibc libgcc)
makedepends=(cmake)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quickjs-ng/quickjs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d65f951fa9d347a912a53ec2c151bd0ac79bf73d445788e67670ca1b894c67c4')

build() {
	local _jobs=$(nproc 2>/dev/null || echo 4)
	cd "${_basename}-${pkgver}"

	# build shared lib
	cmake -B build-shared \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DQJS_BUILD_LIBC=ON \
		-DBUILD_SHARED_LIBS=ON
	cmake --build build-shared -j ${_jobs}
	cmake --build build-shared --target qjsc -j ${_jobs}

	# build static lib
	cmake -B build-static \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DQJS_BUILD_LIBC=ON
	cmake --build build-static -j ${_jobs}
	cmake --build build-static --target qjsc -j ${_jobs}
}

package() {
	cd "${_basename}-${pkgver}"
	# install shared lib
	DESTDIR="${pkgdir}" cmake --build build-shared --target install
	# install static lib
	install -Dm644 build-static/libqjs.a "${pkgdir}/usr/lib/libqjs.a"
	install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
