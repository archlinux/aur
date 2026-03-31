# Maintainer: MoonVlad
# Contributor: Daniel S. Palma <contato at danielspalma dot adm dot br>
# Contributor: Asuka Minato <i at asukaminato dot eu dot org>

pkgname=adspower-global
pkgver=7.12.29
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
    "https://version.adspower.net/software/linux-x64-global/$pkgver/AdsPower-Global-$pkgver-x64.deb"
)
sha256sums=(
    '6e8dcd0f746549817b60460197103cd0af98d92d122f6e17a48af8a12be27595'
)

package() {
    # Extract files from the .deb
    bsdtar -xf data.tar.* -C "$pkgdir"

    # Remove unnecessary files (except the resources/ folder)
    find "$pkgdir/opt" -not -path "*/resources/*" -type f -delete -print
    # Remove files for other architectures (e.g., armv8)
    find "$pkgdir" -name "*armv8*" -delete -print
    # Remove empty directories
    find "$pkgdir" -type d -empty -delete

    # Create the binary launcher
    printf "#!/bin/sh
exec electron /opt/AdsPower\\ Global/resources/app.asar \"\$@\"
" | install -Dm755 /dev/stdin "$pkgdir/usr/bin/adspower-global"

    # Rename and install icons with the new name (adspower-global)
    for size in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
        install -Dm644 \
            "$pkgdir/usr/share/icons/hicolor/${size}/apps/adspower_global.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}/apps/adspower-global.png"
    done

    # Create the .desktop shortcut
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
