# Maintainer: lucial <bordiyan20035@gmail.com>
pkgname=imagefinish
pkgver=1.1.2
pkgrel=6
pkgdesc="Image Finish - A PyQt6 image editor inspired by Photoshop"
arch=('any')
url="https://github.com/7Lucia7Lokidottir7/Linux-Photoshop"
license=('MIT')
depends=('python' 'python-pyqt6' 'python-numpy')
#optdepends=('python-numpy: faster pixel operations')
makedepends=('git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags --long 2>/dev/null \
        | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
        | grep . \
        || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"

    # Файлы приложения
    # Файлы приложения
    install -dm755 "$pkgdir/usr/share/$pkgname"
    cp -r core locales tools ui utils brushes shapes \
        "$pkgdir/usr/share/$pkgname/"
    install -dm755 "$pkgdir/usr/share/$pkgname/fonts"
    install -dm755 "$pkgdir/usr/share/$pkgname/patterns"
    install -m644 main.py         "$pkgdir/usr/share/$pkgname/"
    install -m644 settings.json   "$pkgdir/usr/share/$pkgname/"

    # Иконка
    install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

    # .desktop
    install -Dm644 imagefinish.desktop \
        "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Лаунчер в /usr/bin
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" << 'LAUNCHER'
#!/bin/bash
exec python3 /usr/share/imagefinish/main.py "$@"
LAUNCHER
}
