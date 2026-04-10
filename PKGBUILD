# Maintainer: c3rt1fiedd <aur.c3rt@gmail.com>
pkgname=pineconemc-launcher-bin
pkgver=11.0.0
pkgrel=2
pkgdesc="A fork of Prism Launcher with integrated Ely.by support"
depends=('fuse2' 'java-runtime' 'zlib')
makedepends=('squashfs-tools')
options=('!strip')
provides=('pineconemc-launcher')
conflicts=('pineconemc-launcher' 'pineconemc-launcher-git')
arch=('x86_64')
license=('GPL3')
source=("pineconemc.AppImage::https://github.com/ElyPrismLauncher/Launcher/releases/download/${pkgver}/PineconeMC-Linux-x86_64.AppImage")
url="https://github.com/ElyPrismLauncher/Launcher"
sha256sums=('9e9097e7df6c4eab3722ae57d013e0133a62f5044306fafe305bafee48d57c3b')

package() {
    # 1. Go to the source directory
    cd "$srcdir"

    # 2. Extract the AppImage (This creates the 'squashfs-root' folder)
    # The --appimage-extract flag is the safest way to do this
    chmod +x pineconemc.AppImage
    ./pineconemc.AppImage --appimage-extract

    # 3. Now the folder DEFINITELY exists. Create the destination.
    install -d "${pkgdir}/opt/pineconemc"

    # 4. Copy everything (Note: Use * instead of . to avoid hidden file issues)
    cp -rp "${srcdir}/squashfs-root/." "${pkgdir}/opt/pineconemc/"

    # 5. Create the symlink
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/pineconemc/AppRun" "${pkgdir}/usr/bin/pineconemc-launcher"

    # 6. Install Desktop entry and Icon (using the long names you found)
    install -Dm644 "${srcdir}/squashfs-root/io.github.elyprismlauncher.ElyPrismLauncher.desktop" \
        "${pkgdir}/usr/share/applications/pineconemc-launcher.desktop"
    
    install -Dm644 "${srcdir}/squashfs-root/io.github.elyprismlauncher.ElyPrismLauncher.png" \
        "${pkgdir}/usr/share/pixmaps/pineconemc-launcher.png"

    # 7. Fix the Exec/Icon paths in the desktop file
    sed -i 's/^Exec=.*/Exec=pineconemc-launcher/' "${pkgdir}/usr/share/applications/pineconemc-launcher.desktop"
    sed -i 's/^Icon=.*/Icon=pineconemc-launcher/' "${pkgdir}/usr/share/applications/pineconemc-launcher.desktop"
}

