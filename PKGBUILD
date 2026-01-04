# Maintainer: marinara2025 <cjlworld@outlook.com>
pkgname=biu-bin
_pkgname=biu
_realver=1.9.0 # renovate: datasource=github-tags depName=wood3n/biu
pkgver="${_realver//-/_}"
pkgrel=1
pkgdesc="A cross-platform desktop music player based on Bilibili API"
arch=('x86_64')
url="https://github.com/wood3n/biu"
license=('PolyForm-Noncommercial-1.0.0')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'glib2' 'libdrm' 'mesa'
          'libxcomposite' 'cairo' 'at-spi2-core' 'libxfixes' 'libxrandr'
          'libcups' 'pango' 'libxkbcommon' 'dbus')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')

source=(
    "${_pkgname}-${pkgver}.deb::https://github.com/wood3n/biu/releases/download/v${_realver}/Biu-${_realver}-linux-amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/wood3n/biu/v${_realver}/LICENSE"
)

sha256sums=('fd59c9c072d18b6ed814f972b75652f0fdc6c455d17e9abdea461058d0b6d1a6'
            'b63003add694097450c9719baa1587f522f4c72a5714aae3d2cbd78efe3c0e0d')

package() {
    # Extract data from the deb package
    bsdtar -xf "$srcdir/data.tar."*

    # Install main application files
    install -d "$pkgdir/opt/$_pkgname"
    cp -r "$srcdir/opt/Biu/"* "$pkgdir/opt/$_pkgname/"
    
    # Remove unnecessary files for other platforms to clean up the package
    # and prevent namcap false positives.
    rm -rf "$pkgdir/opt/$_pkgname/resources/app.asar.unpacked/node_modules/font-list/libs/"{darwin,win32}

    # Fix sandbox permissions
    chmod 4755 "$pkgdir/opt/$_pkgname/chrome-sandbox" || true

    # Create symlink for the executable
    install -d "$pkgdir/usr/bin"
    ln -sf "/opt/$_pkgname/Biu" "$pkgdir/usr/bin/$_pkgname"

    # Install .desktop file
    install -d "$pkgdir/usr/share/applications"
    install -Dm644 "$srcdir/usr/share/applications/Biu.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i "s|^Exec=.*|Exec=$_pkgname %U|" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i "s|^Icon=.*|Icon=$_pkgname|" "$pkgdir/usr/share/applications/$_pkgname.desktop"

    # Install icons to match the .desktop file's 'Icon=biu' entry
    for icon in "$srcdir"/usr/share/icons/hicolor/*/apps/Biu.png; do
        local size
        size=$(basename "$(dirname "$(dirname "$icon")")")
        install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/$size/apps/$_pkgname.png"
    done

    # Install license file
    install -Dm644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
