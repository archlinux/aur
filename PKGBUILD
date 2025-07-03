# Maintainer: VCalV
# Contributor: meanlint <meanlint@outlook.com>
# Contributor: username227 <gfrank227 at gmail dot com>
# Based on "citra-appimage" pkg made by AlphaJack as a base

_pkgname=borked3ds
pkgname="${_pkgname}-appimage"
pkgver=2025.03.11
pkgrel=6
pkgdesc='An experimental Nintendo 3DS Emulator based off of Citra'
url='https://github.com/Borked3DS/Borked3DS'
license=(GPL-2.0-only)
arch=(x86_64)
provides=(borked3ds)
conflicts=(borked3ds)
depends=(hicolor-icon-theme)
optdepends=('python: for scripting support')

source=("https://github.com/Borked3DS/Borked3DS/releases/download/v${pkgver}/borked3ds-v${pkgver}-linux-appimage-gcc-24.04.tar.xz")
b2sums=('ded3d6dfd734d2a619583325ed1a478d18b2df891d6b0d39b29b05e0c9da6bf2113cac5c29ec681208f02644f9d11e79cb9a900e067058c51e0489f5ae740a06')
options=(!strip)

_srcdir="borked3ds-v${pkgver}-linux-appimage-gcc-24.04"
_appimages=(borked3ds borked3ds-room borked3ds-cli)

prepare() {
    cd "$_srcdir"

    # Make AppImages executable
    for cmd in "${_appimages[@]}"; do
        [[ -f "${cmd}.AppImage" ]] && chmod +x "${cmd}.AppImage"
    done

    # Extract desktop integration files
    for cmd in "${_appimages[@]}"; do
        ./"${cmd}.AppImage" --appimage-extract 'usr/share/icons/hicolor/*' >/dev/null 2>&1 || true
        ./"${cmd}.AppImage" --appimage-extract 'usr/share/applications/*' >/dev/null 2>&1 || true
    done
}

package() {
    cd "$_srcdir"

    # Install AppImages
    install -dm755 "$pkgdir/opt/$_pkgname"
    for cmd in "${_appimages[@]}"; do
        install -Dm755 "${cmd}.AppImage" -t "$pkgdir/opt/$_pkgname/"

        # Create symlinks in /usr/bin
        install -dm755 "$pkgdir/usr/bin"
        ln -s "/opt/$_pkgname/${cmd}.AppImage" "$pkgdir/usr/bin/$cmd"
    done

    # Install extracted desktop integration files if they exist
    if [[ -d squashfs-root/usr/share ]]; then
        # Copy applications directory
        if [[ -d "squashfs-root/usr/share/applications" ]]; then
            install -dm755 "$pkgdir/usr/share"
            cp -r "squashfs-root/usr/share/applications" "$pkgdir/usr/share/"
        fi

        # Copy only icon directories that contain files
        if [[ -d "squashfs-root/usr/share/icons" ]]; then
            install -dm755 "$pkgdir/usr/share/icons"
            find "squashfs-root/usr/share/icons" -type f | while read -r iconfile; do
                # Get the relative path from the icons directory
                relpath="${iconfile#squashfs-root/usr/share/icons/}"
                # Create the target directory and copy the file
                install -Dm644 "$iconfile" "$pkgdir/usr/share/icons/$relpath"
            done
        fi

        # Fix permissions for copied files
        find "$pkgdir/usr/share" -type f -exec chmod 644 {} \;
        find "$pkgdir/usr/share" -type d -exec chmod 755 {} \;
    fi

    # Install additional files
    if [[ -f scripting/borked3ds.py ]]; then
        install -Dm755 scripting/borked3ds.py -t "$pkgdir/opt/$_pkgname/"
    fi

    if [[ -f license.txt ]]; then
        install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi

    # Install documentation
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    for doc in *.md; do
        if [[ -f "$doc" ]]; then
            install -Dm644 "$doc" -t "$pkgdir/usr/share/doc/$pkgname/"
        fi
    done

    # Install icon to pixmaps if it exists
    if [[ -f dist/borked3ds.png ]]; then
        install -Dm644 dist/borked3ds.png -t "$pkgdir/usr/share/pixmaps/"
    fi
}
