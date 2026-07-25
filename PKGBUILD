# Maintainer: steven (yakuda) <yakuda@outlook.de>
# DC Yakuda_nya_owo
# PKGBUILD fuer yakuda-connect — VR-Launcher fuer WiVRn/WayVR (Arch Linux)
#
# Installieren (zieht alle Abhaengigkeiten automatisch):  yay -S yakuda-connect
#
# Haengt an einem GitHub-Tag, nicht am main-Branch.
#
# ACHTUNG: Diese Datei ist nur die KOPIE fuers Projekt.
# Das echte AUR-Paket liegt in ~/yakuda-connect (eigenes Git-Repo).
# Von dort wird gepusht — nicht von hier.

pkgname=yakuda-connect
pkgver=1.1.3
pkgrel=1
pkgdesc="WiVRn VR management software with gaming optimization and OpenXR/OpenVR fixes"
arch=('any')
url="https://github.com/yakuda-stack/yakuda-connect"
license=('GPL-3.0-or-later')
# Pflicht-Abhaengigkeiten -> werden automatisch mitinstalliert:
depends=('python' 'pyside6' 'python-setproctitle')
# Optionale Laufzeit-Werkzeuge (das Tool ruft sie auf, falls vorhanden):
optdepends=('iproute2: Headset-Verbindungserkennung (ss)'
            'libpulse: Headset-Verbindungserkennung (pactl)'
            'polkit: Wiederherstellen von System-VR-Dateien (pkexec)'
            'git: Herunterladen des WayVR-Overlay-Designs'
            'curl: Alternative zum Design-Download (falls kein git)'
            'playerctl: Media-Tasten in der WayVR-Watch'
            'yay: Installation der Tools ueber den AUR'
            'flatpak: Installation einzelner Tools (ProtonPlus, Unity Hub) ueber Flathub'
            'fuse2: Ausfuehren von AppImage-Tools'
            'libcap: VR-Prioritaet setzen (setcap/getcap)'
            'wivrn-server: VR-Streaming-Server (Kernfunktion)'
            'wivrn-dashboard: Konfigurationsoberflaeche fuer WiVRn'
            'opencomposite-git: OpenVR-Kompatibilitaet fuer VRChat & Co.')
provides=('yakuda-connect')
conflicts=('yakuda-connect-git')
# Tag-Format im Repo ist v<version> -> v1.1.1
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Wird von 'updpkgsums' im AUR-Ordner gesetzt — NICHT von Hand eintragen.
sha256sums=('02bdac990f6f5732e6967e37af4a9e54175c44c0e5c5e5000f731c129b83ba1a')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    local dest="$pkgdir/usr/share/yakuda-connect"

    # Programmdateien installieren (nur, was existiert).
    # tests/ und packaging/ gehoeren NICHT ins Paket.
    install -d "$dest"
    for item in core ui assets starter.py; do
        [ -e "$item" ] && cp -r "$item" "$dest/"
    done

    # Aufraeumen: Bytecode und Build-Reste gehoeren nicht ins Paket
    find "$dest" -type d -name '__pycache__' -prune -exec rm -rf {} +
    find "$dest" -type f -name '*.py[co]' -delete
    # Reproduzierbare Rechte (cp -r erbt sonst die Rechte aus dem Checkout)
    find "$dest" -type d -exec chmod 755 {} +
    find "$dest" -type f -exec chmod 644 {} +

    # Startbefehl /usr/bin/yakuda-connect anlegen (Einstiegspunkt: starter.py)
    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/yakuda-connect" <<'LAUNCH'
#!/bin/sh
cd /usr/share/yakuda-connect || exit 1
exec python starter.py "$@"
LAUNCH
    chmod 755 "$pkgdir/usr/bin/yakuda-connect"

    # .desktop-Eintrag — WICHTIG: die .download-Variante nutzt 'Exec=yakuda-connect'
    # und 'Icon=yakuda-connect'. Die andere zeigt auf /opt und waere hier kaputt.
    install -Dm644 yakuda-connect.desktop.download \
        "$pkgdir/usr/share/applications/yakuda-connect.desktop"

    # Icon EXPLIZIT benennen (assets/ enthaelt auch Screenshots!)
    install -Dm644 assets/yakuda_icon_512.png \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/yakuda-connect.png"
    if [ -f assets/yakuda_icon.svg ]; then
        install -Dm644 assets/yakuda_icon.svg \
            "$pkgdir/usr/share/icons/hicolor/scalable/apps/yakuda-connect.svg"
    fi

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
