pkgname=libquotient-encryption
pkgver=0.7.1
pkgrel=1
pkgdesc="A Qt5 library to write cross-platform clients for Matrix, with experimental encryption support enabled"
arch=(x86_64 aarch64)
url="https://github.com/quotient-im/libQuotient"
license=("LGPL2")
depends=("qt5-base" "qt5-multimedia" "qtkeychain-qt5" "libolm")
makedepends=("git" "cmake" "make" "gcc")
provides=("libquotient")
conflicts=("libquotient")
source=("${pkgname}.tar.gz::https://github.com/quotient-im/libQuotient/archive/refs/tags/0.7.1.tar.gz")
sha512sums=("88819cafb49712d53c692008be69ea1fc01ca1ac6aedc15696eba2f830956660d185fb07273d50c7dc3e9208314ac24838746d5d9e70b3aad7fccbd15fd7c545")

prepare() {
	mkdir -p "build"
}

build() {
	cd "build"
	cmake ../"libQuotient-0.7.1" \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_INSTALL_LIBDIR=lib \
	-DCMAKE_BUILD_TYPE=Release \
	-DBUILD_SHARED_LIBS=1 \
	-DQuotient_ENABLE_E2EE=ON

	make -j $(nproc)
}

package() {
	cd "build"
	make -j $(nproc) DESTDIR="${pkgdir}" install

	cd "../libQuotient-0.7.1"
	install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
