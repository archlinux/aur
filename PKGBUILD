# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

_pkgname=Amethyst-Mod-Manager
pkgname=amethyst-mod-manager
pkgver=1.3.9
pkgrel=2
pkgdesc='A Linux native mod manager for a variety of games'
arch=('any')
url='https://github.com/ChrisDKN/Amethyst-Mod-Manager'
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
optdepends=(
    'zenity: native dialog'
    'kdialog: native dialog'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ChrisDKN/Amethyst-Mod-Manager/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('53ab52696121082275319910445cab75134d159db3ff0e5ad280a794a3e2751e')

build() {
    cd "${_pkgname}-${pkgver}"

    sed -i 's/import LOOT.loot as loot/import loot/' 'src/LOOT/loot_sorter.py'
}

package() {
    cd "${_pkgname}-${pkgver}"

    pushd src > /dev/null
    find . -path "./appimage" -prune -o \
        -not -name "requirements*.txt" \
        -not -name "rebuild_libloot.sh" \
        -not -name "run.sh" \
        -not -name "loot.cpython*.so" \
        -type f \
        -exec install -Dm 755 '{}' "$pkgdir/usr/share/${pkgname}/{}" \;
    popd > /dev/null

    install -d "$pkgdir/usr/bin/"

    echo '#!/bin/sh' > "$pkgdir/usr/bin/${pkgname}"
    echo 'exec /usr/bin/python3 /usr/share/'"${pkgname}"'/gui.py "$@"' >> "$pkgdir/usr/bin/${pkgname}"
    chmod +x "$pkgdir/usr/bin/${pkgname}"

    echo '#!/bin/sh' > "$pkgdir/usr/bin/${pkgname}-cli"
    echo 'exec /usr/bin/python3 /usr/share/'"${pkgname}"'/cli.py "$@"' >> "$pkgdir/usr/bin/${pkgname}-cli"
    chmod +x "$pkgdir/usr/bin/${pkgname}-cli"

    install -Dm644 "flatpak/io.github.Amethyst.ModManager.desktop" "$pkgdir/usr/share/applications/io.github.Amethyst.ModManager.desktop"
    install -Dm644 "src/appimage/mod-manager.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/io.github.Amethyst.ModManager.png"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
