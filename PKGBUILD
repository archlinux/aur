# Maintainer: AltoXorg <atrl101 AT yahoo DOT com>

_reponame=Shipwright
#_lus_commit=4600eedcc18f496319c99e07b8b2b4f11a0f6e64
_lus_tag=1.4.0
_ZAPDTR_commit=eff29036118349e142ee8efca80fd975a2a2b6ff
_OTRExporter_commit=04b85b95fab07a394b62dcd28a502a3040f08e0c

pkgbase=soh
pkgname=(soh soh-otr-exporter)
pkgver=8.0.3
pkgrel=1
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://shipofharkinian.com/"
_depends_soh=("sdl2" "sdl2_net" "libpulse" "glew" "zenity")
_depends_soh_otr_exporter=("libpng")
depends=("${_depends_soh[@]}" "${_depends_soh_otr_exporter[@]}")
makedepends=("cmake" "ninja" "python" "curl" "lsb-release" "libxrandr" "libxinerama" "libxi" "glu" "boost")
source=("${_reponame}-${pkgver}.tar.gz::https://github.com/HarbourMasters/${_reponame}/archive/refs/tags/${pkgver}.tar.gz"
        #"libultraship-${_lus_commit:0:8}.tar.gz::https://github.com/Kenix3/libultraship/archive/${_lus_commit}.tar.gz"
        "libultraship-${_lus_tag}.tar.gz::https://github.com/Kenix3/libultraship/archive/refs/tags/${_lus_tag}.tar.gz"
        "ZAPDTR-${_ZAPDTR_commit}.tar.gz::https://github.com/HarbourMasters/ZAPDTR/archive/${_ZAPDTR_commit}.tar.gz"
        "OTRExporter-${_OTRExporter_commit}.tar.gz::https://github.com/HarbourMasters/OTRExporter/archive/${_OTRExporter_commit}.tar.gz"
        "soh.desktop")
sha256sums=('5503941cb38deae00939b257d1c80ff2196d8e22a5a3b5911ffc657e15959576'
            '13f3cfa827fb42fbf68356bca2211c789d58376a053f647191873b283d9ef4bc'
            '6438cd1c7abad6ea9b65326892a1b220384bdce78e9d1a324c132d68c982111c'
            '5f5ff0a0eb7f5536c9076dd777d3914c4b2e064c7a22303a24c1a4a9ed7d462f'
            '25aebd34f6ad49073d8a5ce6915b6fa290470fc6d62a8143abe07a25707ff4a2')

# NOTE: If compiling complains about missing headers, set __generate_headers below to 1
# Changable options for debugging:
__debug=0             # Build with debug flag
__generate_headers=0  # Generate OTR (unnecessary) and asset headers. **requires rom**

if [ "$__debug" = 1 ]; then
  options=(debug strip)
fi

SHIP_PREFIX=/opt/soh

prepare() {
  cd "${srcdir}/${_reponame}-${pkgver}"

  rm -r libultraship ZAPDTR OTRExporter
  #cp -r ../libultraship-${_lus_commit:0:8} libultraship
  cp -r ../libultraship-${_lus_tag} libultraship
  cp -r ../ZAPDTR-${_ZAPDTR_commit} ZAPDTR
  cp -r ../OTRExporter-${_OTRExporter_commit} OTRExporter

  if [ "$__generate_headers" = 1 ]; then
    # check for any roms in the directory where PKGBUILD resides
    # and copy them to Shipwright/OTRExporter. It doesn't matter
    # which rom we'll be using, let extract_assets.py do the guessing.
    roms=( "${startdir}/"*.*64 )
    if (( "${#roms[@]}" )); then
      cp "${roms[@]}" OTRExporter
    else
      echo "NO ROMS FOUND! Please place them in \"${startdir}\"."
      return 1
    fi
  fi
}

build() {
  cd "${srcdir}/${_reponame}-${pkgver}"

  if [ "$__debug" = 1 ]; then
    BUILD_TYPE=Debug
  else
    BUILD_TYPE=Release
  fi

  CFLAGS="${CFLAGS/-Werror=format-security/}" \
  CXXFLAGS="${CXXFLAGS/-Werror=format-security/}" \
    cmake -Bbuild -GNinja -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
        -DNON_PORTABLE=On -DCMAKE_INSTALL_PREFIX=$SHIP_PREFIX .

  cmake --build build --target ZAPD --config $BUILD_TYPE $NINJAFLAGS

  if [ "$__generate_headers" = 1 ]; then
    cmake --build build --target ExtractAssetsHeaders $NINJAFLAGS
  else
    cmake --build build --target GenerateSohOtr $NINJAFLAGS
  fi

  cmake --build build --target soh --config $BUILD_TYPE $NINJAFLAGS
}

package_soh() {
  pkgdesc="An unofficial port of The Legend of Zelda Ocarina of Time for PC, Wii U, and Switch"
  depends=("${_depends_soh[@]}")
  license=("unknown")
  install=soh.install
  optdepends=("soh-otr: OTR asset file in order to run"
              "soh-otr-mq: OTR asset file in order to run (Master Quest)")

  cd "${srcdir}/${_reponame}-${pkgver}"

  DESTDIR="${pkgdir}" cmake --install build --component ship

  install -dm755 "${pkgdir}/usr/bin/"
  ln -s "${SHIP_PREFIX}/soh.elf" "${pkgdir}/usr/bin/soh"
  install -Dm644 "${srcdir}/soh.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 soh/macosx/sohIcon.png "${pkgdir}/usr/share/pixmaps/soh.png"

  # Copy game documentation
  install -dm755 "${pkgdir}/usr/share/doc/soh"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/soh"
  cp -r docs "${pkgdir}/usr/share/doc/soh/docs"
}

package_soh-otr-exporter() {
  pkgdesc="OTR generation tools for SoH. Includes asset XML files needed for generation."
  license=("MIT")
  depends=("${_depends_soh_otr_exporter[@]}")

  cd "${srcdir}/${_reponame}-${pkgver}"

  DESTDIR="${pkgdir}" cmake --install build --component extractor

  install -dm755 "${pkgdir}/usr/bin"
  ln -s ${SHIP_PREFIX}/assets/extractor/ZAPD.out "${pkgdir}/usr/bin/ZAPD"

  install -dm755 "${pkgdir}/usr/share/licenses/soh-otr-exporter"
  install -Dm644 "OTRExporter/LICENSE" "${pkgdir}/usr/share/licenses/soh-otr-exporter/LICENSE"
}
