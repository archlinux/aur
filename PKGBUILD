# Maintainer: Simon Marchi <simon.marchi at polymtl dot ca>
# Contributor: inhzus <inhzus at gmail dot com>.
pkgname=cppinsights
pkgver=21.1
pkgrel=1
pkgdesc="C++ Insights - See your source code with the eyes of a compiler"
arch=('x86_64')
url="https://cppinsights.io"
license=('MIT')
depends=(llvm21-libs clang21)
makedepends=(ninja cmake llvm21)
conflicts=("cppinsights-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andreasfertig/cppinsights/archive/refs/tags/v_${pkgver}.tar.gz")
b2sums=('3ed1ccb9241db3762c8bb1881a38cef5f29351ecb8cb83b674876d077e773d4fd55861453219852d0ad23960e74aead57101a51bab8dc32e22bed326ab2b9fe1')

build() {
	cd "${srcdir}/${pkgname}-v_${pkgver}"
	cmake -G "Ninja" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCLANG_LINK_CLANG_DYLIB=1 \
		-DLLVM_LINK_LLVM_DYLIB=1 \
		-DINSIGHTS_LLVM_CONFIG=llvm-config-21 \
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
