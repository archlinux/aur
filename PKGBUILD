# Maintainer: Joonas Henriksson <joonas.henriksson at gmail com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

# Notes:
#   + gog:// DLAGENT:
#       - A gog:// DLAGENT can be configured in /etc/makepkg.conf to
#         automatically pull game files from GOG.
#       - https://github.com/Sude-/lgogdownloader

pkgname='gog-hollow-knight'
pkgver=1.5.78.11833.51218
pkgrel=1
# Fix upstream versioning shenanigans:
epoch=1
pkgdesc="Hollow Knight is a challenging 2D action-adventure. You’ll explore twisting caverns, battle tainted creatures and escape intricate traps, all to solve an ancient long-hidden mystery."
url='http://hollowknight.com/'
license=('custom')
arch=('x86_64')
source=(
  "${pkgname}"
  "${pkgname}.desktop"
  "file://hollow_knight_${pkgver//./_}.sh"
)
sha256sums=('987b0c0e32895d0a4214650d0afb2f3c2359b049212e13860dc9ae67553c48b4'
            '8860a0daf52181f78711c2b1099d7a09a30ba09331c68e8aae71182a996a0acd'
            'ab20725edf1f539115062b0e61f42a13bab0ff843f3faf89df9af5499dcdda72')

prepare() {
  find . -type d -exec chmod 755 {} \;
}

package() {
  install -d "${pkgdir}/opt/${pkgname}/"
  install -d "${pkgdir}/opt/${pkgname}/support/"
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/applications/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -d "${pkgdir}/usr/share/pixmaps/"

  mv \
    "${srcdir}/data/noarch/game" \
    -t "${pkgdir}/opt/${pkgname}/"

  install -m 755           \
    "${srcdir}/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -m 644         \
    data/noarch/gameinfo \
    "${pkgdir}/opt/${pkgname}/"
  install -m 755         \
    data/noarch/start.sh \
    "${pkgdir}/opt/${pkgname}/"
  install -m 755                     \
    data/noarch/support/*.{sh,shlib} \
    "${pkgdir}/opt/${pkgname}/support/"
  install -m 644                                      \
    'data/noarch/docs/End User License Agreement.txt' \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m 644                   \
    "data/noarch/support/icon.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -m 644                   \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # If you can't access Config.ini, the game will not start... This is a bit
  # of a hack, so if anyone has a better workaround I'm all ears (eyes?)!
  # This workaround requires the user running the game to be a member of the
  # group 'games':
  install -g games -m 664 \
    /dev/null             \
    "${pkgdir}/opt/${pkgname}/game/Hollow Knight_Data/Config.ini"
}

