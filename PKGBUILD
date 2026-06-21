# Maintainer: Dennis Herbrich (Gyroplast) <dennis.herbrich@veloxis.de>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=dunedynasty
pkgver=1.6.4
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
makedepends=('cmake>=3.5')
optdepends=(
  'soundfont-fluid: soundfont for fluidsynth'
  'timidity++: MIDI music support alternative'
  'freepats-general-midi: patch set for timidity++'
)
install="${pkgname}.install"
changelog=CHANGELOG.md
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gameflorist/dunedynasty/archive/refs/tags/v${pkgver}.tar.gz"
        "launcher.patch")
sha256sums=('47a78bcc9ac9f65924616cb097f0448f56c1be8fdf025b49ac361a060295b2b1'
            'aa3a93eb339b9b704bc6ff8d3715ba9f81b698934a7e8800c306446f72eb0108')

prepare() {
  cd "${pkgname}-${pkgver}"

  # change doc directory to Archlinux conventions
  sed \
    -e 's|DESTINATION "doc/dunedynasty-${DUNE_DYNASTY_VERSION}")|DESTINATION "share/doc/dunedynasty")|' \
    -i CMakeLists.txt

  # pick up sample config file wherever it may be placed, except in the build
  # directory. This fixes rebuilding a dirty build.
  printf -v SAMPLE_CFG_PATH "$(find . -path ./build -prune -o -name dunedynasty.cfg-sample -print)"

  # default config settings for Archlinux in sample file
  sed \
    -e "s|^\s*\;\?s*sound_font\s*=\s*.*|sound_font=/usr/share/soundfonts/default.sf2|" \
    -i "${SAMPLE_CFG_PATH}"

  # modify dunedynasty-launcher to work with installation to /usr PREFIX, as
  # it is an old custom of my people
  patch -p1 -i "${srcdir}/launcher.patch"
}

build() {
  cd "${pkgname}-${pkgver}"

  # allow format-security errors in existing codebase until fixed upstream
  CFLAGS="${CFLAGS} -Wno-error=format-security" \
  cmake \
    -S . \
    -B build \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDUNE_DATA_DIR="/usr/share/${pkgname}"

  cmake \
    --build build \
    --config Release
}

package() {
  cd "${pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" cmake \
    --install build \
    --config Release

  # remove common license file
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE.txt"
}
