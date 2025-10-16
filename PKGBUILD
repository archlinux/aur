# Maintainer: Stanislav Vasilev <contact@i-use-gentoo-btw.com>

PKG_REAL_NAME="UntitledIBusHandwriting"

pkgname=untitled-ibus-handwriting
pkgver=1.5.1.0
pkgrel=1
pkgdesc="A Chinese handwriting input method for IBus"
url="https://github.com/MadLadSquad/${PKG_REAL_NAME}"
arch=(x86_64 aarch64)
license=('MIT')
depends=("gcc-libs" "glibc" "pkgconf" "untitled-imgui-framework")
provides=("lib${PKG_REAL_NAME}Lib.so" "${PKG_REAL_NAME}")
makedepends=("cmake" "make" "pkgconf" "untitled-imgui-framework" "rust")
source=("https://github.com/MadLadSquad/${PKG_REAL_NAME}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('118066e94c26f1c6929e6ece87ed2fb33402f58f167ce2d6560716f18adf991c')

build() {
	export nsrcdir="$srcdir/$pkgname-$pkgver"
	cd "${nsrcdir}" || exit
	UVKBuildTool --generate "${nsrcdir}" || exit	

	cd "${nsrcdir}"/hanzi_lookup || exit
	cargo build --release || exit

	sed -i "s/install-framework: true/install-framework: false/g" "${nsrcdir}"/uvproj.yaml
	sed -i "s/build-mode-vendor: true/build-mode-vendor: false/g" "${nsrcdir}"/uvproj.yaml	
	echo "install-framework: false" >> "${nsrcdir}"/uvproj.yaml
	sed -i "s/lib64/lib/g" "${nsrcdir}"/uvproj.yaml
}

package() {
	UVKBuildTool --build "${pkgdir}"/usr /usr "${srcdir}/$pkgname-$pkgver" || exit
	
	# Delete unneeded files
	rm -rf "${pkgdir}"/usr/share/utf8cpp "${pkgdir}"/usr/include/utf8cpp "${pkgdir}"/share/utf8cpp "${pkgdir}"/include/utf8cpp || exit
}
