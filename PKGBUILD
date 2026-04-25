# Maintainer: wasdxl <xiaotianjuewo@foxmail.com>
pkgname=tauritavern-bin
pkgver=1.6.5
pkgrel=1
pkgdesc="A Tauri-based frontend for SillyTavern (Binary repackaged for Arch Linux)"
arch=('x86_64')
url="https://github.com/Darkatse/TauriTavern/releases"
license=('AGPL-3.0')
options=('!debug')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libsoup3'
    'libsecret'
    'gstreamer'
    'gst-plugins-base'
    'gst-plugins-good'
)
provides=('tauritavern')
conflicts=('tauritavern')

source=("https://github.com/Darkatse/TauriTavern/releases/download/v${pkgver}/TauriTavern_${pkgver}_amd64.deb")

md5sums=('75e3b3f6c2970087d04e0a32e09dcdee')

package() {
    cd "${srcdir}"

    bsdtar -xf data.tar.gz

    cp -r usr "${pkgdir}/"

    DESKTOP_FILE="${pkgdir}/usr/share/applications/TauriTavern.desktop"

    if [ -f "$DESKTOP_FILE" ]; then

        sed -i 's|^Exec=tauritavern|Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 tauritavern|' "$DESKTOP_FILE"

        sed -i '/^Categories=/d' "$DESKTOP_FILE"

        echo "Categories=Network" >> "$DESKTOP_FILE"

        if ! grep -q '^Icon=tauritavern' "$DESKTOP_FILE"; then
            echo "Icon=tauritavern" >> "$DESKTOP_FILE"
        fi
    fi
}
