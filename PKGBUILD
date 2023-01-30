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
sha512sums=("ccfadae2710359b36f35b95cc9cefaa3dd234aa5db13a7bace6ad579c3b3e8e1338d444c499fe65d1cb1df95cb37bc56e38952a274a7dbefc48b3abf0eb08ee0")

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
