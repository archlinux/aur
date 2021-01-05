# Maintainer: Zacharias Knudsen <zachasme@gmail.com>
pkgname=h3-git
pkgver=v3.7.1.r14.g29e353f
pkgrel=1
pkgdesc="Hexagonal hierarchical geospatial indexing system"
arch=('x86_64')
url="https://github.com/uber/h3"
license=('Apache')
makedepends=('git' 'cmake' 'make' 'gcc' 'libtool')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/uber/h3.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -B "build" -S "${pkgname}" \
		-DBUILD_SHARED_LIBS=1 \
		-Wno-dev
	cmake --build "build"
}

check() {
	cmake --build "build" --target test 
}

package() {
	DESTDIR="${pkgdir}" cmake --install "build" --prefix "/usr"

	install -D --mode 644 \
    "${pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
