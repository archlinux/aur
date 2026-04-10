# Maintainer: c3rt1fiedd <aur.c3rt@gmail.com>
pkgname=pineconemc-launcher-bin
pkgver=11.0.0
pkgrel=1
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
    # 1. Create the destination directory in /opt
    install -d "${pkgdir}/opt/pineconemc"

    # 2. Move EVERYTHING from the extraction into /opt
    # This keeps libraries and 'AppRun' in the same folder
    cp -rp "${srcdir}/squashfs-root/." "${pkgdir}/opt/pineconemc/"

    # 3. Create a symbolic link in /usr/bin so you can just type 'pineconemc-launcher'
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/pineconemc/AppRun" "${pkgdir}/usr/bin/pineconemc-launcher"

    # 4. Install the Desktop entry (Fixing the Exec and Icon paths)
    install -Dm644 "${srcdir}/squashfs-root/io.github.elyprismlauncher.ElyPrismLauncher.desktop" \
        "${pkgdir}/usr/share/applications/pineconemc-launcher.desktop"
    
    sed -i 's/^Exec=.*/Exec=pineconemc-launcher/' "${pkgdir}/usr/share/applications/pineconemc-launcher.desktop"
    sed -i 's/^Icon=.*/Icon=pineconemc-launcher/' "${pkgdir}/usr/share/applications/pineconemc-launcher.desktop"

    # 5. Install the Icon
    install -Dm644 "${srcdir}/squashfs-root/io.github.elyprismlauncher.ElyPrismLauncher.png" \
        "${pkgdir}/usr/share/pixmaps/pineconemc-launcher.png"
}
