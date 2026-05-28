# Maintainer: Egor Kurochkin <itsegork@gmail.com>

pkgname=shellix
pkgver=1.0.6
pkgrel=1
pkgdesc="Virtual terminal for Linux with tab support and customizable options"
arch=('any')
url="https://github.com/itsegork/shellix"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'python-requests'
    'gtk4'
    'libadwaita'
    'vte4'
    'python-psutil'
    'cairo'
    'pango'
    'ttf-jetbrains-mono-nerd'
    'conspy'
    'nautilus-python'
)
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
# Хеш-сумма сгенерируется автоматически на следующем шаге
sha256sums=('dceb322db7eaf6e71cb54863bb62ec2c184c29a89e7f51a38e047a1c107824df')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Создание системных директорий
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/nautilus-python/extensions"

    # Установка расширения для Nautilus
    install -m644 src/shellix_nautilus.py \
        "${pkgdir}/usr/share/nautilus-python/extensions/shellix_nautilus.py"
    
    # Копирование исходного кода
    cp -r src "${pkgdir}/usr/share/${pkgname}/"
    
    # Создание исполняемого скрипта запуска
    echo -e "#!/bin/bash\nexec python3 /usr/share/${pkgname}/src/main.py \"\$@\"" > "${pkgdir}/usr/bin/${pkgname}"
    chmod +x "${pkgdir}/usr/bin/${pkgname}"

    # Установка иконок
    local icon_src="data/icons/ru.itsegork.shellix.svg"
    if [ -f "$icon_src" ]; then
        install -Dm644 "$icon_src" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/ru.itsegork.shellix.svg"
        install -Dm644 "$icon_src" "${pkgdir}/usr/share/pixmaps/ru.itsegork.shellix.svg"
    fi

    # Установка .desktop файла для GNOME/XFCE/и др.
    cat > "${pkgdir}/usr/share/applications/ru.itsegork.shellix.desktop" << EOF
[Desktop Entry]
Name=Shellix
Comment=${pkgdesc}
Exec=${pkgname} %f
Icon=ru.itsegork.shellix
Terminal=false
Type=Application
Categories=Development;System;TerminalEmulator;
Keywords=console;terminal;manager;shell;vte;
StartupWMClass=Shellix
MimeType=inode/directory;
Actions=new-window;

[Desktop Action new-window]
Name=Open in Shellix
Exec=${pkgname} %f
EOF

    # Установка интеграции для KDE Dolphin
    install -dm755 "${pkgdir}/usr/share/kio/servicemenus"
    cat > "${pkgdir}/usr/share/kio/servicemenus/ru.itsegork.shellix.desktop" << EOF
[Desktop Entry]
Type=Service
X-KDE-ServiceTypes=KonqPopupMenu/Plugin
MimeType=inode/directory;
Actions=openInShellix
X-KDE-Priority=TopLevel

[Desktop Action openInShellix]
Name=Open in Shellix
Icon=ru.itsegork.shellix
Exec=${pkgname} %f
EOF

    # Установка лицензии (требование Arch Linux)
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
