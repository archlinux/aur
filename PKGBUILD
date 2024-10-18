# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>
pkgname=nvidia-omniverse
pkgver=1.9.13.2760
pkgrel=1
pkgdesc="The platform for creating and operating metaverse applications."
arch=('x86_64')
url="https://www.nvidia.com/omniverse/"
license=('Custom: Nvidia')
provides=('omniverse')
depends=("electron"
         "nvidia"
         "mesa"
         "libxcomposite"
         "libxkbcommon"
         "bash"
         "libxrandr"
         "libxfixes"
         "libdrm"
         "dbus"
         "nss"
         "glib2"
         "gtk3"
         "nspr"
         "cairo"
         "libcups"
         "libxdamage"
         "hicolor-icon-theme"
         "alsa-lib"
         "gcc-libs"
         "libxcb"
         "at-spi2-core"
         "expat"
         "libxext"
         "pango"
         "libx11"
         "glibc"
         "libxcrypt-compat")
source=("https://install.launcher.omniverse.nvidia.com/installers/omniverse-launcher-linux.AppImage")
noextract=("$provides-launcher-linux.AppImage")
md5sums=('d43fbea53c6d4c7a2711a04411a33e2a')
options=('!strip')

prepare() {
    cd "${srcdir}"
    chmod +x "$provides-launcher-linux.AppImage"

    ./$provides-launcher-linux.AppImage --appimage-extract
}

pkgver() {
    cd squashfs-root
    grep 'X-AppImage-Version' omniverse-launcher.desktop | cut -d'=' -f2
}

package() {
    install -dm0755 "${pkgdir}/opt"

    mv squashfs-root "${pkgdir}/opt/$provides"
    chmod -R 755 "${pkgdir}/opt/$provides"

    sed -i 's|^Exec=AppRun --no-sandbox %U$|Exec=omniverse --no-sandbox %U|' "${pkgdir}/opt/$provides/omniverse-launcher.desktop"

    install -D "${pkgdir}/opt/$provides/usr/share/icons/hicolor/0x0/apps/omniverse-launcher.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/omniverse-launcher.png"
    install -D "${pkgdir}/opt/$provides/omniverse-launcher.desktop" "${pkgdir}/usr/share/applications/omniverse-launcher.desktop"

    rm "${pkgdir}/opt/omniverse/omniverse-launcher.desktop"

    rm -r "${pkgdir}/opt/$provides/usr"
    rm "${pkgdir}/opt/omniverse/.DirIcon" "${pkgdir}/opt/omniverse/omniverse-launcher.png"

    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/licenses"

    mv "${pkgdir}/opt/$provides/PACKAGE-LICENSES" "${pkgdir}/usr/share/licenses/$pkgname"

    ln -s "/opt/$provides/$provides-launcher" "${pkgdir}/usr/bin/$provides"
}
