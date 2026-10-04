# Maintainer: Barath <your@email.com>
# Package name uses -bin suffix (AUR convention for pre-built binaries)
#
# CPU compatibility: The bundled JRE is built with jvmToolchain (JDK 21 from
# Adoptium) which targets baseline x86-64 (x86-64-v1). This ensures ConnectLnx
# runs on ALL x86-64 CPUs, including older models and AMD Zen CPUs without
# AVX-512 (Zen 2/3). If you encounter "CPU ISA level is lower than required",
# build from source with: ./gradlew :composeApp:run

pkgname=connectlnx-bin
pkgver=3.5.1
pkgrel=1
pkgdesc="Cross-platform LAN file transfer app built with Kotlin Multiplatform"
arch=('x86_64')
url="https://github.com/3DBarath/ConnectLnxKMP"
license=('MIT')
depends=()        # No external JRE needed — bundled inside the deb
conflicts=('connectlnx')
provides=('connectlnx')

source=("connectlnx-${pkgver}.deb::https://github.com/3DBarath/connectlnx-releases/releases/download/v${pkgver}/connectlnx_${pkgver}_amd64.deb")
sha256sums=('bb395bdbd1c7f5332630633b564f791f34b9552a64df15a375ef46d63e5f000c')  # ← Replace with: sha256sum connectlnx_1.0.0_amd64.deb

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
    # NOTE: the Compose .deb already ships its own entry. Only install ours
    # if none exists, to avoid duplicate launchers (double start at login).
    install -dm755 "$pkgdir/usr/share/applications"
    if [ ! -f "$pkgdir/usr/share/applications/ConnectLnx.desktop" ] && [ ! -f "$pkgdir/usr/share/applications/connectlnx.desktop" ]; then
    cat > "$pkgdir/usr/share/applications/connectlnx.desktop" <<EOF
[Desktop Entry]
Name=ConnectLnx
Comment=Cross-platform LAN file transfer
Exec=/opt/connectlnx/bin/ConnectLnx
Icon=connectlnx
Terminal=false
Type=Application
Categories=Network;FileTransfer;Utility;
StartupWMClass=ConnectLnx
SingleMainWindow=true
EOF
    fi
}
