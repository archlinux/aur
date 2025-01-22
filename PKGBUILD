# Maintainer: Seu Nome <seu.email@example.com>
# Contributor: Asuka Minato <i at asukaminato dot eu dot org>

pkgname=adspower-global
pkgver=6.12.6
pkgrel=1
pkgdesc="AdsPower - Most Secure Antidetect Browser for Multi-Accounts"
arch=(x86_64)
url="https://www.adspower.com"
license=('custom')
depends=(
    gcc-libs
    glibc
    bash
    electron
    hicolor-icon-theme
)
source=(
    "https://version.adspower.net/software/linux-x64-global/AdsPower-Global-$pkgver-x64.deb"
)
sha256sums=(
    'ca064003d62a9dba30eddf322b0738ade3a5cf5fd9bccfb3a0cb1817681593b7'
)

package() {
    # Extrai os arquivos do .deb
    bsdtar -xf data.tar.* -C "$pkgdir"

    # Remove arquivos desnecessários (exceto resources/)
    find "$pkgdir/opt" -not -path "*/resources/*" -type f -delete -print
    # Remove arquivos para outras arquiteturas (ex: armv8)
    find "$pkgdir" -name "*armv8*" -delete -print
    # Remove diretórios vazios
    find "$pkgdir" -type d -empty -delete

    # Cria o launcher binário
    printf "#!/bin/sh
exec electron /opt/AdsPower\\ Global/resources/app.asar \"\$@\"
" | install -Dm755 /dev/stdin "$pkgdir/usr/bin/adspower-global"

    # Renomeia e instala ícones com o novo nome (adspower-global)
    for size in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
        install -Dm644 \
            "$pkgdir/usr/share/icons/hicolor/${size}/apps/adspower_global.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}/apps/adspower-global.png"
    done

    # Cria atalho .desktop
    mkdir -p "$pkgdir/usr/share/applications"
    printf "[Desktop Entry]
Name=AdsPower Global
Exec=adspower-global
Icon=adspower-global
Terminal=false
Type=Application
Categories=Network;Utility;
" > "$pkgdir/usr/share/applications/adspower-global.desktop"
}
