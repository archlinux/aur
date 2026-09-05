# Maintainer: meanlint <meanlint@outlook.com>
# Contributor: wasdxl <xiaotianjuewo@foxmail.com>
pkgname=tauritavern-canary-bin
pkgver=20260904
pkgrel=1
pkgdesc="A Tauri-based frontend for SillyTavern"
arch=('x86_64')
url="https://github.com/Darkatse/TauriTavern"
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

source=("https://github.com/Darkatse/TauriTavern/releases/download/Canary/TauriTavern-${pkgver}-canary-linux-x64.deb")

sha256sums=('b52daafacb39d0a794bf809fdeccb3f4fefbcccda99ff6e72fdaa98558fc870f')

package() {
    cd "${srcdir}"

    bsdtar -xf data.tar.* --no-same-owner

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
