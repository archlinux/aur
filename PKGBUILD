# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=fortressone-bin
_pkgname=fortressone
pkgver=3.1
pkgrel=1
pkgdesc="An all in one QuakeWorld Team Fortress package"
arch=('x86_64')
url="https://www.fortressone.org"
license=('GPL')
depends=('libjpeg-turbo' 'libglvnd' 'libxxf86vm' 'jansson' 'sdl2' 'libpng' 'curl' 'speex')
makedepends=('git')
install=fortressone.install
source=(
  "linux-installer::git+https://github.com/FortressOne/linux-installer.git"

  # default configuration files
  "client-configs::git+https://github.com/FortressOne/client-configs.git"

  # FortressOne client
  "${_pkgname}::https://github.com/FortressOne/ezquake-source/releases/download/v${pkgver}/fortressone-linux-x86_64"

  # FortressOne fragfile.dat
  "fragfile.dat::https://github.com/FortressOne/ezquake-source/releases/download/v${pkgver}/fragfile.dat"

  # server browser sources
  "sb.zip::https://github.com/FortressOne/ezquake-source/releases/download/v${pkgver}/sb.zip"

  # FortressOne client media files
  "${_pkgname}.pk3::https://github.com/FortressOne/ezquake-media/releases/download/v1.0.0/fortressone.pk3"

  # Quake shareware media files
  "pak0.pak::https://www.mirafiori.com/ftp/pub/gaming/pak0.pak"

  # FortressOne server media files
  "pak0.pk3::https://github.com/FortressOne/assets/releases/download/1.0.0/pak0.pk3"

  # Update desktop file
  "fortressone-desktop.patch")
noextract=('fortressone.pk3' 'pak0.pk3' 'pak0.pak')
sha256sums=('SKIP'
            'SKIP'
            'f2795591ea88b939655fbd2accec48df11cc56ff9b32dc11637c541835c35435'
            '3272f0771dcdc9af47b7e1fb2a8129ef400cea11b9feab145c26eb765469215c'
            '75acb892217af91c79ad6af834f457d92c78a7757eaba4f4ca8abb08ba93457c'
            '0622ff7e5528f472d6bc111d929ef297d3358a8def574a8b669ec4df57428df8'
            'eec9a020b6d8b6df73a5b911e19985f6e2539c1c6857b4a9f400553b9599677d'
            'f7fa960e555b5bda48699c08ad32c0a69a3c134f018023194f7db3ec22045495'
            'aec4d0ed76cc1a48fa96cde712ad23bbe20c5c452f590fd26134f9694315b73b')

prepare() {
  cd "${srcdir}/linux-installer/bin"
  patch -p1 <"${srcdir}/fortressone-desktop.patch"
}

package() {
  # .desktop
  install -Dm755 "${srcdir}/linux-installer/bin/fortressone.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # icon
  install -Dm755 "${srcdir}/linux-installer/bin/logo.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

  # FortressOne fragfile.dat
  install -Dm777 "${srcdir}/fragfile.dat" "${pkgdir}/usr/share/${_pkgname}/fortress/fragfile.dat"

  # FortressOne client
  install -Dm777 "${srcdir}/fortressone" "${pkgdir}/usr/bin/${_pkgname}"

  # server browser sources
  cp -r "${srcdir}/sb/" "${pkgdir}/usr/share/${_pkgname}/ezquake"

  # Quake shareware media files
  install -Dm777 "${srcdir}/pak0.pak" "${pkgdir}/usr/share/${_pkgname}/id1/pak0.pak"

  # FortressOne server media files
  install -Dm777 "${srcdir}/pak0.pk3" "${pkgdir}/usr/share/${_pkgname}/fortress/pak0.pk3"

  # FortressOne client media files
  install -Dm777 "${srcdir}/fortressone.pk3" "${pkgdir}/usr/share/${_pkgname}/fortress/fortressone.pk3"

  # default configuration files
  cp -r "${srcdir}/client-configs"/* "${pkgdir}/usr/share/${_pkgname}"
}

# vim: ts=2 sw=2 et:
