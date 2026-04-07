# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Qwen 3.6 (Alibaba).

pkgname=retrom-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Your own private cloud game-library service (prebuilt binary)"
arch=('x86_64')
url="https://github.com/JMBeresford/retrom"
license=('GPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('retrom')
conflicts=('retrom' 'retrom-git')
options=('!strip')

source=("${pkgname}-${pkgver}.deb::https://github.com/JMBeresford/retrom/releases/download/v${pkgver}/Retrom_${pkgver}_amd64.deb")
sha256sums=('5ebf0e666fa2f92c5fcd34142d2c3d03dd161a9ac1f48ecb6fda8eb1db89d818')

package() {
    # Извлекаем data.tar.gz из .deb
    cd "${srcdir}"
    ar x "${srcdir}/../retrom-bin-${pkgver}.deb" data.tar.gz 2>/dev/null || \
        ar x "${pkgname}-${pkgver}.deb" data.tar.gz
    
    tar -xzf data.tar.gz -C "${pkgdir}"

    # Переименовываем бинарник
    mv "${pkgdir}/usr/bin/Retrom" "${pkgdir}/usr/bin/retrom"

    # Правим desktop файл
    sed -i 's|Exec=Retrom|Exec=retrom|g' "${pkgdir}/usr/share/applications/Retrom.desktop"
    mv "${pkgdir}/usr/share/applications/Retrom.desktop" \
        "${pkgdir}/usr/share/applications/retrom.desktop"

    # Переименовываем иконки
    mv "${pkgdir}/usr/share/icons/hicolor/32x32/apps/Retrom.png" \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/retrom.png"
    mv "${pkgdir}/usr/share/icons/hicolor/128x128/apps/Retrom.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/retrom.png"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    mv "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/Retrom.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/retrom.png"

    # Удаляем временный файл
    rm -f "${srcdir}/data.tar.gz"
}
