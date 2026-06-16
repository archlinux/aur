# Maintainer: Daniil Mikhailov <danok123danok@gmail.com>

_pkgname=Amethyst-Mod-Manager-no-update-notice
pkgname=amethyst-mod-manager-no-update-check-git
pkgver=1.3.9.r1163.b8d00dd
pkgrel=1
pkgdesc='A Linux native mod manager for a variety of games (fork with no update check)'
arch=('any')
url='https://github.com/fur-git/Amethyst-Mod-Manager-no-update-notice'
license=('GPL-3.0-only')
depends=(
    ## UI
    'python-gobject'
    'python-customtkinter'
    'python-cairo'
    'gdk-pixbuf2'
    'gtk3'
    'python-pillow'

    # Networking
    'python-websocket-client'
    'python-requests'

    # Secret store
    'python-keyring'

    # Cryptography
    'python-cryptography'

    # DBus
    'python-jeepney'

    # Serialization
    'python-msgpack'

    # Archive
    'python-rarfile'
    'python-lz4'
    'python-py7zr'
    'python-zstandard'

    # Modding tools
    'python-libloot'

    'python-bsdiff4'
)
makedepends=('git')
provides=('amethyst-mod-manager')
conflicts=('amethyst-mod-manager')
optdepends=(
    'zenity: native dialog'
    'kdialog: native dialog'
)
source=("git+https://github.com/fur-git/Amethyst-Mod-Manager-no-update-notice.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "1.3.9.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    sed -i 's/import LOOT.loot as loot/import loot/' 'src/LOOT/loot_sorter.py'
}

package() {
    cd "${_pkgname}"

    pushd src > /dev/null
    find . -path "./appimage" -prune -o \
        -not -name "requirements*.txt" \
        -not -name "rebuild_libloot.sh" \
        -not -name "run.sh" \
        -not -name "loot.cpython*.so" \
        -type f \
        -exec install -Dm 755 '{}' "$pkgdir/usr/share/amethyst-mod-manager/{}" \;
    popd > /dev/null

    install -d "$pkgdir/usr/bin/"

    echo '#!/bin/sh' > "$pkgdir/usr/bin/amethyst-mod-manager"
    echo 'exec /usr/bin/python3 /usr/share/amethyst-mod-manager/gui.py "$@"' >> "$pkgdir/usr/bin/amethyst-mod-manager"
    chmod +x "$pkgdir/usr/bin/amethyst-mod-manager"

    echo '#!/bin/sh' > "$pkgdir/usr/bin/amethyst-mod-manager-cli"
    echo 'exec /usr/bin/python3 /usr/share/amethyst-mod-manager/cli.py "$@"' >> "$pkgdir/usr/bin/amethyst-mod-manager-cli"
    chmod +x "$pkgdir/usr/bin/amethyst-mod-manager-cli"

    install -Dm644 "flatpak/io.github.Amethyst.ModManager.desktop" "$pkgdir/usr/share/applications/io.github.Amethyst.ModManager.desktop"
    install -Dm644 "src/appimage/mod-manager.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/io.github.Amethyst.ModManager.png"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
