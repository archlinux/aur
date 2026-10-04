# Maintainer: Afonso Neto <afonso.pontesneto@gmail.com>
# Contributor: Loopayeh <loopayeh@gmail.com>
pkgname=pkgsender-bin
pkgver=1.2.9
pkgrel=1
pkgdesc="Send PS4/PS5 PKG files to a console over LAN (prebuilt .NET binary)"
arch=('x86_64')
url="https://github.com/Loopayeh/pkg-sender"
license=('MIT')
depends=('gcc-libs' 'icu' 'openssl' 'fontconfig' 'dbus'
         'libx11' 'libxcursor' 'libxi' 'libxrandr' 'libxrender'
         'libice' 'libsm' 'mesa')
provides=('pkgsender')
conflicts=('pkgsender')
# A stripped .NET single-file bundle loses its appended native payload.
options=('!strip' '!debug')
source=("PkgSender-${pkgver}-linux-x64.tar.gz::${url}/releases/download/v${pkgver}/PkgSender-${pkgver}-linux-x64.tar.gz"
        "pkgsender.png"
        "LICENSE")
sha256sums=('21cd6f67cffe2175456d38e0589bda2acc3febfffefbc44acd0db9818cb24d1a'
            'f76878b6d58aa2fad211e95cac83caec9dc44325fd0a4487cac44d56497c95be'
            '3f31523aefe750484ddb23ce5913c67d401a0e597d9d10d6d4676cf9419d9c77')

package() {
    install -Dm755 PkgSender       "$pkgdir/usr/lib/pkgsender/PkgSender"
    install -Dm755 pkg-receiver.elf "$pkgdir/usr/lib/pkgsender/pkg-receiver.elf"
    install -Dm644 pkg_header.py   "$pkgdir/usr/lib/pkgsender/pkg_header.py"
    install -d "$pkgdir/usr/bin"
    ln -s /usr/lib/pkgsender/PkgSender "$pkgdir/usr/bin/pkgsender"

    install -d "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/pkgsender.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=PKG Sender
Comment=Install PS4/PS5 .pkg files over LAN
Exec=pkgsender
Icon=pkgsender
Terminal=false
Categories=Game;Network;Utility;
Keywords=ps4;ps5;pkg;playstation;
StartupWMClass=PkgSender
EOF

    install -Dm644 pkgsender.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/pkgsender.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
