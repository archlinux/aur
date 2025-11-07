# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=wasted
pkgname=${_pkgname}-git
pkgver=r754.6df601c
pkgrel=1
pkgdesc='Wasted is a derby-destruction video game with playful visuals'
arch=('x86_64')
url="https://wastedgames.codeberg.page/"
license=(
  'GPL-3.0-or-later' 'GPL-2.0-or-later' 'CC0-1.0' 'CC-BY-4.0' 'CC-BY-SA-4.0'
  'CC-BY-SA-3.0')
depends=(
  'hicolor-icon-theme' 'bluez-libs' 'sdl2' 'curl' 'openssl' 'harfbuzz' 'pkgconf'
  'libjpeg-turbo' 'libogg' 'openal' 'libpng' 'openssl' 'libvorbis' 'mbedtls'
  'zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git' 'cmake')
sha512sums=('SKIP' 'SKIP')
source=(
  "wasted-code::git+https://codeberg.org/wastedgames/wasted-code.git"
  "wasted-assets::git+https://codeberg.org/wastedgames/wasted-assets.git")

pkgver() {
  cd "${srcdir}/wasted-code"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/wasted-code"
  mkdir -p cmake_build
  cd cmake_build
  cmake -DUSE_WIIUSE=OFF -DSTK_INSTALL_DATA_DIR:STRING=share/wasted ..
  make
}

package() {
  cd "${srcdir}/wasted-code"
  install -Dm 755 ./cmake_build/bin/wasted ${pkgdir}/usr/bin/${_pkgname}
  mkdir -p ${pkgdir}/usr/share/wasted ${pkgdir}/usr/local/share ${pkgdir}/usr/share/applications
  cp -R "./data" ${pkgdir}/usr/share/wasted/
  ln -s /usr/share/wasted ${pkgdir}/usr/local/share/wasted
  cp -R "../wasted-assets/." ${pkgdir}/usr/share/wasted/data/
  install -Dm 644 ./data/wasted_1024.png ${pkgdir}/usr/share/icons/hicolor/scalable/apps/wasted.png
  echo $'[Desktop Entry]\nExec=wasted\nIcon=wasted\nName=Wasted\nPath=\nTerminal=False\nType=Application\nGenericName=A derby-destruction video game with playful visuals\nCategories=Game;\n' > ${pkgdir}/usr/share/applications/wasted.desktop
}
