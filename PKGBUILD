# Maintainer: deanqx <dean@kowatsch.de>
pkgname=aurga-viewer-bin
pkgdesc="Desktop app for the AURGA Viewer"
pkgver=2.1.0.1
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://www.aurga.com"
license=('LicenseRef-Proprietary')
options=('!strip')

source_x86_64=("https://github.com/aurgatech/linux-binaries/releases/download/v$pkgver/AURGA.Viewer-${pkgver}_x86_64.tar.xz")
source_aarch64=("https://github.com/aurgatech/linux-binaries/releases/download/v$pkgver/AURGA.Viewer-${pkgver}_aarch64.tar.xz")
source=("aurga-viewer.png::https://www.aurga.com/cdn/shop/files/icon_256x256.png")

sha256sums=('fbde33f0269a875b1ec64bdc96f77b6227bf41777acd7c20e7e831aeba995d66')
sha256sums_x86_64=('f7d237b13217f7e0d7f31d207abfb0806ba0a2ce94160718a5ba86d9625b6589')
sha256sums_aarch64=('03de12ea8c38835141a4d23efa9749a0dad04ae25e486dbd8493b862046a120d')

# verified with namcap
makedepends=('patchelf')
depends=(
    alsa-lib
    at-spi2-core
    cairo
    dbus
    expat
    glib2
    glibc
    libcups
    libgcc
    libglvnd
    libstdc++
    libx11
    libxcb
    libxcomposite
    libxdamage
    libxext
    libxfixes
    libxkbcommon
    libxrandr
    mesa
    nspr
    nss
    pango
    systemd-libs
)

package() {
    install -dm755 "$pkgdir/opt/$pkgname"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"

    cp -r --no-preserve=ownership "$srcdir/aurgav"/* "$pkgdir/opt/$pkgname/"

    install -Dm644 "$srcdir/aurga-viewer.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/aurga-viewer.png"

    # A constant RUNPATH '/usr/share/aurgav' is compiled in the ELF.
    # Setting this to current directory.
    patchelf --set-rpath '$ORIGIN' "$pkgdir/opt/$pkgname/aurgav"

    # The executeable wants to create a desktop file in the home directory but
    # because this package is installed system wide it should use the system
    # desktop entry. This is stopped by using `unset HOME`, behaviour was verified with Ghidra.
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/aurga-viewer" <<EOF
#!/bin/sh
unset HOME
exec /opt/$pkgname/aurgav "\$@"
EOF

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/aurga-viewer.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=AURGA Viewer
Comment=Desktop app for the AURGA Viewer
Exec=/usr/bin/aurga-viewer %U
Terminal=false
Icon=aurga-viewer
Categories=Utility;Network;
Keywords=aurga;
EOF

    chmod 755 "$pkgdir/opt/$pkgname/aurgav"
    chmod 4755 "$pkgdir/opt/$pkgname/chrome-sandbox" 2>/dev/null || true

    ln -s "/opt/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
