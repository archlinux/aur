# Maintainer: Nixugea
# Maintainer: holybaechu <holyb@holyb.xyz>

# As of 1.0.32, the hash check is skipped.
pkgname=labymod-appimage
pkgver=2.0.12
pkgrel=6
pkgdesc='LabyMod Launcher for launching LabyMod, which is a Minecraft client that adds bunch of useful features'
url=https://www.labymod.net
arch=(x86_64)
license=(unknown)
options=(!strip)
source=("https://releases.r2.labymod.net/launcher/linux/x64/LabyMod%20Launcher-${pkgver}.AppImage")
sha256sums=('SKIP')

_pkgname=labymodlauncher
_appimage="LabyMod%20Launcher-${pkgver}.AppImage"

prepare() {
        chmod +x "${_appimage}"
        ./"${_appimage}" --appimage-extract
}

build() {
        # Adjust .desktop so it will work outside of AppImage container
        sed -i -E \
                "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
                "squashfs-root/${_pkgname}.desktop"
        # Fix permissions; .AppImage permissions are 700 for all directories
        chmod -R a-x+rX squashfs-root/usr
}

package() {
        mkdir -p "${pkgdir}/opt/${_pkgname}"

        # AppImage
        cp -a \
                "${srcdir}/${_appimage}" \
                "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

        # Desktop file
        install -Dm644 \
 		"${srcdir}/squashfs-root/${_pkgname}.desktop" \
 		"${pkgdir}/usr/share/applications/${_pkgname}.desktop"

        # Replace default Electron icons with LabyMod icons
        resolutions="16x16 32x32 48x48 64x64 128x128 256x256"
        for resolution in $resolutions; do
                convert -resize $resolution \
                        "${srcdir}/squashfs-root/resources/icons/icon.png" \
                        "${srcdir}/squashfs-root//usr/share/icons/hicolor/${resolution}/apps/${_pkgname}.png"
        done

        # Icon images
        install -dm755 "${pkgdir}/usr/share/"
	cp -a \
		"${srcdir}/squashfs-root/usr/share/icons" \
                "${pkgdir}/usr/share"
                
	# Symlink executable
        install -dm755 "${pkgdir}/usr/bin"
        ln -s \
                "/opt/${_pkgname}/${_pkgname}.AppImage" \
                "${pkgdir}/usr/bin/${_pkgname}"
}

