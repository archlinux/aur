# Maintainer: Egor Kurochkin <itsegork@gmail.com>
pkgname=seekerix
pkgver=0.1.0
pkgrel=1
pkgdesc="Unofficial chat client for DeepSeek API, written in Python using GTK4 and Libadwaita"
arch=('any')
url="https://github.com/itsegork/seekerix"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'python-openai'
    'python-markdown'
    'gtk4'
    'libadwaita'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d589aa9520220d947d6bc8da1f588622204ac4b493f2142bcc2488fc03b3d59b')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    cp -r main.py "${pkgdir}/usr/share/${pkgname}/"
    cp -r data/icons "${pkgdir}/usr/share/${pkgname}/icons"
    python3 -m compileall -q "${pkgdir}/usr/share/${pkgname}/main.py"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'EOF'
#!/bin/sh
exec python3 /usr/share/seekerix/main.py "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    local icon_src="data/icons/ru.itsegork.seekerix.svg"
    if [ -f "$icon_src" ]; then
        install -Dm644 "$icon_src" \
            "${pkgdir}/usr/share/icons/hicolor/scalable/apps/ru.itsegork.seekerix.svg"
        install -Dm644 "$icon_src" \
            "${pkgdir}/usr/share/pixmaps/ru.itsegork.seekerix.svg"
    fi

    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/ru.itsegork.seekerix.desktop" << EOF
[Desktop Entry]
Name=Seekerix
Comment=${pkgdesc}
Comment[ru]=Неофициальный клиент DeepSeek API
Exec=${pkgname}
Icon=ru.itsegork.seekerix
Terminal=false
Type=Application
Categories=Network;Chat;Utility;
Keywords=deepseek;ai;chat;llm;gpt;
StartupWMClass=ru.itsegork.seekerix
EOF

    if [ -f "LICENSE" ]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}