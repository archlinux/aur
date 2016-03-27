# Maintainer: Aleksej Komarov <stylemistake@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: Babets
# Contributor: Vain

pkgname='warsow-beta'
_pkgname_server='wsw-server-beta'
_pkgname_tv='wswtv-server-beta'
pkgver='2.1.0'
pkgrel='1'
pkgdesc='Free online multiplayer competitive FPS based on the Qfusion engine'
url='https://www.warsow.gg/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('warsow-beta-data' 'sdl2' 'libjpeg' 'libpng' 'curl'
         'libvorbis' 'freetype2' 'libxinerama' 'libxxf86vm'
         'libxrandr' 'libtheora' 'libxi')
makedepends=('mesa' 'openal' 'imagemagick' 'gendesk' 'cmake')
optdepends=('openal: for openal audio support'
            'openal-hrtf: for openal virtual acoustics')
source=('warsow.launcher'
        'wsw-server.launcher'
        'wswtv-server.launcher'
        'http://mirror.null.one/warsow_21_sdk.tar.gz')
md5sums=('9f45e1a4a7eb2cc1bdf4b509cf32bbbc'
         'ab24df17a04185a1448d4c1958ba38d7'
         'ef59b7439ca732d9eb9f2956809ff9dd'
         '41885946e562012582761af5485e6801')

prepare() {
  gendesk -n -f --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" \
    --name 'Warsow (beta)' --categories 'Game;ActionGame'
}

build() {
  cd "${srcdir}/source/source"
  cmake -DQFUSION_GAME=Warsow .
  make ${MAKE_FLAGS}
}

package() {
  local srcdir_build="${srcdir}/source/source/build"
  local pkgdir_opt="${pkgdir}/opt/${pkgname}"

  # Create Destination Directories
  install -d "${pkgdir_opt}/"

  # Move Compiled Data to Destination Directory except basewsw.
  # NOTE: We don't need cgame library because it's a pure lib provided by
  # modules_16.pk3 from warsow-data package.
  cp -r "${srcdir_build}/libs" "${pkgdir_opt}"
  cp "${srcdir_build}/warsow.${CARCH}" "${pkgdir_opt}/warsow"
  cp "${srcdir_build}/wsw_server.${CARCH}" "${pkgdir_opt}/wsw_server"
  cp "${srcdir_build}/wswtv_server.${CARCH}" "${pkgdir_opt}/wswtv_server"
  find "${pkgdir_opt}" -type d | xargs chmod 755
  find "${pkgdir_opt}" -type f | xargs chmod 755 # only executables here

  # Install launchers to /usr/bin
  install -D -m 0755 "${srcdir}/warsow.launcher" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m 0755 "${srcdir}/wsw-server.launcher" "${pkgdir}/usr/bin/${_pkgname_server}"
  install -D -m 0755 "${srcdir}/wswtv-server.launcher" "${pkgdir}/usr/bin/${_pkgname_tv}"

  # Install the menu entry
  install -D -m 0644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install the launcher icon
  convert "${srcdir}/source/icons/warsow256x256.xpm" "${srcdir}/warsow.png"
  install -D -m 0644 "${srcdir}/warsow.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
