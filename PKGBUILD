# Maintainer: Barath <your@email.com>
# Package name uses -bin suffix (AUR convention for pre-built binaries)

pkgname=connectlnx-bin
pkgver=3.3.0
pkgrel=1
pkgdesc="Cross-platform LAN file transfer app built with Kotlin Multiplatform"
arch=('x86_64')
url="https://github.com/3DBarath/ConnectLnxKMP"
license=('MIT')
depends=()        # No external JRE needed — bundled inside the deb
conflicts=('connectlnx')
provides=('connectlnx')

source=("connectlnx-${pkgver}.deb::https://github.com/3DBarath/connectlnx-releases/releases/download/v${pkgver}/connectlnx_${pkgver}_amd64.deb")
sha256sums=('f3457755199ec61f8467d771eb20d9b2ca355de6ad65db457e272522ddd83859')  # ← Replace with: sha256sum connectlnx_1.0.0_amd64.deb

package() {
    cd "$srcdir"

    # Extract the .deb archive
    ar x "connectlnx-${pkgver}.deb"

    # Unpack the data tarball (Compose Desktop uses .tar.xz)
    if [ -f data.tar.xz ]; then
        tar -xJf data.tar.xz -C "$pkgdir/"
    elif [ -f data.tar.zst ]; then
        tar -I zstd -xf data.tar.zst -C "$pkgdir/"
    elif [ -f data.tar.gz ]; then
        tar -xzf data.tar.gz -C "$pkgdir/"
    fi

    # Symlink binary into /usr/bin so 'connectlnx' works in terminal
    install -dm755 "$pkgdir/usr/bin"
    ln -sf /opt/connectlnx/bin/ConnectLnx "$pkgdir/usr/bin/connectlnx"

    # Desktop entry for app launcher (GNOME, KDE, etc.)
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/connectlnx.desktop" <<EOF
[Desktop Entry]
Name=ConnectLnx
Comment=Cross-platform LAN file transfer
Exec=/opt/connectlnx/bin/ConnectLnx
Icon=/opt/connectlnx/lib/connectlnx.png
Terminal=false
Type=Application
Categories=Network;FileTransfer;Utility;
EOF
}
