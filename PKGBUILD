# Maintainer: Stanislav Vasilev <contact@i-use-gentoo-btw.com>

PKG_REAL_NAME="UntitledImGuiFramework"

pkgname=untitled-imgui-framework
pkgver=0.9.8.10
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
provides=("lib${PKG_REAL_NAME}.so")
makedepends=("cmake" "make" "${depends}" )
source=("https://github.com/MadLadSquad/${PKG_REAL_NAME}/releases/download/v${pkgver}/${pkgname}.tar.xz")
sha256sums=('7844ae7820bfb202bfb11c10d86361a7dbbdb788b422e837e78e7b1afe375663')

build() {
	cd $srcdir || exit
	sed -i "s/lib64/lib/g" "${srcdir}"/UVKBuildTool/src/UntitledImGuiFramework/ReleaseBuild.cpp
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
}
