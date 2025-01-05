# Contributor: Asuka Minato <i at asukaminato dot eu dot org>
# Maintainer: Daniel S. Palma <your-email-here>
# Package based on AdsPower Global, renamed to avoid conflicts.

pkgname=adspower-antidetect
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
        bsdtar -xf data.tar.* -C "$pkgdir"
        find "$pkgdir/opt" -not -path "*/resources/*" -type f -delete -print
        find "$pkgdir" -name "*armv8*" -delete -print
        find "$pkgdir" -type d -empty -delete

        # Create the launcher with the new name
        printf "#!/bin/sh
exec electron /opt/AdsPower\\ Global/resources/app.asar \"\$@\"
" | install -Dm755 /dev/stdin "$pkgdir/usr/bin/adspower-antidetect"

        # Copy renamed icons
        for size in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
            install -Dm644 "$pkgdir/usr/share/icons/hicolor/${size}/apps/adspower_global.png" "$pkgdir/usr/share/icons/hicolor/${size}/apps/adspower-antidetect.png"
        done

        # Create application shortcut
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
