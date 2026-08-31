# Maintainer: Behzad Khosravifar <behzad.kh.2006@gmail.com>
# Binary package repacking the official self-contained linux-x64 release tarball.
# Updated automatically by scripts/release.sh (submit_aur) on every release.
pkgname=downloader-bin
pkgver=2.8.1
pkgrel=1
pkgdesc="Fast multi-connection download manager with queues, scheduler and browser integration"
arch=('x86_64')
url="https://github.com/bezzad/Downloader.Desktop"
license=('MIT')
provides=('downloader')
conflicts=('downloader')
options=('!strip' '!debug')
source=("Downloader-$pkgver-linux-x64.tar.gz::$url/releases/download/v$pkgver/Downloader-linux-x64.tar.gz"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/bezzad/Downloader.Desktop/v$pkgver/LICENSE"
        "downloader-$pkgver.png::https://raw.githubusercontent.com/bezzad/Downloader.Desktop/v$pkgver/src/Downloader.Desktop/Assets/downloader.png")
sha256sums=('8fb94465c8c31146375ded8efad8efe80e9ff97e6cd84d8ee58a672c3f886547'
            'SKIP'
            'SKIP')

package() {
    # Self-contained app dir under /opt (single-file publish: the "Downloader" executable).
    install -dm755 "$pkgdir/opt/downloader"
    # Everything from the tarball except our renamed source files.
    find "$srcdir" -maxdepth 1 -type f ! -name "*.tar.gz" ! -name "LICENSE-*" ! -name "downloader-*.png" \
        -exec install -Dm755 {} "$pkgdir/opt/downloader/" \;

    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/downloader/Downloader "$pkgdir/usr/bin/downloader"

    # Desktop entry (StartupWMClass must match the app's X11 WmClass "Downloader").
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/downloader.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Downloader
Comment=Fast multi-connection download manager
Exec=/opt/downloader/Downloader %u
Icon=downloader
Terminal=false
Categories=Network;FileTransfer;Utility;
StartupWMClass=Downloader
EOF

    install -Dm644 "$srcdir/downloader-$pkgver.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/downloader.png"
    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
