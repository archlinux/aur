# Maintainer: Feakster <feakster at posteo dot eu>

pkgname=simplenote-electron-arm-bin
_pkgname=${pkgname%-electron-arm-bin}
pkgver=2.4.0
_appimage="simplenote-electron-${pkgver}-${CARCH}.AppImage"
pkgrel=5
pkgdesc='The simplest way to keep notes'
arch=('armv7h' 'aarch64')
url='https://github.com/Automattic/simplenote-electron'
license=('GPL2')
depends=(nss gtk3 libxss)
optdepends=(
    'libnotify: desktop notifications'
    'noto-fonts-emoji: emoji support'
    'ttf-joypixels: emoji support'
)
provides=('simplenote')
options=(!strip)
source_armv7h=("simplenote-electron-${pkgver}-armv7h.AppImage"::"${url}/releases/download/v${pkgver}/Simplenote-linux-${pkgver}-armv7l.AppImage")
source_aarch64=("simplenote-electron-${pkgver}-aarch64.AppImage"::"${url}/releases/download/v${pkgver}/Simplenote-linux-${pkgver}-arm64.AppImage")
noextract=($_appimage)
b2sums_armv7h=('d646487d3ea2bc4938803df7d7523b8b3eeba0076bfd922de5d7b65b6eef31c216de792fdf8f6e488d3d871d1a9bc81facdc2283aea88d076b3e6bf4e92564d0')
b2sums_aarch64=('50250e6250388ecf2091b02a981d0dd9113b649c751af844ce8ede3c5993774afe9283670d60530775a2005ee2309910b7ddeab3549b0d481f318527518d1bf7')

prepare() {
    # Go to Source Directory
    cd "$srcdir"

    # Mark AppImage as Executable
    chmod a+x $_appimage

    # Extract AppImage into squashfs-root Directory
    ./$_appimage --appimage-extract

    # Set Permissions for squashfs-root Filesystem Directories
    find squashfs-root -type d -exec chmod 755 {} +

    # Modify Desktop File
    sed -i -E "s|Exec=AppRun|Exec=/usr/bin/${_pkgname}|" squashfs-root/${_pkgname}.desktop
    sed -i '/^X-AppImage-Version=.*/d' squashfs-root/${_pkgname}.desktop
    sed -i '/^Path=.*/d' squashfs-root/${_pkgname}.desktop
    echo "Path=/opt/${_pkgname}" >> squashfs-root/${_pkgname}.desktop
}

package() {
    # Go to source directory
    cd "$srcdir"

    # Create Installation Directory Structure
    install -dm0755 "$pkgdir"/usr/bin
    install -dm0755 "$pkgdir"/opt/$_pkgname
    install -dm0755 "$pkgdir"/usr/share/icons

    # Install Icons
    cp -RL squashfs-root/usr/share/icons/hicolor "$pkgdir"/usr/share/icons/

    # Install Desktop File
    install -Dm644 squashfs-root/${_pkgname}.desktop -t "$pkgdir"/usr/share/applications/

    # Move AppImage Contents to /opt/$_pkgname
    cp -RLT squashfs-root "$pkgdir"/opt/$_pkgname
    
    # Symlink /usr/bin Executable to /opt/$_pkgname
    ln -s /opt/$_pkgname/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
