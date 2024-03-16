# Maintainer: Nixugea
# Maintainer: holybaechu <holyb@holyb.xyz>

# As of 1.0.32, the hash check is skipped.
# Labymod unfortunately does not provide version specific download links.
# As a result, this PKGBUILD always has to download the latest version.

# This unfortunately makes it so that if the downloaded launcher is more recent than the
# one here, the hash check will fail and the package won't be installable.

# The pkgver will still be updated when new versions come out so that players get updates.

# Note: apparently there IS an endpoint to get a specific version's jar. Will update soon-ish.
pkgname=labymod-appimage
_pkgname=labymodlauncher
pkgver=2.0.12
pkgrel=5
pkgdesc='LabyMod Launcher for launching LabyMod, which is a Minecraft client that adds bunch of useful features'
url=https://www.labymod.net
arch=(x86_64)
license=(unknown)
depends=(fuse xorg-xrandr)
options=(!strip)
_appimage="LabyMod%20Launcher-latest.AppImage"
source=("https://releases.r2.labymod.net/launcher/linux/x64/LabyMod%20Launcher-latest.AppImage")
sha256sums=('SKIP')

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
        # AppImage
        sudo cp -a \
                "${srcdir}/squashfs-root/." \
                "/opt/${_pkgname}/"

        # Desktop file
        install -Dm644 \
                "/opt/${_pkgname}/${_pkgname}.desktop" \
                "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

        # Replace default Electron icons with LabyMod icons
        convert -resize 16x16 \
                "/opt/${_pkgname}/resources/icons/icon.png" \
                "/opt/${_pkgname}/usr/share/icons/hicolor/16x16/apps/${_pkgname}.png"
        convert -resize 32x32 \
                "/opt/${_pkgname}/resources/icons/icon.png" \
                "/opt/${_pkgname}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"
        convert -resize 48x48 \
                "/opt/${_pkgname}/resources/icons/icon.png" \
                "/opt/${_pkgname}/usr/share/icons/hicolor/48x48/apps/${_pkgname}.png"
        convert -resize 64x64 \
                "/opt/${_pkgname}/resources/icons/icon.png" \
                "/opt/${_pkgname}/usr/share/icons/hicolor/64x64/apps/${_pkgname}.png"
        convert -resize 128x128 \
                "/opt/${_pkgname}/resources/icons/icon.png" \
                "/opt/${_pkgname}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
        convert -resize 256x256 \
                "/opt/${_pkgname}/resources/icons/icon.png" \
                "/opt/${_pkgname}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

        # Icon images
        install -dm755 "${pkgdir}/usr/share/"
	cp -a \
		"/opt/${_pkgname}/usr/share/icons" \
                "${pkgdir}/usr/share"
                
	# Symlink executable
        install -dm755 "${pkgdir}/usr/bin"
        ln -s \
                "/opt/${_pkgname}/labymodlauncher" \
                "${pkgdir}/usr/bin/${_pkgname}"
}

