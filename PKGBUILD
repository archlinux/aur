# Maintainer: zach <zacharyschwentor@gmail.com>
# Contributor: klee <klee at fedora dot email>

pkgname=yuzu-early-access-appimage
pkgver=$(curl -s "https://api.github.com/repos/pineappleEA/pineapple-src/releases/latest" | grep "browser_download_url" | grep ".AppImage" | sed -n 's/.*EA-\([0-9]*\).*/\1/p')
pkgrel=1
pkgdesc="Nintendo Switch emulator - Early Access builds"
arch=('x86_64')
url="https://pineappleea.github.io/"
license=('GPL2')
depends=('git' 'fuse2' 'zlib' 'libva' 'qt5-multimedia' 'hicolor-icon-theme')
optdepends=('qt5-wayland: for Wayland support'
	    'vulkan-intel: for Vulkan support on Intel'
	    'vulkan-radeon: for Vulkan support on AMD'
	    'nvidia-utils: for Vulkan support on NVIDIA'
	    'vulkan-mesa-layers: additional vulkan layers')
provides=('yuzu')
conflicts=('yuzu' 'yuzu-git' 'yuzu-canary-git' 'yuzu-mainline-bin' 'yuzu-mainline-git' 'yuzu-early-access' 'yuzu-early-access-git' 'pineapple-ea-bin')
options=(!strip)
_appimage="Linux-Yuzu-EA-${pkgver}.AppImage"
source=("https://github.com/pineappleEA/pineapple-src/releases/download/EA-${pkgver}/${_appimage}")
noextract=("${_appimage}")
md5sums=('SKIP')



update_version() {
    pkgver=$(echo "$download_url" | sed -n 's/.*EA-\([0-9]*\).*/\1/p')
}

prepare() {
        cd "${srcdir}"
        chmod +x "${_appimage}"
        ./"${_appimage}" --appimage-extract
}

build() {
	# Adjust .desktop so it will work outside of AppImage container
	sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/org.yuzu_emu.yuzu.desktop|"\
		"squashfs-root/org.yuzu_emu.yuzu.desktop"
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
	install -Dm644 "${srcdir}/squashfs-root/org.yuzu_emu.yuzu.desktop"\
		"${pkgdir}/usr/share/applications/org.yuzu_emu.yuzu.desktop"

	# Icon images
	install -dm755 "${pkgdir}/usr/share/"
	cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/yuzu"

	# Remove old files and updater
	rm -f "${pkgdir}/update.sh"
	rm -rf "${srcdir}/squashfs-root"
}

