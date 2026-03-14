# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

_pkgname=Amethyst-Mod-Manager
pkgname=amethyst-mod-manager
pkgver=1.0.2
pkgrel=1
pkgdesc='A Linux native mod manager for a variety of games'
arch=('any')
url='https://github.com/ChrisDKN/Amethyst-Mod-Manager'
license=('GPL-3.0-only')
depends=(
    'python-customtkinter'
    'python-gobject'
    'python-importlib-metadata'
    'python-keyring'
    'python-libarchive-c'
    'python-libloot'
    'python-lz4'
    'python-msgpack'
    'python-pillow'
    'python-py7zr'
    'python-requests'
    'python-websocket-client'
    'python-zstandard'
)
optdepends=(
    'zenity: native dialog'
    'kdialog: native dialog'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ChrisDKN/Amethyst-Mod-Manager/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('75132767dd7ef92306267e2efa13bca978f13144b26587db9ed756a9ff7440d4')

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
    echo 'python /usr/share/'"${pkgname}"'/gui.py "$@"' >> "$pkgdir/usr/bin/${pkgname}"
    chmod +x "$pkgdir/usr/bin/${pkgname}"

    install -Dm644 "flatpak/io.github.Amethyst.ModManager.desktop" "$pkgdir/usr/share/applications/io.github.Amethyst.ModManager.desktop"
    install -Dm644 "src/appimage/mod-manager.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/io.github.Amethyst.ModManager.png"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
