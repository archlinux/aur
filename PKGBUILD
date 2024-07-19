# Maintainer: Nixuge (mail@nixuge.me / @Nixuge on tgm)
#note: most of this pkgbuild is from the lunar-client one, as both are just similar appimages
#most credit goes to monosans, current maintainer of the lunar one
#this one is just for accessibility purposes

pkgname=az-launcher
_pkgname=azlauncher
pkgver=3.2.0
pkgrel=3
pkgdesc='A simple Minecraft version that offers a common gaming experience'
url=https://www.az-launcher.nz/
arch=(x86_64)
options=(!strip !debug)
license=(unknown)
_folder="AZ-Launcher_${pkgver}-linux64"
_filename="${_folder}.tar"
_appimage="AZ-Launcher_x86_64.AppImage"
source=("https://www.az-launcher.nz/static/launcher/${_filename}")
sha256sums=('7abb5a753d8e3077823b020cb6b631c13c222a8436c4f145c6688fb87ea82015')

prepare() {
    #extract the appimage (tar extracted automatically)
    chmod +x "${_folder}/${_appimage}"
    ./"${_folder}/${_appimage}" --appimage-extract
}

build() {
    # Fix the executable name in the desktop file 
    # + add env QT_QPA_PLATFORM=xcb otherwise it doesn't launch at all on Wayland (@bazouzou)
    sed -i "s|/usr/bin/AZ-Launcher|env QT_QPA_PLATFORM=xcb /usr/bin/azlauncher|g" \
        "${srcdir}/squashfs-root/${pkgname}.desktop"

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # Appimage
    install -Dm755 \
        "${srcdir}/${_folder}/${_appimage}" \
        "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

    # Desktop file
    install -Dm644 \
        "${srcdir}/squashfs-root/${pkgname}.desktop"\
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    
    # Icons
    install -dm755 "${pkgdir}/usr/share/"
    cp -a \
        "${srcdir}/squashfs-root/usr/share/icons" \
        "${pkgdir}/usr/share/"
    
    # Symlink executable to /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -s \
        "/opt/${_pkgname}/${_pkgname}.AppImage" \
        "${pkgdir}/usr/bin/${_pkgname}"
}