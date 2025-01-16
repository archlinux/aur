# Maintainer: Chizuru-Kagurazaka <chizuru-mtf@outlook.com>
# Maintainer: bilibili_xiaok <the_xiaok@qq.com>
# Maintainer: Vova-K <v1mkss.m@gmail.com>

pkgname=xmcl-launcher
pkgver=0.48.5
pkgrel=1
pkgdesc="X Minecraft Launcher - A modern Minecraft launcher"
arch=('x86_64' 'aarch64')
provides=('xmcl')
url="https://xmcl.app/"
license=('MIT')
conflicts=('xmcl-launcher-bin')
optdepends=('jre8-openjdk: Minimum requirement for launching older game versions'
'jre11-openjdk: Recommended Java version for launching versions 1.12-1.17'
'jre17-openjdk: Recommended Java version for launching version 1.17 and above'
'jre22-openjdk: Recommended Java version for launching version 1.20.5+ and above')

package() {
    cd "$srcdir"

    mkdir -p temp
    cd temp

    # Download and extract the package
    curl -L "https://github.com/Voxelum/x-minecraft-launcher/releases/download/v${pkgver}/xmcl-${pkgver}-${CARCH}.pacman" -o package.pacman
    bsdtar -xf package.pacman

    # Create required directories in pkgdir
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/opt"

    # Copy only the needed directories, excluding metadata files
    cp -r opt/* "${pkgdir}/opt/"
    cp -r usr/* "${pkgdir}/usr/" 2>/dev/null || true

    # Create symlink in /usr/bin
    ln -sf "/opt/xmcl/xmcl" "${pkgdir}/usr/bin/xmcl"

    # Set permissions
    chmod 755 "${pkgdir}/opt/xmcl/xmcl"
    chmod 755 "${pkgdir}/opt/xmcl/chrome-sandbox"

    # Clean up
    cd ..
    rm -rf temp
}
