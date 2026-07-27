# Maintainer: maintainer@speakoflow.com

pkgname=speakoflow-appimage
pkgver=1.0.0
pkgrel=1
pkgdesc="An ai transcriber to transcribe your thoughts faster than you can type."

arch=('x86_64')
url="https://github.com/AbhishekBarali/SpeakoFlow"
license=('MIT')
provides=('speakoflow-appimage')
conflicts=('speakoflow-bin' 'speakoflow-git' 'speakoflow')

depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'vulkan-icd-loader' 'alsa-lib' 'openssl' 'gtk-layer-shell' 'fuse2')

options=(!strip !debug)
_appimage="SpeakoFlow_${pkgver}_amd64.AppImage"
source=("${_appimage}::${url}/releases/download/v${pkgver}/${_appimage}")
sha256sums=('8394a4d364be6fe4a6f0d89c040f791bc7d87eef941176a582b6a4187952259e')

prepare(){
    cd "$srcdir"
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
    cd "$srcdir"

    # 1. Install the AppImage as the main binary
    install -Dm755 "${_appimage}" "${pkgdir}/usr/bin/speakoflow"

    # 2. Automatically find the Desktop file (wherever it is in the extracted folder)
    # This fixes the "cannot stat" error by searching for any .desktop file
    local _desktop_path=$(find squashfs-root -name "*.desktop" -print -quit)
    
    if [ -n "$_desktop_path" ]; then
        install -Dm644 "$_desktop_path" "${pkgdir}/usr/share/applications/speakoflow.desktop"
        
        # 3. Fix the Exec path so it launches /usr/bin/speakoflow
        sed -i "s|Exec=.*|Exec=/usr/bin/speakoflow|g" "${pkgdir}/usr/share/applications/speakoflow.desktop"
    fi

    # 4. Install Icons
    # We look for the standard icons directory and copy it to the system
    if [ -d "squashfs-root/usr/share/icons" ]; then
        mkdir -p "${pkgdir}/usr/share"
        cp -r squashfs-root/usr/share/icons "${pkgdir}/usr/share/"
    fi
}
