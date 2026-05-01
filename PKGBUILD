# Maintainer: RimuruTemp1421 <daser1421official@gmail.com>

pkgname=anihot-app
pkgver=6.0.11
pkgrel=1
pkgdesc="Linux client for AniHot anime streaming app"
arch=('x86_64')
url="https://github.com/MrGlany/AniHotAppPC"
license=('custom')
depends=('glibc' 'gtk3' 'bash' 'sqlite3')
options=('!debug')
source=("anihot-${pkgver}.zip::https://github.com/MrGlany/AniHotAppPC/releases/download/${pkgver}r/${pkgver}-linux.zip")
sha256sums=('30dff464f40f13f28c387fbca0ebfc5370f74036731de7e50402265eb93ed5b8')

# Функция, выполняемая перед удалением пакета (чистим остатки)
pre_remove() {
    rm -rf /usr/lib/anihot-app
}

package() {
    cd "$srcdir"

    # Удаляем ненужный апдейтер
    rm -f anihot_updater

    # Создаём структуру каталогов
    install -d "$pkgdir/usr/lib/$pkgname"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"

    # Копируем файлы приложения
    cp -r lib share data "$pkgdir/usr/lib/$pkgname/"
    cp "AniHot App" "$pkgdir/usr/lib/$pkgname/"

    # Переименовываем бинарник для удобства
    mv "$pkgdir/usr/lib/$pkgname/AniHot App" "$pkgdir/usr/lib/$pkgname/anihot-app"

    # Создаём скрипт для запуска из терминала (обёртка)
    cat > "$pkgdir/usr/bin/anihot" << 'EOF'
#!/bin/bash
cd /usr/lib/anihot-app
export LD_LIBRARY_PATH="/usr/lib/anihot-app/lib:${LD_LIBRARY_PATH}"
exec ./anihot-app "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/anihot"

    # Создаём новый .desktop файл, со старым не работало
    cat > "$pkgdir/usr/share/applications/anihot.desktop" << 'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=AniHot App
Comment=AniHot App
Exec=bash -c "cd /usr/lib/anihot-app && LD_LIBRARY_PATH=lib ./anihot-app"
Icon=com.anihot.anihot
Terminal=false
Categories=Video;AudioVideo;Player;
StartupNotify=true
StartupWMClass=com.anihot.anihot
EOF

    # Копируем иконку из архива
    # Если иконка лежит в share/icons/hicolor/256x256/apps/com.anihot.anihot.png
    if [ -f "$srcdir/share/icons/hicolor/256x256/apps/com.anihot.anihot.png" ]; then
        cp "$srcdir/share/icons/hicolor/256x256/apps/com.anihot.anihot.png" \
           "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.anihot.anihot.png"
    else
        # Если иконка в другом месте, ищем
        find "$srcdir" -name "*.png" -path "*/256x256/apps/*" -exec cp {} "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.anihot.anihot.png" \;
    fi
}
