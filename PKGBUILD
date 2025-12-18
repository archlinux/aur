# Maintainer: marinara2025 <cjlworld@outlook.com>
pkgname=biu-bin
_pkgname=biu
pkgver=1.6.0_beta.11
_realver="${pkgver//_/-}"
pkgrel=4
pkgdesc="A cross-platform desktop music player based on Bilibili API"
arch=('x86_64')
url="https://github.com/wood3n/biu"
license=('custom:PolyForm-Noncommercial')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'glib2' 'libdrm' 'mesa')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')

source=(
    "${_pkgname}-${pkgver}.deb::https://github.com/wood3n/biu/releases/download/v${_realver}/Biu-${_realver}-linux-amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/wood3n/biu/v${_realver}/LICENSE"
)

sha256sums=('3642c1b68c09a9b4e6109c3daf740a72c8b1de69598c381c45f54656afb2282b'
            'b63003add694097450c9719baa1587f522f4c72a5714aae3d2cbd78efe3c0e0d')

package() {
    # Extract data from the deb package
    bsdtar -xf "$srcdir/data.tar."*

    # Install main application files
    install -d "$pkgdir/opt/$_pkgname"
    cp -r "$srcdir/opt/Biu/"* "$pkgdir/opt/$_pkgname/"

    # Fix sandbox permissions
    chmod 4755 "$pkgdir/opt/$_pkgname/chrome-sandbox" || true

    # Create symlink for the executable
    install -d "$pkgdir/usr/bin"
    ln -sf "/opt/$_pkgname/Biu" "$pkgdir/usr/bin/$_pkgname"

    # Install .desktop file
    install -d "$pkgdir/usr/share/applications"
    cp "$srcdir/usr/share/applications/"*".desktop" "$srcdir/biu.desktop.temp"
    sed -i "s|Exec=.*|Exec=/usr/bin/$_pkgname %U|" "$srcdir/biu.desktop.temp"
    sed -i "s|Icon=.*|Icon=$_pkgname|" "$srcdir/biu.desktop.temp"
    install -Dm644 "$srcdir/biu.desktop.temp" "$pkgdir/usr/share/applications/$_pkgname.desktop"

    # Install icons to match the .desktop file's 'Icon=biu' entry
    for icon in "$srcdir"/usr/share/icons/hicolor/*/apps/Biu.png; do
        local size
        size=$(basename "$(dirname "$(dirname "$icon")")")
        install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/$size/apps/$_pkgname.png"
    done

    # Install license file
    install -Dm644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}