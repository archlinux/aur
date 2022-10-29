# Maintainer: klee <klee at fedora dot email>

pkgname=pineapple-ea-bin
pkgver=3060
pkgrel=1
pkgdesc="Nintendo Switch emulator - Early Access builds"
arch=('x86_64')
url="https://pineappleea.github.io/"
license=('GPL2')
depends=('fuse2' 'zlib' 'libva' 'qt5-multimedia' 'hicolor-icon-theme')
optdepends=('qt5-wayland: for Wayland support'
	    'vulkan-intel: for Vulkan support on Intel'
	    'vulkan-radeon: for Vulkan support on AMD'
	    'nvidia-utils: for Vulkan support on NVIDIA'
	    'vulkan-mesa-layers: additional vulkan layers')
provides=('yuzu')
conflicts=('yuzu' 'yuzu-git' 'yuzu-canary-git' 'yuzu-mainline-bin' 'yuzu-mainline-git')
options=(!strip)
_appimage="Yuzu-EA-${pkgver}.AppImage"
source=("https://github.com/pineappleEA/pineapple-src/releases/download/EA-${pkgver}/${_appimage}")
noextract=("${_appimage}")
sha512sums=('8ce106e5ad2b0ac6f4f23f490d6fe8640b7abbce28ef08842053f7f9155f373ac8032a9021b56b4f11177ce03a1c81b3af5c901d41106645863645240a50035a')

prepare() {
        cd "${srcdir}"
        chmod +x "${_appimage}"
        ./"${_appimage}" --appimage-extract
}

build() {
	# Adjust .desktop so it will work outside of AppImage container
	sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/yuzu|"\
		"squashfs-root/yuzu.desktop"
	# Fix permissions; .AppImage permissions are 700 for all directories
	chmod -R a-x+rX squashfs-root/usr
	# Remove autoupdater
	echo "Removing autoupdater..."
	rm -fv "squashfs-root/update.sh"
}

package() {
	# AppImage
	install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"

	# Desktop file
	install -Dm644 "${srcdir}/squashfs-root/yuzu.desktop"\
		"${pkgdir}/usr/share/applications/yuzu.desktop"

	# Icon images
	install -dm755 "${pkgdir}/usr/share/"
	cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/yuzu"

	# Remove autoupdater
	rm -f "${pkgdir}/update.sh"
}
