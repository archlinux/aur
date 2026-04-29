# Maintainer: Jose <josrebe333@gmail.com>
pkgname=bookos-settings
pkgver=0.4.0
pkgrel=1
pkgdesc="BookOS Settings — aplicación de ajustes para KDE Plasma con BookOS (o otros sistemas)"
arch=('x86_64')
url="https://github.com/Evelynx08/BookOS-Settings"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3')
optdepends=(
    'colord: soporte de perfiles ICC'
    'kscreen: control de pantalla (kscreen-doctor)'
    'qdbus6: control de brillo vía KDE D-Bus'
    'python: búsqueda semántica local'
    'inotify-tools: watcher de búsqueda semántica'
    'python-dbus: plugin KRunner búsqueda semántica'
    'python-gobject: plugin KRunner búsqueda semántica'
)

# Ahora el código se baja de GitHub automáticamente
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Evelynx08/BookOS-Settings/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9592b9b0caab0853e6d8261a7d7d0071ff3f9a830ea0aec5e5ab4ee8f3a6cc3f')

# NOTA: La función build() y makedepends han sido eliminadas.
# De esta forma no compila nada y se instala en un segundo.

package() {
    # Definimos las rutas relativas al directorio de compilación
    local _builddir="${srcdir}/BookOS-Settings-${pkgver}"
    local _bin="${_builddir}/src-tauri/target/release"
    local _extra="${_builddir}/src-tauri/extra"
    local _search="${_builddir}/src-tauri/extra/search"
    local _src="${_builddir}/src"

    # Binary (Coge directamente el que ya subiste a tu GitHub)
    install -Dm755 "$_bin/bookos-settings" \
        "$pkgdir/usr/bin/bookos-settings"

    # Desktop entry
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/bookos-settings.desktop" << EOF
[Desktop Entry]
Name=BookOS Settings
Name[es]=Ajustes de BookOS
Comment=Settings for BookOS KDE Plasma
Exec=bookos-settings
Icon=bookos-settings
Terminal=false
Type=Application
Categories=Settings;
StartupWMClass=bookos-settings
EOF

    # Icons
    install -Dm644 "$_src/assets/settings.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/bookos-settings.png"
    install -Dm644 "$_src/assets/settings.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/bookos-settings.svg"

    # Systemd system units
    install -Dm644 "$_extra/bookos-battery-adaptive.service" \
        "$pkgdir/usr/lib/systemd/system/bookos-battery-adaptive.service"
    install -Dm644 "$_extra/bookos-battery-adaptive.timer" \
        "$pkgdir/usr/lib/systemd/system/bookos-battery-adaptive.timer"
    install -Dm644 "$_extra/bookos-battery-logger.service" \
        "$pkgdir/usr/lib/systemd/system/bookos-battery-logger.service"
    install -Dm644 "$_extra/bookos-battery-logger.timer" \
        "$pkgdir/usr/lib/systemd/system/bookos-battery-logger.timer"
    install -Dm644 "$_extra/bookos-hw-perms.service" \
        "$pkgdir/usr/lib/systemd/system/bookos-hw-perms.service"
    install -Dm644 "$_extra/bookos-thermal-logger.service" \
        "$pkgdir/usr/lib/systemd/system/bookos-thermal-logger.service"

    # Systemd user units
    install -Dm644 "$_search/bookos-krunner.service" \
        "$pkgdir/usr/lib/systemd/user/bookos-krunner.service"
    install -Dm644 "$_search/bookos-search-reindex.service" \
        "$pkgdir/usr/lib/systemd/user/bookos-search-reindex.service"
    install -Dm644 "$_search/bookos-search-reindex.timer" \
        "$pkgdir/usr/lib/systemd/user/bookos-search-reindex.timer"
    install -Dm644 "$_search/bookos-search-watcher.service" \
        "$pkgdir/usr/lib/systemd/user/bookos-search-watcher.service"

    # udev rules
    install -Dm644 "$_extra/99-bookos-power.rules" \
        "$pkgdir/usr/lib/udev/rules.d/99-bookos-power.rules"

    # Shell scripts
    install -Dm755 "$_extra/bookos-battery-adaptive.sh" \
        "$pkgdir/usr/lib/bookos/bookos-battery-adaptive.sh"
    install -Dm755 "$_extra/bookos-battery-logger.sh" \
        "$pkgdir/usr/lib/bookos/bookos-battery-logger.sh"
    install -Dm755 "$_extra/bookos-thermal-logger.sh" \
        "$pkgdir/usr/lib/bookos/bookos-thermal-logger.sh"

    # D-Bus service
    install -Dm644 "$_search/org.bookos.SemanticSearch.service" \
        "$pkgdir/usr/share/dbus-1/services/org.bookos.SemanticSearch.service"

    # KRunner plugin
    install -Dm644 "$_search/bookos-semantic-krunner.desktop" \
        "$pkgdir/usr/share/krunner/dbusplugins/bookos-semantic-krunner.desktop"

    # bookos-search scripts
    install -Dm755 "$_search/bookos-krunner.py"  "$pkgdir/opt/bookos-search/bookos-krunner.py"
    install -Dm755 "$_search/buscar.py"           "$pkgdir/opt/bookos-search/buscar.py"
    install -Dm755 "$_search/indexador.py"        "$pkgdir/opt/bookos-search/indexador.py"
    install -Dm755 "$_search/setup.sh"            "$pkgdir/opt/bookos-search/setup.sh"
    install -Dm755 "$_search/watcher.sh"          "$pkgdir/opt/bookos-search/watcher.sh"
}
