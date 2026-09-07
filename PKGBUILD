# Maintainer: Shaun McCloud <smccloud@smccloud.com>

pkgname=hackman3d-control-deck
pkgbase=hackman3d-control-deck
pkgver=1.5.5
pkgrel=1
pkgdesc="HackMan3D Control Deck (HCD) is a family of programmable desktop controllers."
arch=('x86_64')
url="https://github.com/HackMan3D/Hackman3D-Control-Deck/tree/main"
license=('Creative Commons (4.0 International License)')
depends=('avrdude' 'dpkg' 'appimagetool-bin')
provides=("hackman3d-control-deck")
conflicts=("hackman3d-control-deck")
options=(!strip !zipman !debug)
source=("${pkgname}-v${pkgver}.zip::https://github.com/HackMan3D/Hackman3D-Control-Deck/archive/refs/heads/main.zip")
sha256sums=('da72fc953d82e1f330b3d9a3108637cb205b04ea4da1a515d8c57f0f3e74d5f7')

prepare() {
    unzip -o ${pkgname}-v${pkgver}.zip
    cd "$srcdir/Hackman3D-Control-Deck-main/software"
    ./build_linux.sh
    cd "$srcdir/../"
    cp "$srcdir/Hackman3D-Control-Deck-main/software/dist/HackMan3D-Control-Deck-Linux-x86_64-1.5.5-r7.AppImage" .
    chmod +x HackMan3D-Control-Deck-Linux-x86_64-1.5.5-r7.AppImage
    ./HackMan3D-Control-Deck-Linux-x86_64-1.5.5-r7.AppImage --appimage-extract
}

package() {
    cd "$srcdir/../"
    install -d ${pkgdir}/opt/${pkgname%}/
    cp -a squashfs-root/* ${pkgdir}/opt/${pkgname%}/
    rm -rf ${pkgdir}/opt/${pkgname%}/{hackman3d-control-deck.png}

    install -d $pkgdir/usr/bin
    ln -s /opt/${pkgname%}/AppRun ${pkgdir}/usr/bin/hackman3d-control-deck

    install -Dm644 squashfs-root/hackman3d-control-deck.desktop -t ${pkgdir}/usr/share/applications/
    sed -i 's|Exec=hackman3d-control-deck|Exec=/opt/hackman3d-control-deck/AppRun|g' ${pkgdir}/usr/share/applications/hackman3d-control-deck.desktop
    sed -i 's|Icon=hackman3d-control-deck|Icon=/opt/hackman3d-control-deck/hackman3d-control-deck.png|g' ${pkgdir}/usr/share/applications/hackman3d-control-deck.desktop
}
