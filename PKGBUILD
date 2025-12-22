# Maintainer: marinara2025 <cjlworld@outlook.com>
pkgname=biu-bin
_pkgname=biu
_realver=1.6.1 # renovate: datasource=github-tags depName=wood3n/biu
pkgver="${_realver//-/_}"
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

sha256sums=('8137d5f7e5cbc9fcf03165f14dd8f646957388ee32b038cd73a37836def50bbe'
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
