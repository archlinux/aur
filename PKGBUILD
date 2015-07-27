# Maintainer: Ainola

pkgname=gog-gods-will-be-watching
pkgver=1.1.0.7
pkgrel=1
pkgdesc="A minimalistic point and click thriller centered on despair, commitment, and sacrifice."
url="http://www.godswillbewatching.com"
license=('custom')
arch=('i686' 'x86_64')
depends_i686=("libxxf86vm" "glu" "openssl" "openal")
depends_x86_64=("lib32-libxxf86vm" "lib32-glu" "lib32-openssl" "lib32-openal")
source=("gog://${pkgname//-/_}_${pkgver}.tar.gz")
sha256sums=('ad02754b72c22ace4e06ea3f0f1525992ed9ebcb8a1fda286cca431212531562')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL, you need to download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read this PKGBUILD for more information.")

# Prevent compressing final package
PKGEXT='.pkg.tar'

prepare(){
    cd "${srcdir}/Gods Will Be Watching"

    # We must `cd` to the install dir before launching since the /usr/bin/
    # launcher is merely a link. It expects a certain folder structure.
    sed -r -i \
        's/(declare -r CURRENT_DIR="\$\( cd "\$\( dirname )'`
          `'"\$\{BASH_SOURCE\[0\]\}"(.*$)'`
          `'/\1$( readlink -nf "${BASH_SOURCE[0]}" )\2/' \
        "start.sh"
}

package(){
    cd "${srcdir}/Gods Will Be Watching"
    # Install game
    install -d "${pkgdir}/opt/${pkgname}/"
    install -d "${pkgdir}/opt/${pkgname}/support"
    install -d "${pkgdir}/usr/bin/"
    cp -r "game/" "${pkgdir}/opt/${pkgname}/"
    install -Dm755 "start.sh" \
        "${pkgdir}/opt/${pkgname}/"
    install -Dm755 support/*.{sh,shlib} -t \
        "${pkgdir}/opt/${pkgname}/support"

    # Desktop integration
    install -Dm 644 "support/${pkgname}.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "docs/End User License Agreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "support/${pkgname}-primary.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    ln -s "/opt/${pkgname}/start.sh" "${pkgdir}/usr/bin/${pkgname}"
}
