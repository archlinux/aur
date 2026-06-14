# Maintainer: Michal Walenciak <kicer86@gmail.com>
pkgname=wacki
pkgver=1.0.4
pkgrel=2
pkgdesc='Faithful SDL2 port of Wacki: Kosmiczna rozgrywka'
arch=('x86_64')
url='https://github.com/mszula/wacki'
license=('GPL-3.0-or-later' 'custom:Wacki-original-data')
depends=('sdl2')
makedepends=('gcc' 'make')
optdepends=('zenity: GTK folder picker fallback when WACKI_PATH is unset'
            'kdialog: KDE folder picker fallback when WACKI_PATH is unset')
_pkgsrc="${pkgname}-${pkgver}"
_data_archive='wacki-data.tar.gz'
source=(
    "${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${_data_archive}::manual://${_data_archive}"
    'wacki.sh'
    'wacki.desktop'
    'README.arch'
    'wacki-data-notice.txt'
)
noextract=("${_data_archive}")
sha256sums=('915b3e827de74e5bec1a8e0edcc4156969521241faff52640d860c96ce1eb1ea'
            'SKIP'
            '1af86f9ae352bcb84359a412d95d30bb8da28ad207e6bfcdd20e164bfe8e07bb'
            '8a1afc87fa6d0aea08178c31dc416d04ed6f3baa02cbfd3f060685b002cd7485'
            '40b29dee2acb9a3483e4b078e68583184f28aa9a9fb6f4beb0a0501a9ac398bf'
            '63acf803af9a76da64c1a09123cc3651a04c5fa6355e3ad2a05cef7660cff32f')

prepare() {
    cd "$srcdir/$_pkgsrc"

    local gamedata="$srcdir/wacki-data"
    rm -rf "$gamedata"
    rm -rf data
    mkdir -p "$gamedata" data
    bsdtar -xf "$srcdir/$_data_archive" -C "$gamedata"

    local exe
    exe=$(find "$gamedata" -type f -iname 'WACKI.EXE' -print -quit)
    if [[ -z "$exe" ]]; then
        echo "Missing WACKI.EXE in $_data_archive." >&2
        echo "Create $_data_archive from your original Wacki CD before running makepkg." >&2
        return 1
    fi
    install -Dm644 "$exe" data/WACKI.EXE

    if ! compgen -G "$gamedata/dane_*.dta" >/dev/null; then
        echo "Missing dane_*.dta files in $_data_archive." >&2
        echo "Create $_data_archive from your original Wacki CD before running makepkg." >&2
        return 1
    fi
}

build() {
    cd "$srcdir/$_pkgsrc"

    make engine \
        CFLAGS="${CFLAGS} -Wall -Wextra -Wpedantic -Wno-unused-parameter -Wno-pointer-sign -Wno-language-extension-token -fno-strict-aliasing -std=gnu99 -I include" \
        LDFLAGS_SIZE="${LDFLAGS}" \
        WACKI_VERSION="v${pkgver}"
}

package() {
    cd "$srcdir/$_pkgsrc"

    install -Dm755 dist/wacki "$pkgdir/usr/lib/wacki/wacki"
    install -Dm755 "$srcdir/wacki.sh" "$pkgdir/usr/bin/wacki"

    local dta
    for dta in "$srcdir"/wacki-data/dane_*.dta; do
        # TODO: Drop this case workaround after upstream fixes
        # https://github.com/mszula/wacki/issues/3.
        local base
        base=$(basename "$dta")
        install -Dm644 "$dta" "$pkgdir/usr/share/wacki/data/D${base#d}"
    done

    install -Dm644 website/assets/icon-512.png \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/wacki.png"
    install -Dm644 "$srcdir/wacki.desktop" \
        "$pkgdir/usr/share/applications/wacki.desktop"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 BUILDING.md "$pkgdir/usr/share/doc/$pkgname/BUILDING.md"
    install -Dm644 "$srcdir/README.arch" "$pkgdir/usr/share/doc/$pkgname/README.arch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/wacki-data-notice.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/wacki-data-notice.txt"
}
