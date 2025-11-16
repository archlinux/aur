# Maintainer: Tomasz Cebula <tomasz.cebula@gmail.com>

pkgname=tangent-dev-bin
_pkgname=${pkgname%-dev-bin}
_pkgver=0.11.0-alpha.4
pkgver=${_pkgver/-/}
pkgrel=1
pkgdesc="Open source markdown note-taking app with linked notes and visual map"
arch=('x86_64')
url="https://www.tangentnotes.com"
license=('Apache-2.0')
_electron=electron37
depends=("$_electron")
provides=('tangent')
conflicts=('tangent' 'tangent-bin')
source=("$_pkgname-$pkgver.AppImage::https://suchnsuch-public.s3.us-east-2.amazonaws.com/${_pkgname^}/Releases/${_pkgname^}-${_pkgver}.AppImage"
        "tangent.desktop")
noextract=("$_pkgname-$pkgver.AppImage")
sha256sums=('aaa31fed67144c08c70d3b5e9e6568b48a65a5aadaab7760392fdbc17a087cae'
            '7bd7e95acdf937c38adaf0456b60e07d501f8235499d13c872f89238fde7bd72')

prepare() {
    cd "$srcdir"

    # Set execution permissions for AppImage
    chmod +x "$_pkgname-$pkgver.AppImage"

    # Extract AppImage contents
    ./"$_pkgname-$pkgver.AppImage" --appimage-extract

    # Check if resources directory exists
    if [[ ! -d "squashfs-root/resources" ]]; then
        echo "Error: resources directory not found!"
        exit 1
    fi
}

package() {
    cd "$srcdir/squashfs-root"

    # Create target directories with proper permissions
    install -dm755 "$pkgdir/usr/lib/$_pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Copy resources directory with proper permissions
    cp -r resources "$pkgdir/usr/lib/$_pkgname/"

    # Set proper permissions for all files and directories
    find "$pkgdir/usr/lib/$_pkgname" -type d -exec chmod 755 {} \;
    find "$pkgdir/usr/lib/$_pkgname" -type f -exec chmod 644 {} \;

    # Copy application icon
    if [[ -f "tangent_electron.png" ]]; then
        install -Dm644 "tangent_electron.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
    fi

    # Copy icons in different sizes
    for size in 16 32 48 64 128 256 512; do
        if [[ -f "usr/share/icons/hicolor/${size}x${size}/apps/tangent_electron.png" ]]; then
            install -Dm644 "usr/share/icons/hicolor/${size}x${size}/apps/tangent_electron.png" \
                "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$_pkgname.png"
        fi
    done

    # Create wrapper script
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << EOF
#!/bin/bash
exec "$_electron" /usr/lib/$_pkgname/resources/app.asar "\$@"
EOF

    # Install desktop file
    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
