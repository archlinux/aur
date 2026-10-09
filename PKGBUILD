# Maintainer: IILLUMINAT <iilluminatmnd@gmail.com>
pkgname=meander-bin
pkgver=2.8.14
pkgrel=1
pkgdesc="Interactive quest editor and player (Closed Source)"
arch=('x86_64')
url="https://github.com/IILLUMINATION/meanderPUBLIC"
license=('custom:proprietary')
depends=('gtk3' 'glib2')
provides=('meander')
conflicts=('meander')
options=('!strip')
source=("meander-${pkgver}-x86_64.AppImage::https://github.com/IILLUMINATION/meanderPUBLIC/releases/download/2.8.14%2B259/Meander-linux-x64.AppImage")
sha256sums=('7a55252ee3fbf4d6023cfe25637a149a1ec0e86cdbac13d65473829cefc018f3')

prepare() {
    chmod +x "${srcdir}/meander-${pkgver}-x86_64.AppImage"
    "${srcdir}/meander-${pkgver}-x86_64.AppImage" --appimage-extract
}

package() {
    # Копируем бинарник и файлы
    install -d "${pkgdir}/opt/meander"
    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/meander/"

    # Даем права на исполнение
    chmod +x "${pkgdir}/opt/meander/AppRun"
    chmod +x "${pkgdir}/opt/meander/canvas_app"

    # Создаем симлинк в /usr/bin
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/meander/AppRun" "${pkgdir}/usr/bin/meander"

    # Копируем .desktop файл
    install -Dm644 "${srcdir}/squashfs-root/canvas_app.desktop" "${pkgdir}/usr/share/applications/meander.desktop"
    
    # Исправляем Exec в .desktop, чтобы он запускал наш симлинк
    sed -i "s|Exec=canvas_app|Exec=meander|g" "${pkgdir}/usr/share/applications/meander.desktop"

    # Копируем иконку (берем из распакованного AppImage)
    install -Dm644 "${srcdir}/squashfs-root/canvas_app.png" "${pkgdir}/usr/share/pixmaps/canvas_app.png"
}
