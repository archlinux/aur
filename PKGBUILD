# Maintainer: lucial <bordiyan20035@gmail.com>
pkgname=imagefinish
pkgver=2.1.1
pkgrel=1
pkgdesc="A PyQt6 image editor inspired by Photoshop"
arch=('any')
url="https://github.com/Lucia7Lunadottir/Image-Finish"
license=('MIT')
depends=('python' 'python-pyqt6' 'python-numpy')
makedepends=('git')

# ВАЖНО: жестко привязываем ветку исходников к текущему тегу версии
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

# Функция pkgver() УДАЛЕНА. Для релизных пакетов версия всегда статична.

package() {
    cd "$srcdir/$pkgname"

    # Файлы приложения (ИСПРАВЛЕНО: добавлена папка assets)
    install -dm755 "$pkgdir/usr/share/$pkgname"
    cp -r core locales tools ui utils brushes shapes assets \
        "$pkgdir/usr/share/$pkgname/"

    # Пустые папки для пользовательского контента
    install -dm755 "$pkgdir/usr/share/$pkgname/fonts"
    install -dm755 "$pkgdir/usr/share/$pkgname/patterns"

    install -m644 main.py         "$pkgdir/usr/share/$pkgname/"
    install -m644 settings.json   "$pkgdir/usr/share/$pkgname/"
    install -m644 $pkgname.png    "$pkgdir/usr/share/$pkgname/$pkgname.png"

    # Иконка системы
    install -Dm644 $pkgname.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 $pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

    # .desktop файл
    install -Dm644 imagefinish.desktop \
        "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Бинарник-лаунчер в /usr/bin
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" << 'LAUNCHER'
#!/bin/bash
exec python3 /usr/share/imagefinish/main.py "$@"
LAUNCHER
}
