# Maintainer: Simon Marchi <simon.marchi at polymtl dot ca>
# Contributor: inhzus <inhzus at gmail dot com>.
pkgname=cppinsights
pkgver=23.1
pkgrel=1
pkgdesc="C++ Insights - See your source code with the eyes of a compiler"
arch=('x86_64')
url="https://cppinsights.io"
license=('MIT')
depends=(llvm-libs clang-libs)
makedepends=(ninja cmake llvm clang)
conflicts=("cppinsights-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andreasfertig/cppinsights/archive/refs/tags/v_${pkgver}.tar.gz")
b2sums=('f3df0dee145ee5574bce1445fcaaeba6fd61357c0d979d8d433e9ba59f0fce5a396a443835225ff393ff4148fcb9f9eed1f54497707185c754a830d45c9f6be5')

build() {
	cd "${srcdir}/${pkgname}-v_${pkgver}"
	cmake -G "Ninja" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCLANG_LINK_CLANG_DYLIB=1 \
		-DLLVM_LINK_LLVM_DYLIB=1 \
		-DINSIGHTS_USE_SYSTEM_INCLUDES=OFF \
		-DCMAKE_CXX_FLAGS="-Wno-error=nonnull" \
		.
	ninja -C build
}

package() {
	cd "${srcdir}/${pkgname}-v_${pkgver}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	cd "build"
	install -Dm755 "insights" "${pkgdir}/usr/bin/insights"
}
