# Maintainer: Aleksej Komarov <stylemistake@gmail.com>

pkgname='warsow-beta'
pkgver='1.6.beta7'
pkgrel='3'
pkgdesc='Free online multiplayer competitive FPS based on the Qfusion engine'
url='https://www.warsow.gg/'
license=('GPL')
arch=('i686' 'x86_64')
depends=(
  'warsow-beta-data' 'sdl2' 'libjpeg' 'libpng' 'curl' 'libvorbis' 'freetype2'
  'libxinerama' 'libxxf86vm' 'libxrandr' 'libtheora' 'libxi'
)
makedepends=('mesa' 'openal' 'imagemagick' 'gendesk' 'cmake')
optdepends=('openal: for openal audio support')
provides=('warsow')
conflicts=('warsow')
source=(
  'warsow.launcher'
  'wsw-server.launcher'
  'wswtv-server.launcher'
  'warsow-cmakelists.patch'
  'https://www.warsow.gg/1.6-test/test7/warsow_16_TEST7_sdk.tar.gz'
)
md5sums=(
  '65c5ffc2ccc19c661f87467e756bbea2'
  '45a3f846fd6ea3b7dc857e60501d0e12'
  '13d520525638c544565d8f799ffdca48'
  '826509400d2d3f5035b40552f0c95acb'
  '28502394dc69e2f728bcdcc97cf89eaf'
)

prepare() {
  gendesk -n -f --pkgname 'warsow' --pkgdesc "${pkgdesc}" \
    --name 'Warsow' --categories 'Game;ActionGame'
}

build() {
  # Compile Warsow binaries
  cd "${srcdir}"/source/source
  patch < "${srcdir}"/warsow-cmakelists.patch
  cmake .
  make ${MAKE_FLAGS}
}

package() {
  local builddir="${srcdir}/source/source/build"

  # Create Destination Directories
  install -d "${pkgdir}"/opt/warsow/

  # Move Compiled Data to Destination Directory except basewsw.
  # NOTE: We don't need cgame library because it's a pure lib provided by
  # modules_16.pk3 from warsow-data package.
  cp -r "${builddir}"/libs "${pkgdir}"/opt/warsow
  cp "${builddir}"/warsow.* "${pkgdir}"/opt/warsow/warsow
  cp "${builddir}"/wsw_server.* "${pkgdir}"/opt/warsow/wsw_server
  cp "${builddir}"/wswtv_server.* "${pkgdir}"/opt/warsow/wswtv_server
  find "${pkgdir}"/opt/warsow -type d | xargs chmod 755
  find "${pkgdir}"/opt/warsow -type f | xargs chmod 755 # only executables here

  # Install launchers to /usr/bin
  install -D -m 0755 "${srcdir}"/warsow.launcher "${pkgdir}"/usr/bin/warsow
  install -D -m 0755 "${srcdir}"/wsw-server.launcher "${pkgdir}"/usr/bin/wsw-server
  install -D -m 0755 "${srcdir}"/wswtv-server.launcher "${pkgdir}"/usr/bin/wswtv-server

  # Install the menu entry
  install -D -m 0644 "${srcdir}"/warsow.desktop "${pkgdir}"/usr/share/applications/warsow.desktop

  # Install the launcher icon
  convert "${srcdir}"/source/icons/warsow256x256.xpm "${srcdir}"/warsow.png
  install -D -m 0644 "${srcdir}"/warsow.png "${pkgdir}"/usr/share/pixmaps/warsow.png
}
