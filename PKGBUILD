# Maintainer: Stanislav Vasilev <contact@i-use-gentoo-btw.com>

PKG_REAL_NAME="UntitledImGuiFramework"

pkgname=untitled-imgui-framework
pkgver=2.5.0.1
pkgrel=1
pkgdesc="Cross-platform desktop application framework based on dear imgui"
url="https://github.com/MadLadSquad/${PKG_REAL_NAME}"
arch=(x86_64 aarch64)
license=('MIT')
depends=("gcc-libs" "glibc" "pkgconf" "utf8cpp" "vulkan-headers" 
	"vulkan-validation-layers" "vulkan-icd-loader" "glfw" "freetype2" "fontconfig" 
	"untitled-dbus-utils" "untitled-cli-parser" "untitled-exec" 
	"untitled-i18n" "untitled-open" "untitled-xdg-basedir"
)
provides=("lib${PKG_REAL_NAME}.so" "UVKBuildTool" "libUVKBuildToolLib.so")
makedepends=("cmake" "make" "${depends}" )
source=("https://github.com/MadLadSquad/${PKG_REAL_NAME}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('7a636ca5d824a6276981d23eff7928c07a9809ce70112e42787bedd3ae1a0616')

build() {
	export nsrcdir="$srcdir/$pkgname-$pkgver"

	cd $nsrcdir || exit
	sed -i "s/lib64/lib/g" "${nsrcdir}"/UVKBuildTool/src/UntitledImGuiFramework/ReleaseBuild/CMake.cpp
	sed -i "s/lib64/lib/g" "${nsrcdir}"/UVKBuildTool/CMakeLists.txt
	./install.sh ci || exit
	./create-project.sh pkg --skip-compilation || exit
	sed -i "s/build-mode-vendor: true/build-mode-vendor: false/g" "${nsrcdir}"/Projects/pkg/uvproj.yaml
	echo "system-wide: true" >> "${nsrcdir}"/Projects/pkg/uvproj.yaml
	echo "install-framework: true" >> "${nsrcdir}"/Projects/pkg/uvproj.yaml
}

package() {
	cd $srcdir/$pkgname-$pkgver/UVKBuildTool/build || exit
	./UVKBuildTool --build "${pkgdir}"/usr /usr ../../Projects/pkg || exit
	
	# Delete unneeded files
	rm "${pkgdir}"/usr/lib/libpkgLib.so "${pkgdir}"/usr/bin/pkg || exit
	rm -rf "${pkgdir}"/usr/share/utf8cpp "${pkgdir}"/usr/include/utf8cpp "${pkgdir}"/usr/share/config/pkg "${pkgdir}"/usr/include/pkg || exit

	cd .. || exit
	rm -rf build && mkdir build && cd build
	cmake .. -G"Unix Makefiles" -DCMAKE_BUILD_TYPE=RELEASE -DUBT_INSTALL=ON -DCMAKE_INSTALL_PREFIX="/usr/" -DUBT_FRAMEWORK_DIR="/usr/include/${PKG_REAL_NAME}/" -DUBT_DATA_INSTALL_PREFIX="/usr/share/" || exit
	make -j "$(grep -c processor /proc/cpuinfo)" || exit
	cmake --install . --prefix="${pkgdir}/usr/"
}
