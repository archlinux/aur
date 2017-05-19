# Current maintainer(s):
#   - Dan Beste <dan.ray.beste@gmail.com>
# Previously:
#   - André Fettouhi <a.fettouhi@gmail.com>

# Current contributor(s):
#   - None
# Previously:
#   - mirandir <mirandir[at)orange(dot]com>

# TODO:
#   1. Get the game working.
#       The game is currently unplayable. The launcher will boot, however the
#       game crashes when attempting to launch the game. I don't have too much
#       time to look into this _yet_, but some stracing may go a long way...

# Notes:
#   + gog:// DLAGENT:
#       - A gog:// DLAGENT can be configured in /etc/makepkg.conf to
#         automatically pull game files from GOG.
#       - https://github.com/Sude-/lgogdownloader

pkgname='gog-the-witcher-2-assassins-of-kings'
pkgver=2.2.0.8
pkgrel=1
pkgdesc='Enjoy a captivating story, dynamic combat system and beautiful graphics in the second installment in the RPG saga about the Witcher, Geralt of Rivia.'
url='http://thewitcher.com/'
license=('custom')
groups=('games' 'gog')
arch=('i686' 'x86_64')
depends_i686=('lib32-freetype2' 'lib32-gtk2' 'lib32-sdl2' 'lib32-sdl2_image')
depends_x86_64=('freetype2' 'gtk2' 'sdl2' 'sdl2_image')
makedepends=('p7zip')
source=(
    "${pkgname}"
    "${pkgname}.desktop"
    "file://${pkgname//-/_}_enhanced_edition_${pkgver}.sh"
)
sha256sums=(
    '32fd021d75ad3ed9e55e97b34d5ee08c2bde469028ddee410f933290d2998731'
    '9f56e0b94fcd60a179a158dac27051c526f0f27b2ebe4224ca68d6ecafee7d47'
    '6d6f519db92fe38219b9bb62a6d2dfff0a93e5c24f73cf69ba7d05071361f586'
)

prepare() {
    cd "${srcdir}"

    7z x -tzip -y "${pkgname//-/_}_enhanced_edition_${pkgver}.sh"
}

package() { 
    cd "${srcdir}"
    
    install -d "${pkgdir}/opt/${pkgname}/"
    install -d "${pkgdir}/opt/${pkgname}/support/"
    install -d "${pkgdir}/usr/bin/"

    cp -r data/noarch/game/ "${pkgdir}/opt/${pkgname}/"
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;

    install -D -m 755           \
        "${srcdir}/${pkgname}"  \
        "${pkgdir}/usr/bin/${pkgname}"
    install -D -m 755           \
        data/noarch/start.sh    \
        "${pkgdir}/opt/${pkgname}/"
    install -D -m 755                       \
        data/noarch/support/*.{sh,shlib} -t \
        "${pkgdir}/opt/${pkgname}/support/"
    install -D -m 644                                       \
        'data/noarch/docs/End User License Agreement.txt'   \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m 644                   \
        "data/noarch/support/icon.png"  \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -D -m 644                   \
        "${srcdir}/${pkgname}.desktop"  \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
