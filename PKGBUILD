# Maintainer: Dennis Herbrich (Gyroplast) <dennis.herbrich@veloxis.de>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=dunedynasty-git
pkgver=1.6.3.r2.g7491dd3e
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

  # default config settings for Archlinux in sample file
  sed \
    -e "s|^\s*\;\?s*sound_font\s*=\s*.*|sound_font=/usr/share/soundfonts/default.sf2|" \
    -i dist/dunedynasty.cfg-sample
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
  install -Dm644 src/video/dune2_32x32.xpm "${pkgdir}/usr/share/pixmaps/${pkgname%-*}.xpm"
  install -Dm644 "dist-os-specific/linux/${pkgname%-*}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-*}.desktop"
}
