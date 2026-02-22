# Maintainer: Nikita <nikitamkrotov@gmail.com>
pkgname=slavweb-electron
pkgver=1.0.0
pkgrel=1
pkgdesc="Кроссплатформенное десктопное приложение на Electron для SlavWEB"
arch=('x86_64')
url="https://github.com/gtinikita203/linux-unpacked-slav"
license=('MIT')
depends=('gtk3' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss' 'dbus' 'at-spi2-atk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gtinikita203/linux-unpacked-slav/releases/download/$pkgver/slavweb-electron-$pkgver-linux-unpacked.tar.gz")
sha256sums=('732e5ef78e29239cefc4a11185aa85bc3ea85586e3715e63eb49983f4babb9db')

package() {
    cd "$srcdir"
    
    # Создаём директорию установки
    install -d "$pkgdir/opt/$pkgname"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/icons/hicolor/512x512/apps"
    
    # Копируем все файлы приложения
    cp -r "$srcdir/$pkgname-$pkgver-linux-unpacked/"* "$pkgdir/opt/$pkgname/"
    
    # Создаём симлинк на исполняемый файл
    ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
    
    # Создаём .desktop файл
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=SlavWEB Electron
Comment=Кроссплатформенное десктопное приложение на Electron для SlavWEB
Exec=/opt/$pkgname/$pkgname %U
Icon=$pkgname
Type=Application
Categories=Network;WebBrowser;
StartupNotify=true
EOF
    
    # Копируем иконку
    if [ -f "$pkgdir/opt/$pkgname/resources/app/assets/icon.png" ]; then
        install -Dm644 "$pkgdir/opt/$pkgname/resources/app/assets/icon.png" \
                       "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    elif [ -f "$pkgdir/opt/$pkgname/icon.png" ]; then
        install -Dm644 "$pkgdir/opt/$pkgname/icon.png" \
                       "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    fi
}
