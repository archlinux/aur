# Maintainer: GANPI <some.kind@of.mail>
pkgname=yarc-launcher
pkgver=0.2.0
_appimagename=${pkgname}_${pkgver}_amd64
pkgrel=1
pkgdesc="The official launcher for YARG (a.k.a. Yet Another Launcher or YAL)"
arch=(x86_64)
url=https://github.com/YARC-Official/YARC-Launcher
license=("custom: YARG License")
depends=(openssl-1.1 webkit2gtk)
optdepends=(
    "hidapi: Support for HID devices in game"
)
source=(
    ${url}/releases/download/v${pkgver}/${_appimagename}.AppImage.tar.gz
    https://raw.githubusercontent.com/YARC-Official/YARC-Launcher/master/LICENSE
)
sha256sums=(
    1e7930331c63fd9df8a54a0ed1028e18af6eecce4ad7f25bb2c05ae08c1c97ee
    c4660da2255accdcdee8346b065fc7e4e6b354c5e61d05f3c1c19ff62acd0c01
)

prepare() {
    ./${_appimagename}.AppImage --appimage-extract
}

build() {
    # Add game category and remove comment
    sed -i "2 s/=/=Game;/; 3 s/A Tauri App//" squashfs-root/usr/share/applications/${pkgname}.desktop
}

package() {
    # .AppImage
    # install -Dm755 ${_appimagename}.AppImage ${pkgdir}/opt/${pkgname}/${pkgname}.AppImage

    # Binary
    install -Dm755 squashfs-root/usr/bin/${pkgname} ${pkgdir}/usr/bin/${pkgname}

    # 69-hid.rules
    install -dm755 ${pkgdir}/etc/udev/rules.d/

    echo 'KERNEL=="hidraw*", TAG+="uaccess"' > ${pkgdir}/etc/udev/rules.d/69-hid.rules

    # .desktop
    install -Dm644 squashfs-root/usr/share/applications/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

    # Icons
    for _size in 32x32 128x128 256x256@2; do
        install -Dm644 squashfs-root/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png ${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png
    done

    # LICENSE
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}