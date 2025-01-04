# Maintainer: Stanislav Vasilev <contact@i-use-gentoo-btw.com>

PKG_REAL_NAME="UntitledIBusHandwriting"

pkgname=untitled-ibus-handwriting
pkgver=1.3.0.0
pkgrel=2
pkgdesc="A Chinese handwriting input method for IBus"
url="https://github.com/MadLadSquad/${PKG_REAL_NAME}"
arch=(x86_64 aarch64)
license=('MIT')
depends=("gcc-libs" "glibc" "pkgconf" "untitled-imgui-framework")
provides=("lib${PKG_REAL_NAME}Lib.so" "${PKG_REAL_NAME}")
makedepends=("cmake" "make" "pkgconf" "untitled-imgui-framework" "rust")
source=("https://github.com/MadLadSquad/${PKG_REAL_NAME}/releases/download/v${pkgver}/${pkgname}.tar.xz")
sha256sums=('e494a5ecb676c03f70139336e4b9d6adb54d148fc1479bd444ce51e07bd27226')

build() {
	cd "${srcdir}" || exit
	UVKBuildTool --generate "${srcdir}" || exit	

	cd "${srcdir}"/hanzi_lookup || exit
	cargo build --release || exit

	sed -i "s/install-framework: true/install-framework: false/g" "${srcdir}"/uvproj.yaml
	sed -i "s/build-mode-vendor: true/build-mode-vendor: false/g" "${srcdir}"/uvproj.yaml	
	echo "install-framework: false" >> "${srcdir}"/uvproj.yaml
	sed -i "s/lib64/lib/g" "${srcdir}"/uvproj.yaml
}

package() {
	UVKBuildTool --build "${pkgdir}"/usr /usr "${srcdir}" || exit
	
	# Delete unneeded files
	rm -rf "${pkgdir}"/usr/share/utf8cpp "${pkgdir}"/usr/include/utf8cpp "${pkgdir}"/share/utf8cpp "${pkgdir}"/include/utf8cpp || exit
}
