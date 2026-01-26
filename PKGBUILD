# Maintainer: Genesis <tofupedia.fr@gmail.com>

pkgname=ankama-launcher
pkgver=3.13.37
pkgrel=1
pkgdesc='A multi-game portal for all Ankama games.'
url='https://www.ankama.com/en/launcher'

arch=('x86_64')
license=('custom:Ankama License')
install='ankama-launcher.install'
depends=('zlib' 'bash' 'fuse')
makedepends=('p7zip')
optdepends=('libnotify' 'libappindicator'
            'java-runtime: to play Wakfu'
            'alsa-lib: to play Wakfu'
            'gtk3: to play Wakfu')
options=('!strip')
source=('ankama-launcher')
source_x86_64=("${pkgname}-${pkgver}-x86_64.AppImage::https://launcher.cdn.ankama.com/installers/production/Ankama%20Launcher-Setup-x86_64.AppImage")
sha512sums=('0b9d72c460dd22acc0d2d2b0ab312bc609501c8c7fb8eaef2bd93092fd4ac849152b0e9163253066536ea4169079e5bc424bea37ee005c48a2047721142f876b')
sha512sums_x86_64=('3a0bd39ee8298e0728cd804b2927d4a0d79abd0c19b8d6f60af95c6c4a79bf506cd0238992231a0d22a53cfe725689481812c125296f5ca49d8a8429cc8d045b')

prepare() {
    cd "${srcdir}"
    mv "${pkgname}-${pkgver}-${CARCH}.AppImage" "ankama-launcher.AppImage"
    7z e "${srcdir}/ankama-launcher.AppImage" "zaap.desktop"
    7z x "${srcdir}/ankama-launcher.AppImage" "usr/share/icons/hicolor/*/apps/zaap.png" -o"icons/"

    sed -i "s/^Exec=.*$/Exec=${pkgname}/" "zaap.desktop"
    sed -i "s/^Icon=zaap$/Icon=ankama-launcher/" "zaap.desktop"
}

package() {
    install -dm775 "${pkgdir}/opt/ankama-launcher"
    install -Dm775 "ankama-launcher.AppImage" "${pkgdir}/opt/ankama-launcher/ankama-launcher.AppImage"
    install -Dm755 "ankama-launcher"          "${pkgdir}/usr/bin/ankama-launcher"
    install -Dm644 "zaap.desktop"             "${pkgdir}/usr/share/applications/ankama-launcher.desktop"

    # Install all icons to hicolor directory structure, renaming from zaap to ankama-launcher
    find icons/usr/share/icons/hicolor -name "zaap.png" | while read -r icon; do
        dest="${pkgdir}${icon#icons}"
        dest="${dest%zaap.png}ankama-launcher.png"
        install -Dm644 "$icon" "$dest"
    done
}
