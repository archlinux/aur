# Maintainer: Stanislav Vasilev <contact@i-use-gentoo-btw.com>

PKG_REAL_NAME="UntitledImGuiFramework"

pkgname=untitled-imgui-framework
pkgver=0.9.9.7
pkgrel=1
pkgdesc="Cross-platform desktop application framework based on dear imgui"
url="https://github.com/MadLadSquad/${PKG_REAL_NAME}"
arch=(x86_64 aarch64)
license=('MIT')
depends=("gcc-libs" "glibc" "pkgconf" "yaml-cpp" "utf8cpp" "vulkan-headers" 
	"vulkan-validation-layers" "vulkan-icd-loader" "glfw" "freetype2" "fontconfig" 
	"untitled-dbus-utils" "untitled-cli-parser" "untitled-exec" 
	"untitled-i18n" "untitled-open" "untitled-xdg-basedir"
)
provides=("lib${PKG_REAL_NAME}.so" "UVKBuildTool" "libUVKBuildToolLib.so")
makedepends=("cmake" "make" "${depends}" )
source=("https://github.com/MadLadSquad/${PKG_REAL_NAME}/releases/download/v${pkgver}/${pkgname}.tar.xz")
sha256sums=('c2630730ad454a37b6ca0486b41545fb77388bf7d1ebce75c6ec440d17e4c3a1')

build() {
	cd $srcdir || exit
	sed -i "s/lib64/lib/g" "${srcdir}"/UVKBuildTool/src/UntitledImGuiFramework/ReleaseBuild.cpp
	sed -i "s/lib64/lib/g" "${srcdir}"/UVKBuildTool/CMakeLists.txt
	./install.sh ci || exit
	./create-project.sh pkg --skip-compilation || exit
	sed -i "s/build-mode-vendor: true/build-mode-vendor: false/g" "${srcdir}"/Projects/pkg/uvproj.yaml
	echo "system-wide: true" >> "${srcdir}"/Projects/pkg/uvproj.yaml
	echo "install-framework: true" >> "${srcdir}"/Projects/pkg/uvproj.yaml
}

package() {
	cd $srcdir/UVKBuildTool/build || exit
	./UVKBuildTool --build "${pkgdir}"/usr /usr ../../Projects/pkg || exit
	
	# Delete unneeded files
	rm "${pkgdir}"/usr/lib/libpkgLib.so "${pkgdir}"/usr/bin/pkg || exit
	rm -rf "${pkgdir}"/usr/share/utf8cpp "${pkgdir}"/usr/include/utf8cpp "${pkgdir}"/usr/etc/pkg "${pkgdir}"/usr/share/config/pkg "${pkgdir}"/usr/include/pkg || exit

	cd .. || exit
	rm -rf build && mkdir build && cd build
	cmake .. -G"Unix Makefiles" -DCMAKE_BUILD_TYPE=RELEASE -DUBT_INSTALL=ON -DCMAKE_INSTALL_PREFIX="/usr/" -DUBT_FRAMEWORK_DIR="/usr/include/${PKG_REAL_NAME}/" -DUBT_DATA_INSTALL_PREFIX="/usr/share/" || exit
	make -j "$(grep -c processor /proc/cpuinfo)" || exit
	cmake --install . --prefix="${pkgdir}/usr/"
}
