# Maintainer: Dennis Herbrich (Gyroplast) <dennis.herbrich@veloxis.de>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=dunedynasty
pkgver=1.6.3
pkgrel=1
pkgdesc="Maintained fork of an enhanced continuation of the classic real-time strategy game Dune II"
url="https://github.com/gameflorist/dunedynasty"
arch=('i686' 'x86_64')
license=('GPL-2.0-only')
depends=(
  'allegro'
  'alsa-lib'
  'enet'
  'fluidsynth'
  'libgl'
  'libmad'
)
makedepends=('cmake')
optdepends=(
  'soundfont-fluid: soundfont for fluidsynth'
  'timidity++: MIDI music support alternative'
  'timidity-freepats: patch set for timidity++'
)
install="${pkgname}.install"
changelog=CHANGELOG.md
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gameflorist/dunedynasty/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('43d113541acfe3435e5bc740371f3cd3a25bb7a1adf4e7f9024fda63c9487844')

prepare() {
  cd "${pkgname}-${pkgver}"

  # change doc directory to Archlinux conventions
  sed \
    -e 's|DESTINATION "doc/dunedynasty-${DUNE_DYNASTY_VERSION}")|DESTINATION "share/doc/dunedynasty")|' \
    -i CMakeLists.txt

  # default config settings for Archlinux in sample file
  sed \
    -e "s|^\s*\;\?s*sound_font\s*=\s*.*|sound_font=/usr/share/soundfonts/default.sf2|" \
    -i dist/dunedynasty.cfg-sample
}

build() {
  cd "${pkgname}-${pkgver}"

  # allow format-security errors in existing codebase until fixed upstream
  CFLAGS="${CFLAGS} -Wno-error=format-security" \
  cmake \
    -S "${srcdir}/${pkgname}-${pkgver}" \
    -B "${srcdir}/${pkgname}-${pkgver}/build" \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDUNE_DATA_DIR="/usr/share/${pkgname}"

  cmake \
    --build "${srcdir}/${pkgname}-${pkgver}/build" \
    --config Release
}

package() {
  cd "${pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" cmake \
    --install "${srcdir}/${pkgname}-${pkgver}/build" \
    --config Release

  # remove common license file
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE.txt"

  # desktop file and icon
  install -Dm644 src/video/dune2_32x32.xpm "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
  install -Dm644 "dist-os-specific/linux/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
