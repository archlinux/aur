# Maintainer: Daniel S. Palma <seu-email-aqui>
# Pacote baseado no AdsPower Global, renomeado para evitar conflitos

pkgname=adspower-antidetect
pkgver=6.12.6
pkgrel=1
pkgdesc="AdsPower Antidetect Browser - Proteja suas contas e gerencie múltiplas identidades"
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
        bsdtar -xf data.tar.* -C "$pkgdir"
        find "$pkgdir/opt" -not -path "*/resources/*" -type f -delete -print
        find "$pkgdir" -name "*armv8*" -delete -print
        find "$pkgdir" -type d -empty -delete

        # Criar o launcher com novo nome
        printf "#!/bin/sh
exec electron /opt/AdsPower\\ Global/resources/app.asar \"\$@\"
" | install -Dm755 /dev/stdin "$pkgdir/usr/bin/adspower-antidetect"

        # Copiar ícones renomeados
        for size in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
            install -Dm644 "$pkgdir/usr/share/icons/hicolor/${size}/apps/adspower_global.png" "$pkgdir/usr/share/icons/hicolor/${size}/apps/adspower-antidetect.png"
        done

        # Criar atalho no menu de aplicativos
        mkdir -p "$pkgdir/usr/share/applications"
        printf "[Desktop Entry]
Name=AdsPower Antidetect
Exec=adspower-antidetect
Icon=adspower-antidetect
Terminal=false
Type=Application
Categories=Network;Utility;
" > "$pkgdir/usr/share/applications/adspower-antidetect.desktop"
}
