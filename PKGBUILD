# Maintainer: Toby Collier <firstname dot lastname at maths.ox.ac.uk>

pkgname=mtgarena
_shortver=12921.1282485
pkgver=0.1.$_shortver
pkgrel=1
pkgdesc="Magic: the Gathering Arena (via Wine)"
arch=('x86_64')
url="https://magic.wizards.com/en/mtgarena"
license=('custom')
depends=('wine')
makedepends=('icoutils')

source=(
    "${pkgname}-${pkgver}.msi::https://mtgarena.downloads.wizards.com/Live/Windows32/versions/${_shortver}/MTGAInstaller_${pkgver}.msi"
    "${pkgname}"
    "${pkgname}.desktop"
)

sha256sums=(
    '74c6d8f931dfeaaeeecf86bf5585434872930be6f640e6142c41f247c5a4f8c1'
    'f7389c8dd1dba42a1af5f3fed0fe8f0bea591322a363bc981e9365c1df5e08fd'
    'b646e4cbbeefc6d5dab93991d87afa21de3b3e6e54a06b37d92d1a9bfc5528ae'
)

prepare() {
    export WINEPREFIX="${srcdir}/wineprefix"
    export WINEARCH=win64
    wineboot -u
    wine "${srcdir}/${pkgname}-${pkgver}.msi" /quiet

    appdir="${srcdir}/wineprefix/drive_c/Program Files (x86)/Wizards of the Coast/MTGA"
    exefile="${appdir}/MTGA.exe"

    mkdir -p "${srcdir}/icons"
    wrestool -x -t14 -o "${srcdir}/icons" "$exefile"
    icotool -x -o "${srcdir}/icons" "${srcdir}/icons/MTGA.exe_14_103.ico"
}

package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"

    cp -a \
        "${srcdir}/wineprefix/drive_c/Program Files (x86)/Wizards of the Coast/MTGA" \
        "${pkgdir}/opt/${pkgname}/"
    install -Dm755 \
        "${srcdir}/${pkgname}" \
        "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 \
        "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    find "${srcdir}/icons" -type f -name '*.png' | while read -r icon; do
        filename="$(basename "$icon")"
        size="$(sed -n 's/.*_\([0-9]\+\)x\1x.*/\1/p' <<< "$filename")"

        if [[ -n "$size" ]]; then
            install -Dm644 \
                "$icon" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
        fi
    done
}
