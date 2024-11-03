# Maintainer: Stanislav Vasilev <contact@i-use-gentoo-btw.com>

PKG_REAL_NAME="UntitledGameSystemManager"
PKG_FRAMEWORK_VERSION="0.9.8.10"

pkgname=untitled-game-system-manager
pkgver=2.6.0.0
pkgrel=1
pkgdesc="A manager for containerised Linux gaming systems"
url="https://github.com/MadLadSquad/${PKG_REAL_NAME}"
arch=(x86_64 aarch64)
license=('MIT')
depends=("gcc-libs" "glibc" "pkgconf" "untitled-imgui-framework" "incus" "xorg-xhost")
provides=("lib${PKG_REAL_NAME}Lib.so" "${PKG_REAL_NAME}")
makedepends=("cmake" "make" "pkgconf" "untitled-imgui-framework" "go" "incus")
source=("https://github.com/MadLadSquad/UntitledImGuiFramework/releases/download/v${PKG_FRAMEWORK_VERSION}/untitled-imgui-framework.tar.xz" "https://github.com/MadLadSquad/${PKG_REAL_NAME}/releases/download/v${pkgver}/${pkgname}.tar.xz")
sha256sums=('7844ae7820bfb202bfb11c10d86361a7dbbdb788b422e837e78e7b1afe375663'
            'f0873cb3f32b8a822bb1db6a4b1f02ebb3bdfdd861799fe474f134e544d7affb')
noextract=("${pkgname}.tar.xz")

prepare() {
	mkdir -p "${srcdir}"/"${PKG_REAL_NAME}"/Exported || exit
	bsdtar -xf "${srcdir}"/${pkgname}.tar.xz -C "${srcdir}/${PKG_REAL_NAME}" || exit
}

build() {
	cd $srcdir || exit
	sed -i "s/lib64/lib/g" "${srcdir}"/UVKBuildTool/src/UntitledImGuiFramework/ReleaseBuild.cpp
	./install.sh ci || exit
	cp -r "${srcdir}/${PKG_REAL_NAME}" "${srcdir}/Projects/"
	
	cd "${srcdir}"/UVKBuildTool/build
	./UVKBuildTool --generate ../../Projects/"${PKG_REAL_NAME}" || exit	

	cd "${srcdir}"/Projects/"${PKG_REAL_NAME}"/IncusBindings/ || exit
	go build -mod=vendor -o libUGM_Incus_InternalFuncs.so -buildmode=c-shared . || exit

	sed -i "s/install-framework: true/install-framework: false/g" "${srcdir}"/Projects/"${PKG_REAL_NAME}"/uvproj.yaml
	sed -i "s/build-mode-vendor: true/build-mode-vendor: false/g" "${srcdir}"/Projects/"${PKG_REAL_NAME}"/uvproj.yaml	
	echo "install-framework: false" >> "${srcdir}"/Projects/${PKG_REAL_NAME}/uvproj.yaml
	sed -i "s/lib64/lib/g" "${srcdir}"/Projects/"${PKG_REAL_NAME}"/uvproj.yaml
}

package() {
	cd $srcdir/UVKBuildTool/build || exit
	./UVKBuildTool --build "${pkgdir}"/usr /usr ../../Projects/"${PKG_REAL_NAME}" || exit
	
	# Delete unneeded files
	rm -rf "${pkgdir}"/usr/share/utf8cpp "${pkgdir}"/usr/include/utf8cpp "${pkgdir}"/share/utf8cpp "${pkgdir}"/include/utf8cpp || exit
}
