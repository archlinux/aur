# Maintainer: Guru <anjanaya@gmail.com>
pkgname=clangen-bin
_pkgname=clangen
pkgver=0.13.3
pkgrel=1
pkgdesc="Warrior Cats fan game (PyInstaller bundle)"
arch=('x86_64')
url="https://clangen.io"
license=('MPL-2.0' 'CC-BY-NC-4.0')
depends=('glibc')
provides=('clangen')
conflicts=('clangen')
source=("${pkgname}-${pkgver}.tar.xz::https://clangen.io/api/v1/Update/Channels/stable/Releases/v${pkgver}/Artifacts/linux2.35"
        "LICENSE.md::https://raw.githubusercontent.com/ClanGenOfficial/clangen/development/LICENSE.md"
        "clangen.desktop")
sha256sums=('17fbf081ba2cef240f91ecd8097dda1ec223d64987676299dba202090297fa0a'
            'b99c9caaaecff974ad46d6aa0a6f2d7fa36afe34bd357d016f16b13ebcc8ad9c'
            '278435315554de27e45cb590d7ed4d628da1e880057e40b2f62599d65ff69841')
options=('!strip')

package() {
    cd "${srcdir}/Clangen"

    install -dm755 "${pkgdir}/opt/${_pkgname}"
    cp -r . "${pkgdir}/opt/${_pkgname}/"
    chmod 755 "${pkgdir}/opt/${_pkgname}/Clangen"
    printf '%s-%s' "${pkgver}" "${pkgrel}" > "${pkgdir}/opt/${_pkgname}/.version"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${_pkgname}" << 'EOF'
#!/bin/sh
# PyInstaller bundle chdirs to its install dir then writes a "game_data"
# symlink there, so the bundle directory must be user-writable. /opt is not.
# Mirror the bundle into the user cache on first launch (reflink on btrfs is
# free; on other filesystems re-syncs only changed bytes).
SRC="/opt/clangen"
DEST="${XDG_CACHE_HOME:-$HOME/.cache}/clangen"
STAMP="$DEST/.version"
INSTALLED_VERSION="$(cat "$SRC/.version" 2>/dev/null)"

if [ "$(cat "$STAMP" 2>/dev/null)" != "$INSTALLED_VERSION" ]; then
    mkdir -p "$DEST"
    /usr/bin/cp -a --reflink=auto "$SRC/." "$DEST/"
    printf '%s' "$INSTALLED_VERSION" > "$STAMP"
fi

exec "$DEST/Clangen" "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/Clangen/_internal/resources/images/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

    install -Dm644 "${srcdir}/clangen.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    install -Dm644 "${srcdir}/LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
