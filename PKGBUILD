# Maintainer: xxyangyoulin <xxyangyoulin@outlook.com>

pkgname=phpbox
pkgver=1.0.18
pkgrel=1
pkgdesc='GUI application to manage PHP Docker development environments (PyQt6, Fluent Design)'
arch=('any')
url='https://github.com/xxyangyoulin/phpbox'
license=('MIT')
conflicts=('phpbox-bin')
depends=('python' 'python-pyqt6' 'python-pyqt6-fluent-widgets' 'docker' 'hicolor-icon-theme')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f62e24014ff80fa2dd34970e7631b0ab71fa078a2d3d2936dbf3bb1db4ef0a4d')

package() {
    cd "$pkgname-$pkgver"

    # Python 源码 (main.py 通过 __file__ 相对定位 core/ui/resources)
    install -dm755 "$pkgdir/usr/share/phpbox"
    cp -a main.py core ui resources "$pkgdir/usr/share/phpbox/"

    # 预编译字节码
    /usr/bin/python -m compileall -q "$pkgdir/usr/share/phpbox"

    # 启动器 + pbox 别名
    install -Dm755 /dev/null "$pkgdir/usr/bin/phpbox"
    cat > "$pkgdir/usr/bin/phpbox" << 'WRAP'
#!/bin/sh
exec /usr/bin/python /usr/share/phpbox/main.py "$@"
WRAP
    ln -s phpbox "$pkgdir/usr/bin/pbox"

    # desktop 文件 + 图标
    install -Dm644 phpbox.desktop "$pkgdir/usr/share/applications/phpbox.desktop"
    install -Dm644 resources/icons/phpbox-256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/phpbox.png"
    install -Dm644 resources/icons/phpbox-tray.png "$pkgdir/usr/share/pixmaps/phpbox-tray.png"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
