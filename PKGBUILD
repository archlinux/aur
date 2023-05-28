# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>
pkgname=nvidia-omniverse
pkgver=1.8.7
pkgrel=1
pkgdesc="The platform for creating and operating metaverse applications."
arch=('x86_64')
url="https://www.nvidia.com/omniverse/"
license=('Custom: Nvidia')
provides=('omniverse')
depends=("electron" "nvidia")
source=("https://install.launcher.omniverse.nvidia.com/installers/omniverse-launcher-linux.AppImage")
noextract=("$provides-launcher-linux.AppImage")
md5sums=('1eca99565b68a31d1a8a91dfd35afce4')
options=('!strip')

prepare() {
  cd "${srcdir}"
  chmod +x "$provides-launcher-linux.AppImage"
}

package() {
    install -dm0755 "${pkgdir}/opt"

    ./$provides-launcher-linux.AppImage --appimage-extract

    mv squashfs-root "${pkgdir}/opt/$provides"
    chmod -R 755 ${pkgdir}/opt/omniverse

    sed -i 's|^Exec=AppRun --no-sandbox %U$|Exec=omniverse --no-sandbox %U|' "${pkgdir}/opt/$provides/omniverse-launcher.desktop"


#     mv "${pkgdir}/opt/$provides/usr" "${pkgdir}/usr"
    install -D ${pkgdir}/opt/$provides/usr/share/icons/hicolor/0x0/apps/omniverse-launcher.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/omniverse-launcher.png"
    install -D "${pkgdir}/opt/$provides/omniverse-launcher.desktop" "${pkgdir}/usr/share/applications/omniverse-launcher.desktop"

    mkdir -p "${pkgdir}/usr/bin"

    ln -s "/opt/$provides/$provides-launcher" "${pkgdir}/usr/bin/$provides"

}
