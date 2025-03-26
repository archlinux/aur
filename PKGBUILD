# Maintainer: Dennis Herbrich (Gyroplast) <dennis.herbrich@veloxis.de>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=dunedynasty-git
pkgver=1.6.3.r37.ged63ed71
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
makedepends=('cmake' 'git')
optdepends=(
  'soundfont-fluid: soundfont for fluidsynth'
  'timidity++: MIDI music support alternative'
  'timidity-freepats: patch set for timidity++'
)
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install="${pkgname%-*}.install"
source=("${pkgname}::git+https://github.com/gameflorist/dunedynasty.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
  cd "${pkgname}"

  # change doc directory to Archlinux conventions
  sed \
    -e 's|DESTINATION "doc/dunedynasty-${DUNE_DYNASTY_VERSION}")|DESTINATION "share/doc/dunedynasty")|' \
    -i CMakeLists.txt

  # pick up sample config file wherever it may be placed
  printf -v SAMPLE_CFG_PATH "$(find . -name dunedynasty.cfg-sample | cut -c2-)"

  # temporary workaround for issue #29, idempotent if location is still /dist
  # in old revisions. Please forgive the bash shenanigans and creative
  # quoting.
  # See https://github.com/gameflorist/dunedynasty/issues/29
  printf -v DATA_SUBDIR "$(find -name campaign -type d | cut -c2-)"
  DATA_SUBDIR="${DATA_SUBDIR%/*}/"

  sed \
    -i \
    -e "s,/dist/dunedynasty.cfg-sample,${SAMPLE_CFG_PATH}," \
    CMakeLists.txt

  sed \
    -i \
    -e 's,\${CMAKE_SOURCE_DIR}/dist/\${subdir},${CMAKE_SOURCE_DIR}'"${DATA_SUBDIR}"'${subdir},' \
    CMakeLists.txt

  # END OF WORKAROUND

  # default config settings for Archlinux in sample file
  sed \
    -e "s|^\s*\;\?s*sound_font\s*=\s*.*|sound_font=/usr/share/soundfonts/default.sf2|" \
    -i "./${SAMPLE_CFG_PATH}"
}

build() {
  cd "${pkgname}"

  # allow format-security errors in existing codebase until fixed upstream
  CFLAGS="${CFLAGS} -Wno-error=format-security" \
  cmake \
    -S . \
    -B build \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDUNE_DATA_DIR="/usr/share/${pkgname%-*}"

  cmake \
    --build build \
    --config Release
}

package() {
  cd "${pkgname}"

  DESTDIR="${pkgdir}" cmake \
    --install build \
    --config Release

  # remove common license file
  rm -f "${pkgdir}/usr/share/doc/${pkgname%-*}/LICENSE.txt"

  # desktop file and icon
  find . -name "dune2_32x32.xpm" -print0 | xargs -0 -I{} install -Dm644 "{}" "${pkgdir}/usr/share/pixmaps/${pkgname%-*}.xpm"
  find . -name "${pkgname%-*}.desktop" -print0 | xargs -0 -I{} install -Dm644 "{}" "${pkgdir}/usr/share/applications/${pkgname%-*}.desktop"
}
