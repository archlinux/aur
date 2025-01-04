# Maintainer: Stanislav Vasilev <contact@i-use-gentoo-btw.com>

PKG_REAL_NAME="UntitledGameSystemManager"

pkgname=untitled-game-system-manager
pkgver=2.6.0.0
pkgrel=2
pkgdesc="A manager for containerised Linux gaming systems"
url="https://github.com/MadLadSquad/${PKG_REAL_NAME}"
arch=(x86_64 aarch64)
license=('MIT')
depends=("gcc-libs" "glibc" "pkgconf" "untitled-imgui-framework" "incus" "xorg-xhost")
provides=("lib${PKG_REAL_NAME}Lib.so" "${PKG_REAL_NAME}")
makedepends=("cmake" "make" "pkgconf" "untitled-imgui-framework" "go" "incus")
source=("https://github.com/MadLadSquad/${PKG_REAL_NAME}/releases/download/v${pkgver}/${pkgname}.tar.xz")
sha256sums=('f0873cb3f32b8a822bb1db6a4b1f02ebb3bdfdd861799fe474f134e544d7affb')

build() {
	cd $srcdir || exit
	UVKBuildTool --generate "${srcdir}" || exit

	cd "${srcdir}"/IncusBindings/ || exit
	go build -mod=vendor -o libUGM_Incus_InternalFuncs.so -buildmode=c-shared . || exit

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
