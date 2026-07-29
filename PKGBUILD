# Maintainer: maintainer@speakoflow.com

pkgname=speakoflow-bin
pkgver=1.0.2
pkgrel=2
pkgdesc="A free, open-source, local-first voice-to-text desktop application with offline speech recognition, AI-assisted writing, speech cleanup, translation, and a system-wide voice assistant."

arch=('x86_64')
url="https://github.com/AbhishekBarali/SpeakoFlow"
license=('MIT')
conflicts=('speakoflow-git' 'speakoflow')
provides=('speakoflow-bin')

options=(!strip !debug)

_appimage="SpeakoFlow_${pkgver}_amd64.AppImage"
source=("${_appimage}::${url}/releases/download/v${pkgver}/${_appimage}")
sha256sums=('c7fa361909f076ab7cdd45a8069ff34b84d54e41d3b5a6482c5acf178578c9e6')

prepare(){
    cd "$srcdir"
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
    cd "$srcdir"

    #Installing App image
    install -Dm755 "${_appimage}" "${pkgdir}/opt/speakoflow/SpeakoFlow.AppImage"

    #create /usr/bin file
    install -dm755 "${pkgdir}/usr/bin"

    #create a link to the appimage and bin file
    ln -s /opt/speakoflow/SpeakoFlow.AppImage "${pkgdir}/usr/bin/speakoflow"

    #find the desktop file
    desktop_file=$(find squashfs-root -name '*.desktop' -print -quit)
    install -Dm644 "$desktop_file" "${pkgdir}/usr/share/applications/speakoflow.desktop"

    #update exec line
    sed -i 's|^Exec=.*|Exec=/usr/bin/speakoflow|' "${pkgdir}/usr/share/applications/speakoflow.desktop"

    #installing icons
    cp -r squashfs-root/usr/share/icons "${pkgdir}/usr/share"
}
