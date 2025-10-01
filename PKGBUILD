# Maintainer: NotionMe <c.ubohyi.stanislav@student.uzhnu.edu.ua>
pkgname=zzz-mod-manager-git
pkgver=r4.6b91be6
pkgrel=1
pkgdesc="Modern mod manager for Zenless Zone Zero using Flutter"
arch=('x86_64')
url="https://github.com/NotionMe/Mod-manager"
license=('MIT')
depends=(
    'gtk3'
    'glib2'
    'libx11'
)
makedepends=(
    'git'
    'flutter'
    'clang'
    'cmake'
    'ninja'
    'pkgconf'
)
provides=('zzz-mod-manager')
conflicts=('zzz-mod-manager')
source=("git+https://github.com/NotionMe/Mod-manager.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/Mod-manager"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/Mod-manager/mod_manager_flutter"
    
    # Встановлюємо Flutter залежності
    export PUB_CACHE="$srcdir/pub_cache"
    flutter pub get
}

build() {
    cd "$srcdir/Mod-manager/mod_manager_flutter"
    
    # Експортуємо Flutter cache
    export PUB_CACHE="$srcdir/pub_cache"
    
    # Будуємо Flutter додаток для Linux
    flutter build linux --release
}

package() {
    cd "$srcdir/Mod-manager"
    
    # Створюємо директорії
    install -dm755 "$pkgdir/opt/zzz-mod-manager"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"
    
    # Копіюємо Flutter build
    cp -r mod_manager_flutter/build/linux/x64/release/bundle/* "$pkgdir/opt/zzz-mod-manager/"
    
    # Копіюємо іконку
    if [ -f "assets/icon.png" ]; then
        install -Dm644 assets/icon.png "$pkgdir/opt/zzz-mod-manager/data/flutter_assets/assets/icon.png"
        install -Dm644 assets/icon.png "$pkgdir/usr/share/pixmaps/zzz-mod-manager.png"
        install -Dm644 assets/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/zzz-mod-manager.png"
    fi
    
    # Примітка: mod_images тепер зберігаються в ~/.local/share/zzz-mod-manager/mod_images
    # Директорія буде створена автоматично при першому запуску застосунку
    
    # Створюємо .desktop файл
    cat > "$pkgdir/usr/share/applications/zzz-mod-manager.desktop" << 'EOF'
[Desktop Entry]
Name=ZZZ Mod Manager
Comment=Modern mod manager for Zenless Zone Zero
Exec=/opt/zzz-mod-manager/mod_manager_flutter
Icon=/opt/zzz-mod-manager/data/flutter_assets/assets/icon.png
Terminal=false
Type=Application
Categories=Utility;Game;
StartupNotify=true
Keywords=game;mod;zenless;zone;zero;
EOF
    
    # Створюємо wrapper скрипт для легкого запуску
    cat > "$pkgdir/usr/bin/zzz-mod-manager" << 'EOF'
#!/bin/bash
cd /opt/zzz-mod-manager
exec ./mod_manager_flutter "$@"
EOF
    
    chmod +x "$pkgdir/usr/bin/zzz-mod-manager"
    
    # Встановлюємо права на виконання
    chmod +x "$pkgdir/opt/zzz-mod-manager/mod_manager_flutter"
    
    # Копіюємо документацію якщо є
    if [ -f "AUR_GUIDE.md" ]; then
        install -Dm644 AUR_GUIDE.md "$pkgdir/usr/share/doc/zzz-mod-manager/AUR_GUIDE.md"
    fi
    if [ -f "FLATPAK_GUIDE.md" ]; then
        install -Dm644 FLATPAK_GUIDE.md "$pkgdir/usr/share/doc/zzz-mod-manager/FLATPAK_GUIDE.md"
    fi
    
    # Копіюємо ліцензію якщо є
    if [ -f "LICENSE" ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
