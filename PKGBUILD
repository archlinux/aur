# Maintainer: Ваше Имя <email@example.com>
pkgname=radmin-vpn
pkgver=0.3.4
pkgrel=1
pkgdesc="Radmin VPN — бесплатный VPN для игр и удалённого доступа (использует системный Wine)"
arch=('x86_64')
url="https://www.radmin-vpn.com/"
license=('custom:proprietary')
depends=('wine' 'glibc' 'gcc-libs' 'sudo' 'zenity')   # sudo — для создания TAP-устройства
makedepends=()
source=("https://github.com/baptisterajaut/radmin-vpn-linux/releases/download/v${pkgver}/RadminVPN-Linux-x86_64.AppImage")   # замените на реальный URL
sha256sums=(4362e98bc26c639790d737454dbb23376cd804ac02740aaf1f9c6fc21c7f3440)

prepare() {
    chmod +x "$srcdir"/*.AppImage
    cd "$srcdir"
    ./RadminVPN-Linux-x86_64.AppImage --appimage-extract >/dev/null
}

package() {
    # 1. Копируем всё содержимое usr/ в системный /usr
    cp -a "$srcdir/squashfs-root/usr/" "$pkgdir/usr/"

    # 2. Переименовываем run.sh → radmin-vpn
    mv "$pkgdir/usr/bin/run.sh" "$pkgdir/usr/bin/radmin-vpn"

    # 3. Правим скрипт:
    #    - заменяем BUILD_DIR на фиксированный путь к вспомогательным файлам
    #    - удаляем проверку на APPIMAGE (мы используем системный Wine)
    sed -i \
        -e 's|BUILD_DIR="${BUILD_DIR:-$DIR/build}"|BUILD_DIR="/usr/lib/radmin-vpn"|g' \
        -e 's|export WINEPREFIX="${WINEPREFIX:-$DIR/wineprefix}"|export WINEPREFIX="${WINEPREFIX:-$HOME/.local/share/radmin-vpn/wineprefix}"|g' \
        -e '/if \[ -n "\${APPIMAGE:-}" \]; then/,/fi/d' \
        -e 's|\./run.sh|radmin-vpn|g' \
        "$pkgdir/usr/bin/radmin-vpn"

    sed -i '/^BRIDGE_PID=""/a \
\
# --- Sudo wrapper with GUI fallback ---\
if ! [ -t 0 ]; then\
    sudo() {\
        if [ -z "${SUDO_PASSWORD:-}" ]; then\
            if command -v zenity >/dev/null 2>&1; then\
                SUDO_PASSWORD=$(zenity --password --title="Radmin VPN" --text="Enter your password to create TAP device:" 2>/dev/null)\
                if [ -z "$SUDO_PASSWORD" ]; then\
                    echo "sudo: password required" >&2; return 1;\
                fi\
            else\
                echo "sudo: no terminal and no zenity" >&2; return 1;\
            fi\
        fi\
        echo "$SUDO_PASSWORD" | command sudo -S "$@" 2>/dev/null;\
    };\
    export -f sudo;\
fi' "$pkgdir/usr/bin/radmin-vpn"
    # 4. Исправляем .desktop-файлы
    # Отключаем терминал для GUI-запуска
    sed -i 's/^Terminal=true/Terminal=false/' "$pkgdir/usr/share/applications/"*.desktop
    for desk in "$pkgdir/usr/share/applications/"*.desktop; do
        [ -f "$desk" ] && sed -i 's|Exec=AppRun|Exec=radmin-vpn|g' "$desk"
    done

    # 5. Убеждаемся, что скрипт исполняемый
    chmod 755 "$pkgdir/usr/bin/radmin-vpn"
}
