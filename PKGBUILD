# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

_pkgname=Amethyst-Mod-Manager
pkgname=amethyst-mod-manager
pkgver=2.0.5
pkgrel=1
pkgdesc='A Linux native mod manager for a variety of games'
arch=('any')
url='https://github.com/ChrisDKN/Amethyst-Mod-Manager'
license=('GPL-3.0-only')
depends=(
    # UI
    'gtk3'
    'pyside6'
    'python-gobject'
    'python-pillow'

    # Networking
    'python-certifi'
    'python-requests'
    'python-websocket-client'

    # Secret store
    'python-keyring'
    'python-secretstorage'

    # Cryptography
    'python-cryptography'

    # DBus
    'python-jeepney' # Also handling file dialog

    # Serialization
    'python-msgpack'

    # Archive
    'python-lz4'
    'python-py7zr'
    'python-zstandard'

    # Modding tools
    'python-libloot'

    'python-bsdiff4'
)
optdepends=(
    'zenity: fallback native dialog (prefer to use XDG portal instead)'
    'kdialog: fallback native dialog (prefer to use XDG portal instead)'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ChrisDKN/Amethyst-Mod-Manager/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a9c636598ee5585dfe6a3f019cea628b0a2f4d50f7d7db10590a80e049a8cee7')

prepare() {
    cd "${_pkgname}-${pkgver}"

    sed -i 's/import LOOT.loot as loot/import loot/' 'src/LOOT/loot_sorter.py'
}

package() {
    cd "${_pkgname}-${pkgver}"

    pushd src > /dev/null
    find . -path "./appimage" -prune -o \
        -not -name "requirements*.txt" \
        -not -name "rebuild_libloot.sh" \
        -not -name "run_qt.sh" \
        -not -name "loot.cpython*.so" \
        -type f \
        -exec install -Dm 644 '{}' "$pkgdir/usr/share/${pkgname}/{}" \;
    popd > /dev/null

    install -d "$pkgdir/usr/bin/"

    echo '#!/bin/sh' > "$pkgdir/usr/bin/${pkgname}"
    echo 'exec /usr/bin/python3 /usr/share/'"${pkgname}"'/run_qt.py "$@"' >> "$pkgdir/usr/bin/${pkgname}"
    chmod +x "$pkgdir/usr/bin/${pkgname}"

    echo '#!/bin/sh' > "$pkgdir/usr/bin/${pkgname}-cli"
    echo 'exec /usr/bin/python3 /usr/share/'"${pkgname}"'/cli.py "$@"' >> "$pkgdir/usr/bin/${pkgname}-cli"
    chmod +x "$pkgdir/usr/bin/${pkgname}-cli"

    install -Dm644 "flatpak/io.github.Amethyst.ModManager.desktop" "$pkgdir/usr/share/applications/io.github.Amethyst.ModManager.desktop"
    install -Dm644 "src/appimage/mod-manager.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/io.github.Amethyst.ModManager.png"

    install -Dm644 Changelog.txt "${pkgdir}/usr/share/${pkgname}/Changelog.txt"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
