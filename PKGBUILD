pkgname=xjtutoolbox
pkgver=1.2.1
pkgrel=1
pkgdesc="XJTUToolBox with bundled Python library for Arch Linux"
arch=('x86_64')
url="https://github.com/yan-xiaoo/XJTUToolBox"
license=('MIT')
depends=('python' 'gtk3' 'webkit2gtk' 'libnotify')
makedepends=('git' 'python' 'python-virtualenv' 'python-pillow')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e13d1ba8efc77ad0777cc0239ae78f9ff8b910baed77f758cfab98bc50697428')

prepare() {
    cd "$srcdir/XJTUToolBox-$pkgver"
    python -m venv .venv
    source .venv/bin/activate
    pip install --upgrade pip
    pip install -r requirements.txt
    pip install pyinstaller
}

build() {
    cd "$srcdir/XJTUToolBox-$pkgver"
    source .venv/bin/activate

    # 获取系统 Python 共享库路径
    libpython=$(python3 -c "import sysconfig; print(sysconfig.get_config_var('LIBDIR') + '/libpython' + sysconfig.get_config_var('VERSION') + '.so.1.0')")
    echo "Using libpython: $libpython"

    # 打包主程序（单文件）
    pyinstaller --clean --onefile \
        --name XJTUToolbox \
        --add-binary "$libpython:." \
        --collect-datas=fake_useragent \
        --add-data "assets:assets" \
        --add-data "ehall/templates:ehall/templates" \
        --icon "assets/icons/main_icon.ico" \
        --hidden-import plyer.platforms.linux.notification \
        app.py

    # 打包 Updater（可选）
    pyinstaller --clean --onefile \
        --name "XJTUToolbox Updater" \
        --add-binary "$libpython:." \
        --icon "$srcdir/XJTUToolBox-$pkgver/assets/icons/updater_icon.ico" \
        updater.py
}

package() {
    echo $srcdir
    # 安装主程序
    install -Dm755 "$srcdir/XJTUToolBox-$pkgver/dist/XJTUToolbox" "$pkgdir/usr/bin/xjtutoolbox"

    # 安装 Updater
    install -Dm755 "$srcdir/XJTUToolBox-$pkgver/dist/XJTUToolbox Updater" "$pkgdir/usr/bin/xjtutoolbox-updater"

    # 安装图标、文档和桌面文件
    install -Dm644 "$srcdir/XJTUToolBox-$pkgver/assets/icons/main_icon.ico" "$pkgdir/usr/share/pixmaps/xjtutoolbox.ico"
    install -Dm644 "$srcdir/XJTUToolBox-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/XJTUToolBox-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/xjtutoolbox.desktop" <<EOF
[Desktop Entry]
Name=XJTUToolBox
Exec=xjtutoolbox
Icon=xjtutoolbox
Type=Application
Categories=Utility;Education;
EOF
}
