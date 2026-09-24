# Maintainer: steven (yakuda) <yakuda@outlook.de>
# DC Yakuda_nya_owo
# PKGBUILD fuer openxr-vr-control — Controller-Belegung fuer OpenVR/OpenXR-Spiele
#
# Installieren (zieht alle Abhaengigkeiten automatisch):  yay -S openxr-vr-control
#
# Haengt an einem GitHub-Tag, nicht am main-Branch.
#
# ACHTUNG: Diese Datei ist nur die KOPIE fuers Projekt.
# Das echte AUR-Paket liegt in ~/aur/openxr-vr-control (eigenes Git-Repo).
# Von dort wird gepusht — nicht von hier.

pkgname=openxr-vr-control
pkgver=1.0.0
pkgrel=1
pkgdesc="Controller bindings for OpenVR and OpenXR games on Linux (obah + xrBinder) with a GUI"
arch=('any')
url="https://github.com/yakuda-stack/OpenXR-VR-Control"
license=('GPL-3.0-or-later')
depends=('python' 'pyside6' 'python-setproctitle')
optdepends=('obah-git: OpenVR-Bindings (wird sonst per Cargo gebaut)'
            'rust: obah per Cargo bauen'
            'cmake: xrBinder bauen (OpenXR-Tastenbelegung)'
            'git: xrBinder-Quellcode holen'
            'yay: obah ueber den AUR installieren')
provides=('openxr-vr-control')
conflicts=('openxr-vr-control-git')
# Tag-Format im Repo ist v<version> -> v1.0.0. Das Archiv von GitHub heisst
# OpenXR-VR-Control-<version> (Repo-Name, nicht pkgname).
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Wird von 'updpkgsums' im AUR-Ordner gesetzt — NICHT von Hand eintragen.
sha256sums=('417109af27d81dadc08e57746802dca7c0c48172c15b036007b423f2e26b1884')

package() {
    cd "$srcdir/OpenXR-VR-Control-$pkgver"
    local dest="$pkgdir/usr/share/openxr-vr-control"

    # Programmdateien (tests/, packaging/, scripts/ gehoeren NICHT ins Paket)
    install -d "$dest"
    for item in core ui assets locales config starter.py CHANGELOG.md HIGHLIGHTS.md; do
        [ -e "$item" ] && cp -r "$item" "$dest/"
    done
    # Screenshots nur fuer die README
    rm -f "$dest"/assets/{screenshot_*,openvrcontrol,openxrcontrol}.png

    find "$dest" -type d -name '__pycache__' -prune -exec rm -rf {} +
    find "$dest" -type f -name '*.py[co]' -delete
    find "$dest" -type d -exec chmod 755 {} +
    find "$dest" -type f -exec chmod 644 {} +

    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/openxr-vr-control" <<'LAUNCH'
#!/bin/sh
cd /usr/share/openxr-vr-control || exit 1
exec python starter.py "$@"
LAUNCH
    chmod 755 "$pkgdir/usr/bin/openxr-vr-control"

    # .desktop: die .download-Variante (Exec/Icon ohne /opt-Pfad)
    install -Dm644 openxr-vr-control.desktop.download \
        "$pkgdir/usr/share/applications/openxr-vr-control.desktop"
    install -Dm644 assets/icon.png \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/openxr-vr-control.png"
    install -Dm644 assets/icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/openxr-vr-control.svg"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
