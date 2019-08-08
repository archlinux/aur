# Maintainer: Ange Kevin Amlaman (charveey) <amlamanangekevin at gmail dot com>

pkgname=dot-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="A beautiful browser with material UI, with built-in adblock, based on Wexond"
arch=('x86_64')
url="https://getdot.js.org"
license=('GPL3')
provides=('dot')
depends=('electron' 'gconf' 'libnotify' 'libindicator-gtk2' 'libappindicator-gtk2' 'libxtst' 'nss' 'libxss')
makedepends=('asar')
options=('!strip')

source_x86_64=(
    "https://github.com/dot-browser/desktop/releases/download/v${pkgver}/Dot.${pkgver}.AppImage"
    'dot.desktop'
    'dot.js'
    '0001-fix-french-translation.patch'
)

md5sums_x86_64=('57715345bcfe249b73804ebe7a4f03c0'
                '586b8094810544d86f70f23c6b1956ee'
                'b3e415a18deddfab9bb56395116b8309'
                'd3ad4886754d0c3972bfe031695c7587')

package() {
    cd "${srcdir}"

    # Extract the AppImage
    "${srcdir}/Dot.${pkgver}.AppImage --appimage-extract"

    #Extract the app.asar
    asar extract "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/squashfs-root/resources/app"

    #Fixes some bad translation in french
    patch -i 0001-fix-french-translation.patch "${srcdir}/squashfs-root/resources/app/locale/fr.json"

    # Do not copy the bundled electron version to reduce package size and
    # use the most up to date electron version.
    mkdir -p "${pkgdir}/opt/dot"
    cp -a "squashfs-root/resources/app/." "${pkgdir}/opt/dot/"

    install -Dm644 "dot.desktop" "${pkgdir}/usr/share/applications/dot.desktop"

    for size in 16 32 128 256 512; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/dot.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/dot.png"
    done

    # Symlink dot binary which is located in /opt
    mkdir -p "${pkgdir}/usr/bin/"
    ln -sf /opt/dot/dot.js "${pkgdir}/usr/bin/dot"
    install -Dm755 "dot.js" "${pkgdir}/opt/dot/dot.js"

}
