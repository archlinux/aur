# Maintainer: Ange Kevin Amlaman (charveey) <amlamanangekevin at gmail dot com>

pkgname=dot-browser-bin
pkgver=2.1.0
pkgrel=6
pkgdesc="A beautiful browser with material UI, with built-in adblock, based on Wexond"
arch=('x86_64')
url="https://getdot.js.org"
license=('GPL3')
provides=('dot-browser')
replaces=('dot-bin')
depends=('gconf' 'libnotify' 'libindicator-gtk2' 'libappindicator-gtk2' 'libxtst')
options=('!strip')

source_x86_64=(
    "https://github.com/dot-browser/desktop/releases/download/v${pkgver}/Dot.${pkgver}.AppImage"
    'dot.desktop'
)

md5sums_x86_64=('57715345bcfe249b73804ebe7a4f03c0'
                '586b8094810544d86f70f23c6b1956ee')

package() {
    cd "${srcdir}"

    # Make the AppImage executable
    chmod +x "Dot.${pkgver}.AppImage"

    # Extract the AppImage
    ./Dot.${pkgver}.AppImage --appimage-extract

    # Move the files to pkgdir
    
    mkdir -p "${pkgdir}/opt/dot"
    cp -a "squashfs-root/." "${pkgdir}/opt/dot/"
    chmod 755 -R "${pkgdir}/opt/dot/" 
    install -Dm644 "dot.desktop" "${pkgdir}/usr/share/applications/dot.desktop"

    # Install desktop icons

    for size in 16 32 128 256 512; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/dot.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/dot.png"
    done

    # Symlink dot binary which is located in /opt
    mkdir -p "${pkgdir}/usr/bin/"
    ln -sf /opt/dot/dot "${pkgdir}/usr/bin/dot-browser"

}
