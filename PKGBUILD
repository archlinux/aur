# Maintainer: Egor Kurochkin <itsegork@gmail.com>
pkgname=shellix
pkgver=1.1.2
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
makedepends=(
    'gettext'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('aad69e3e7f8bfe07b4dd5887000604a9af78498f87d14f8692d0bae3cf68c8be')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    for po in locale/*/LC_MESSAGES/*.po; do
        [ -f "$po" ] || continue
        mo="${po%.po}.mo"
        msgfmt -o "$mo" "$po"
    done
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    cp -r src "${pkgdir}/usr/share/${pkgname}/"
    python3 -m compileall -q "${pkgdir}/usr/share/${pkgname}/src"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'EOF'
#!/bin/sh
exec python3 /usr/share/shellix/src/main.py "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    for mo in locale/*/LC_MESSAGES/*.mo; do
        [ -f "$mo" ] || continue
        lang=$(echo "$mo" | cut -d'/' -f2)
        install -Dm644 "$mo" "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/${pkgname}.mo"
    done

    if [ -f "src/shellix_nautilus.py" ]; then
        install -Dm644 src/shellix_nautilus.py \
            "${pkgdir}/usr/share/nautilus-python/extensions/shellix_nautilus.py"
    fi

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
Name[ru]=Открыть в Shellix
Icon=ru.itsegork.shellix
Exec=${pkgname} %f
EOF

    local icon_src="data/icons/ru.itsegork.shellix.svg"
    if [ -f "$icon_src" ]; then
        install -Dm644 "$icon_src" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/ru.itsegork.shellix.svg"
        install -Dm644 "$icon_src" "${pkgdir}/usr/share/pixmaps/ru.itsegork.shellix.svg"
    fi

    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/ru.itsegork.shellix.desktop" << EOF
[Desktop Entry]
Name=Shellix
Comment=${pkgdesc}
Comment[ru]=Виртуальный терминал для Linux
Exec=${pkgname} %f
Icon=ru.itsegork.shellix
Terminal=false
Type=Application
Categories=Development;System;TerminalEmulator;
Keywords=console;terminal;manager;shell;vte;
StartupWMClass=ru.itsegork.shellix
MimeType=inode/directory;
Actions=new-window;

[Desktop Action new-window]
Name=New Window
Name[ru]=Новое окно
Exec=${pkgname}
EOF

    if [ -f "LICENSE" ]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
