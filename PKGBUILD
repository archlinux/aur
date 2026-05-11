# Maintainer: LurkHub <LurkHub@yandex.ru>
pkgname=sovet
pkgver=2.15.2
pkgrel=1
pkgdesc="ЗАЩИЩЕННЫЙ МЕССЕНДЖЕР // АНОНИМНОСТЬ И БЕЗОПАСНОСТЬ"
arch=('x86_64')
url="https://sovetchat.ru"
license=('custom')
depends=('fuse2')
options=('!strip')
source_x86_64=("Soviet_${pkgver}_amd64.AppImage::https://updates.sovetchat.ru/downloads/Soviet_${pkgver}_amd64.AppImage")
sha256sums_x86_64=('21944a412066b77ae1e00a322a94d03b7b2e6ba0b23ac16d8ed8a84c19473b2c')

prepare() {
    chmod +x "Soviet_${pkgver}_amd64.AppImage"
    ./"Soviet_${pkgver}_amd64.AppImage" --appimage-extract >/dev/null 2>&1
}

package() {
    install -dm755 "${pkgdir}/opt/sovet"
    install -Dm755 "Soviet_${pkgver}_amd64.AppImage" "${pkgdir}/opt/sovet/sovet.AppImage"

    # Иконка
    install -Dm644 squashfs-root/sovietmsg.png \
        "${pkgdir}/usr/share/pixmaps/sovet.png"

    # Ярлык в меню
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/sovet.desktop" << EOF
[Desktop Entry]
Name=Совет
Comment=ЗАЩИЩЕННЫЙ МЕССЕНДЖЕР
Exec=/opt/sovet/sovet.AppImage
Icon=sovet
Type=Application
Categories=Network;Chat;
StartupWMClass=sovietmsg
EOF

    # Обёртка в PATH
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/sovet" << 'EOF'
#!/bin/bash
exec /opt/sovet/sovet.AppImage "$@"
EOF
}
