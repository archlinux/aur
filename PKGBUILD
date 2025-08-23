# Maintainer: Stanislav Vasilev <contact@i-use-gentoo-btw.com>

PKG_REAL_NAME="UntitledGameSystemManager"

pkgname=untitled-game-system-manager
pkgver=2.8.0.0
pkgrel=1
pkgdesc="A manager for containerised Linux gaming systems"
url="https://github.com/MadLadSquad/${PKG_REAL_NAME}"
arch=(x86_64 aarch64)
license=('MIT')
depends=("gcc-libs" "glibc" "pkgconf" "untitled-imgui-framework" "incus" "xorg-xhost")
provides=("lib${PKG_REAL_NAME}Lib.so" "${PKG_REAL_NAME}")
makedepends=("cmake" "make" "pkgconf" "untitled-imgui-framework" "go" "incus")
source=("https://github.com/MadLadSquad/${PKG_REAL_NAME}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('92d3ab6b41bae715db63fc41edc3d689708a0de1175228b5ea4802de30a0bd74')

build() {
	export nsrcdir="$srcdir/$pkgname-$pkgver"
	cd $nsrcdir || exit
	UVKBuildTool --generate "${nsrcdir}" || exit

	cd "${nsrcdir}"/IncusBindings/ || exit
	go build -mod=vendor -o libUGM_Incus_InternalFuncs.so -buildmode=c-shared . || exit

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
