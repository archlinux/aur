# Maintainer: detestern <detestern@proton.me>
pkgname=karincore-git
pkgver=1.3.1.r28.95c910e
pkgrel=1
pkgdesc="KarinCore - Modern and secure proxy client"
arch=('x86_64')
url="https://github.com/detestern/KarinCore"
license=('MIT')

depends=('webkit2gtk-4.1' 'gtk3' 'cairo' 'pango' 'glib2' 'xray' 'openvpn' 'wireguard-tools')
makedepends=('npm' 'rust' 'cargo' 'git')
provides=('karincore')
conflicts=('karincore')

source=("KarinCore::git+https://github.com/detestern/KarinCore.git"
"karin-proxy-daemon.service")
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/KarinCore"
    printf "%s.r%s.%s" \
        "$(git describe --tags --abbrev=0 2>/dev/null | sed 's/^v//' || echo 0)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

# На SteamOS системный образ вырезает .pc-файлы и даже часть заголовков
# (/usr/include) для многих библиотек, хотя сами .so на месте и pacman
# формально считает пакеты установленными. Эта функция чинит это только
# для текущей сборки, не трогая систему, и не делает НИЧЕГО на обычном
# Arch, где все .pc уже присутствуют.
prepare() {
    STUB_DIR="$srcdir/pkgconfig-stubs"
    rm -rf "$STUB_DIR"
    mkdir -p "$STUB_DIR"

    is_steamos() {
        [ -f /etc/os-release ] && grep -qiE '^ID=(steamos|holo)' /etc/os-release
    }

    if ! is_steamos; then
        echo "Не SteamOS — пропускаю генерацию pkg-config заглушек."
        return 0
    fi

    echo "Обнаружена SteamOS — проверяю недостающие pkg-config файлы..."

    write_pc_if_missing() {
        local name="$1" version="$2" libs="$3" cflags="$4"
        if pkg-config --exists "$name" 2>/dev/null; then
            return 0
        fi
        echo "  -> генерирую заглушку для $name"
        cat > "$STUB_DIR/${name}.pc" << EOF
prefix=/usr
exec_prefix=\${prefix}
libdir=\${exec_prefix}/lib
includedir=\${prefix}/include

Name: ${name}
Description: Stub pkg-config file (dev metadata not shipped on SteamOS)
Version: ${version}
Libs: ${libs}
Cflags: ${cflags}
EOF
    }

    export PKG_CONFIG_PATH="/usr/lib/pkgconfig:/usr/share/pkgconfig"
    export PKG_CONFIG_LIBDIR="/usr/lib/pkgconfig:/usr/share/pkgconfig"

    write_pc_if_missing sysprof-capture-4 4.0.0 '' ''
    write_pc_if_missing glib-2.0 2.82.0 '-L${libdir} -lglib-2.0' '-I${includedir}/glib-2.0 -I${libdir}/glib-2.0/include'
    write_pc_if_missing gobject-2.0 2.82.0 '-L${libdir} -lgobject-2.0 -lglib-2.0' '-I${includedir}/glib-2.0 -I${libdir}/glib-2.0/include'
    write_pc_if_missing gio-2.0 2.82.0 '-L${libdir} -lgio-2.0 -lgobject-2.0 -lglib-2.0' '-I${includedir}/glib-2.0 -I${libdir}/glib-2.0/include'
    write_pc_if_missing gio-unix-2.0 2.82.0 '-L${libdir} -lgio-2.0 -lgobject-2.0 -lglib-2.0' '-I${includedir}/gio-unix-2.0'
    write_pc_if_missing gmodule-2.0 2.82.0 '-L${libdir} -lgmodule-2.0 -lglib-2.0' '-I${includedir}/glib-2.0 -I${libdir}/glib-2.0/include'
    write_pc_if_missing libffi 3.4.0 '-L${libdir} -lffi' '-I${includedir}'
    write_pc_if_missing zlib 1.3.1 '-L${libdir} -lz' '-I${includedir}'
    write_pc_if_missing mount 2.40.2 '-L${libdir} -lmount -lblkid' '-I${includedir}'
    write_pc_if_missing atk 2.38.0 '-L${libdir} -latk-1.0' '-I${includedir}/atk-1.0'
    write_pc_if_missing cairo 1.18.0 '-L${libdir} -lcairo' '-I${includedir}/cairo'
    write_pc_if_missing cairo-gobject 1.18.0 '-L${libdir} -lcairo-gobject -lcairo' '-I${includedir}/cairo'
    write_pc_if_missing epoxy 1.5.10 '-L${libdir} -lepoxy' '-I${includedir}'
    write_pc_if_missing fribidi 1.0.13 '-L${libdir} -lfribidi' '-I${includedir}/fribidi'
    write_pc_if_missing harfbuzz 8.0.0 '-L${libdir} -lharfbuzz' '-I${includedir}/harfbuzz'
    write_pc_if_missing gdk-pixbuf-2.0 2.42.10 '-L${libdir} -lgdk_pixbuf-2.0' '-I${includedir}/gdk-pixbuf-2.0'
    write_pc_if_missing pango 1.51.0 '-L${libdir} -lpango-1.0' '-I${includedir}/pango-1.0'
    write_pc_if_missing pangocairo 1.51.0 '-L${libdir} -lpangocairo-1.0 -lpango-1.0 -lcairo' '-I${includedir}/pango-1.0'
    write_pc_if_missing pangoft2 1.51.0 '-L${libdir} -lpangoft2-1.0 -lpango-1.0' '-I${includedir}/pango-1.0'
    write_pc_if_missing gail-3.0 3.24.0 '-L${libdir} -lgailutil-3' '-I${includedir}/gail-3.0'
    write_pc_if_missing fontconfig 2.14.0 '-L${libdir} -lfontconfig' '-I${includedir}'
    write_pc_if_missing freetype2 24.0.0 '-L${libdir} -lfreetype' '-I${includedir}/freetype2'
    write_pc_if_missing libxml-2.0 2.13.0 '-L${libdir} -lxml2' '-I${includedir}/libxml2'
    write_pc_if_missing libsoup-3.0 3.4.0 '-L${libdir} -lsoup-3.0' '-I${includedir}/libsoup-3.0'
    write_pc_if_missing gdk-3.0 3.24.0 '-L${libdir} -lgdk-3' '-I${includedir}/gtk-3.0'
    write_pc_if_missing gtk+-3.0 3.24.0 '-L${libdir} -lgtk-3 -lgdk-3' '-I${includedir}/gtk-3.0'
    write_pc_if_missing gdk-x11-3.0 3.24.0 '-L${libdir} -lgdk-3' '-I${includedir}/gtk-3.0'
    write_pc_if_missing openssl 3.0.0 '-L${libdir} -lssl -lcrypto' '-I${includedir}'
    write_pc_if_missing dbus-1 1.16.0 '-L${libdir} -ldbus-1' '-I${includedir}/dbus-1.0 -I${libdir}/dbus-1.0/include'
    write_pc_if_missing wayland-client 1.22.0 '-L${libdir} -lwayland-client' '-I${includedir}'
    write_pc_if_missing wayland-cursor 1.22.0 '-L${libdir} -lwayland-cursor' '-I${includedir}'
    write_pc_if_missing wayland-egl 1.22.0 '-L${libdir} -lwayland-egl' '-I${includedir}'
    write_pc_if_missing xkbcommon 1.6.0 '-L${libdir} -lxkbcommon' '-I${includedir}'

    # На некоторых образах SteamOS ниже перечисленные пакеты формально
    # числятся установленными в базе pacman, но их заголовочные файлы
    # физически вырезаны из образа — сборка (openssl-sys, cgo для Xray)
    # падает с "No such file or directory" на конкретных .h-файлах.
    #
    # PKGBUILD намеренно НЕ лечит это сам через sudo — сборка не должна
    # повышать привилегии и трогать систему в обход pacman. Вместо этого
    # мы обнаруживаем проблему и просим пользователя выполнить починку
    # самостоятельно, осознанно, одной командой, до повторного запуска.
    local missing_headers=()
    [ -f /usr/include/openssl/opensslv.h ] || missing_headers+=(openssl)
    [ -f /usr/include/errno.h ] || missing_headers+=(glibc)
    [ -f /usr/include/linux/errno.h ] || missing_headers+=(linux-api-headers)

    if [ ${#missing_headers[@]} -gt 0 ]; then
        echo ""
        echo "==> На этом образе SteamOS физически отсутствуют заголовочные файлы"
        echo "    для: ${missing_headers[*]} (хотя пакеты числятся установленными)."
        echo "    Выполните перед повторной сборкой:"
        echo ""
        echo "    sudo pacman -S --overwrite '/usr/include/*' ${missing_headers[*]}"
        echo ""
        exit 1
    fi
}

build() {
    cd "$srcdir/KarinCore"

    if [ -d "$srcdir/pkgconfig-stubs" ] && [ -n "$(ls -A "$srcdir/pkgconfig-stubs" 2>/dev/null)" ]; then
        export PKG_CONFIG_PATH="/usr/lib/pkgconfig:/usr/share/pkgconfig:$srcdir/pkgconfig-stubs"
        export PKG_CONFIG_LIBDIR="/usr/lib/pkgconfig:/usr/share/pkgconfig:$srcdir/pkgconfig-stubs"
    fi

    npm install
    npm run tauri build -- --no-bundle

    cd src-tauri
    cargo build --release --bin karin-proxy-daemon
}

package() {
    cd "$srcdir/KarinCore"

    install -Dm755 "src-tauri/target/release/karin-proxy" "$pkgdir/usr/bin/karincore"
    install -Dm755 "src-tauri/target/release/karin-proxy-daemon" "$pkgdir/usr/bin/karin-proxy-daemon"

    install -Dm644 "$srcdir/karin-proxy-daemon.service" "$pkgdir/usr/lib/systemd/system/karin-proxy-daemon.service"
    install -Dm755 "src-tauri/system/route.sh" "$pkgdir/etc/karin-proxy/route.sh"
    install -Dm440 "src-tauri/system/karincore-sudoers" "$pkgdir/etc/sudoers.d/zz-karincore"

    install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/pixmaps/karincore.png"
    mkdir -p "$pkgdir/usr/share/applications"
    cat <<EOF > "$pkgdir/usr/share/applications/karincore.desktop"
[Desktop Entry]
Type=Application
Name=KarinCore
Comment=Modern and secure proxy client
Exec=karincore
Icon=karincore
StartupWMClass=karin-proxy
Terminal=false
Categories=Network;Utility;
EOF
}
