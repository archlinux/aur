# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

# Previous maintainers:
# Maintainer : André Fettouhi <a.fettouhi@gmail.com>
# Contributor: mirandir <mirandir[at)orange(dot]com>

# TODO
#   1. Get the game working.
#       The game is currently unplayable. The launcher will boot, however the
#       game crashes when attempting to launch the game. I don't have too much
#       time to look into this _yet_, but some stracing may go a long way...

pkgname=gog-the-witcher-2-assassins-of-kings
pkgver=2.2.0.8
pkgrel=1
pkgdesc='Enjoy a captivating story, dynamic combat system and beautiful graphics in the second installment in the RPG saga about the Witcher, Geralt of Rivia.'
arch=(
    'i686'
    'x86_64'
)
depends_x86_64=(
    'freetype2'
    'gtk2'
    'sdl2'
    'sdl2_image'
)
depends_i686=(
    'lib32-freetype2'
    'lib32-gtk2'
    'lib32-sdl2'
    'lib32-sdl2_image'
)
url='http://thewitcher.com/en/witcher2'
license=(
    'custom'
)
groups=(
    'games'
    'gog'
)
source=(
    "gog://${pkgname//-/_}_enhanced_edition_${pkgver}.sh"
    "${pkgname}"
    "${pkgname}.desktop"
)
DLAGENTS=(
    "gog::/usr/bin/echo %u Download the GOG file to $PWD or set up a gog:// DLAGENT."
)
noextract=(
    "gog_the_witcher_2_assassins_of_kings_enhanced_edition_${pkgver}.sh"
)
sha256sums=(
    '6d6f519db92fe38219b9bb62a6d2dfff0a93e5c24f73cf69ba7d05071361f586'
    '32fd021d75ad3ed9e55e97b34d5ee08c2bde469028ddee410f933290d2998731'
    '9f56e0b94fcd60a179a158dac27051c526f0f27b2ebe4224ca68d6ecafee7d47'
)

prepare() {
    cd "${srcdir}" || exit 1
    # "The ~20GB workaround"
    #
    # prepare() may need some changes upstream... Unzip extracts file.sh fine.
    # Due to some "garbage" (shell script) at the beginning of file.sh, unzip
    # will exit with a reutn code of 1, causing prepare() to fail.
    #
    #The "sane" solution is to repackage file.sh into a "fixed" zip file:
    zip -FFv "../${source[0]}" --out "${pkgname}.zip"
    # Then unzip the result:
    unzip "${pkgname}.zip"
    # Then cleanup after ourselves:
    rm "${pkgname}.zip"
    # Fun...
}

package() { 
    cd "${srcdir}"

    # Install game
    install -d "${pkgdir}/opt/${pkgname}/"
    install -d "${pkgdir}/opt/${pkgname}/support"
    install -d "${pkgdir}/usr/bin/"
    cp -r "data/noarch/game/" "${pkgdir}/opt/${pkgname}/"


    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
    install -Dm755 "data/noarch/start.sh"               \
        "${pkgdir}/opt/${pkgname}/"
    install -Dm755 data/noarch/support/*.{sh,shlib} -t  \
        "${pkgdir}/opt/${pkgname}/support"

    # Desktop integration
    install -Dm 644 "data/noarch/support/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "data/noarch/docs/End User License Agreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${srcdir}/${pkgname}" \
        "${pkgdir}/usr/bin/${pkgname}"
}
