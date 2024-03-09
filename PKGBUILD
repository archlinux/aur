# Maintainer: Nixuge

# Note: check if "depends" are still valid. As of 1.9, the AppImage
# Should contain everything already to just work everywhere.

# Note 2 (for future me & others):
# I really dislike using the AppImage for this package as it's slow to launch & kinda bloated
# Ideally I'd use the deb, which is 10MB instead of 50MB for the appimage
# 
# However, as of 1.9, the introduction of the "libayatana-appindicator" dependency has caused some problems on Arch,
# and is why the appimage became bloated in the first place to include everything for max compatibility
#
# This forces me to unfortunately stick with the appimage, as arch's "libayatana-appindicator" just segfaults
# 
# Could also redistribute debian's lib & patch the deb around, but I'd have to either:
# - Add another file to download from another source (more risks of it going down)
# - Add the raw file here directly (you'd have to trust me, or go check if the hash in the pkgbuild matches the one from an official src)
# 
# So for now just sticking with that. Will switch in the future if that lib implementation gets fixed.

pkgname=localsend-bin
pkgver=1.14.0
pkgrel=1
pkgdesc='An open source cross-platform alternative to AirDrop '
url=https://github.com/localsend/localsend
arch=(x86_64)
license=(MIT)
depends=(fuse2 xdg-user-dirs)
conflicts=('localsend-git' 'localsend')
provides=('localsend')
options=(!strip)
source=("https://github.com/localsend/localsend/releases/download/v${pkgver}/LocalSend-${pkgver}-linux-x86-64.AppImage")
sha256sums=('e89e885a1de2122dbe5b2b7ec439dca00accee1e63237d4685946a48a35ca8d2')
_appimage="LocalSend-${pkgver}-linux-x86-64.AppImage"
_appimage_nover="localsend.AppImage"
_pkgname="localsend"
_pkgdesktop="org.localsend.localsend_app.desktop"


prepare() {
	chmod +x "${_appimage}"
	./"${_appimage}" --appimage-extract
}

build() {
	# Adjust .desktop so it will work outside of AppImage container
	sed -i -E \
		"s|Exec=localsend_app|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
		"squashfs-root/${_pkgdesktop}"
	
	# Adjust .desktop to have it point to the correct icon (@CIAvash)
	sed -i -E 's/^Icon=.+/Icon=localsend/' "squashfs-root/${_pkgdesktop}"

	# Fix permissions; .AppImage permissions are 700 for all directories
	chmod -R a-x+rX squashfs-root/usr
}

package() {
	# AppImage
	install -Dm755 \
		"${srcdir}/${_appimage}" \
		"${pkgdir}/opt/${_pkgname}/${_appimage_nover}"

	# Desktop file
	install -Dm644 \
		"${srcdir}/squashfs-root/${_pkgdesktop}" \
		"${pkgdir}/usr/share/applications/${_pkgdesktop}"
	
	# Icon file (using the 512x512 one only)
	install -Dm644 \
		"${srcdir}/squashfs-root/data/flutter_assets/assets/img/logo-512.png" \
		"${pkgdir}/usr/share/icons/localsend.png"

	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s \
		"/opt/${_pkgname}/${_appimage_nover}" \
		"${pkgdir}/usr/bin/${_pkgname}"
}
