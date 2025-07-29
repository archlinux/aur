# Maintainer: PoDiax <szymonender@gmail.com>

_pkgname=vs-launcher
_pkgver=1.5.5
_appimage="${_pkgname}-${_pkgver}.AppImage"

pkgbase="${_pkgname}"
pkgname="${_pkgname}-appimage"
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="Unofficial launcher and version manager for Vintage Story"
arch=('x86_64')
url="https://github.com/XurxoMF/vs-launcher"
license=('MIT')
depends=('fuse2')
options=(!strip)
source=("${_appimage}::https://github.com/XurxoMF/vs-launcher/releases/download/${_pkgver}/${_appimage}")
sha256sums=('e5c9826bad2277a82d7d88cd3993b4e8f3bb46834ce45b9b79af63da406b1840')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
    # Install AppImage into /opt
    install -Dm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}"

    # Create symlink to run via terminal
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"

    # Install .desktop file
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=VS Launcher
Exec=${_pkgname} %U
Terminal=false
Type=Application
Icon=${_pkgname}
StartupWMClass=VS Launcher
X-AppImage-Version=${pkgver}
Comment=Unofficial Vintage Story Launcher for... Vintage Story :)
Categories=Game;
EOF



    # Install icons of multiple sizes
    for size in 16 32 48 64 128 256; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
    done
}

