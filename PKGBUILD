# Maintainer: twgood <admin@eblanbrowser.ru>

pkgname=eblanbrowser-r
pkgver=0.1
pkgrel=1
pkgdesc="EBLAN Browser - a lightweight web browser for russian users."
arch=("any")
url="https://eblanbrowser.ru/"
license=("custom:eblan-browser")
categories=("network")

depends=(
    "python>=3.10"
    "python-pyqt6"
    "python-pyqt6-webengine"
    "qt6-webengine"
    "python-requests"
)

optdepends=(
    "ffmpeg: media playback"
    "nss: SSL support"
)

source=(
    "eblan-browser.zip::https://update.riba.click/eb/r/lastest.zip"
    "eblan.desktop"
)
md5sums=('SKIP' 'SKIP')

# Находим папку с EBLAN.py внутри распакованного архива
_find_src() {
    find "${srcdir}" -maxdepth 3 -name "EBLAN.py" | head -n1 | xargs dirname
}

prepare() {
    _eblan_src="$(_find_src)"
    if [[ -z "$_eblan_src" ]]; then
        echo "ERROR: EBLAN.py not found inside archive"
        return 1
    fi
    msg2 "Found EBLAN.py in: $_eblan_src"
}

package() {
    local _eblan_src
    _eblan_src="$(_find_src)"

    # --- Копируем файлы браузера в /opt/eblan-browser ---
    install -dm755 "${pkgdir}/opt/eblan-browser"
    cp -r "${_eblan_src}/." "${pkgdir}/opt/eblan-browser/"

    # --- Лаунчер /usr/bin/eblan ---
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/eblan" <<'EOF'
#!/usr/bin/env bash
exec python3 /opt/eblan-browser/EBLAN.py "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/eblan"

    # --- .desktop файл ---
    install -Dm644 "${srcdir}/eblan.desktop" \
        "${pkgdir}/usr/share/applications/eblan.desktop"

    # --- Иконки (если есть в архиве) ---
    for size in 64 128 256; do
        local icon="${_eblan_src}/images/logo${size}.png"
        if [[ -f "$icon" ]]; then
            install -Dm644 "$icon" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/eblan-browser.png"
        fi
    done

}

post_install() {
    update-desktop-database /usr/share/applications
    gtk-update-icon-cache -f /usr/share/icons/hicolor 2>/dev/null || true
}

post_upgrade() {
    post_install
}
