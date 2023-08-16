# Maintainer: AltoXorg <atrl101 AT yahoo DOT com>

_reponame=Shipwright
#_lus_commit=0a57812968539176bbeaa76c61532d0d6dec4881
_lus_tag=1.2.1
pkgbase=soh
pkgname=(soh soh-otr-exporter)
pkgver=7.1.1
pkgrel=1
arch=("x86_64" "i686")
url="https://shipofharkinian.com/"
_depends_soh=("sdl2" "sdl2_net" "libpulse" "glew" "zenity")
_depends_soh_otr_exporter=("libpng")
depends=("${_depends_soh[@]}" "${_depends_soh_otr_exporter[@]}")
makedepends=("cmake" "ninja" "python" "curl" "lsb-release" "libxrandr" "libxinerama" "libxi" "glu" "boost")
source=("${_reponame}-${pkgver}.tar.gz::https://github.com/HarbourMasters/${_reponame}/archive/refs/tags/${pkgver}.tar.gz"
        #"libultraship-${_lus_commit}.tar.gz::https://github.com/Kenix3/libultraship/archive/${_lus_commit}.tar.gz"
        "libultraship-${_lus_tag}.tar.gz::https://github.com/Kenix3/libultraship/archive/refs/tags/${_lus_tag}.tar.gz"
        "soh.desktop")
sha256sums=('cd792c61c9c88471c475d4e9b6f7860f854f12ed589e429f00348d36b77dc474'
            '3fbe3a0eeb24e4b2e948670afbd3055b6080b9364f6091559e89240e542d3cfb'
            '25aebd34f6ad49073d8a5ce6915b6fa290470fc6d62a8143abe07a25707ff4a2')

# Changable options for debugging:
__generate_headers=0  # Generate OTR (unnecessary) and asset headers. **requires rom**

SHIP_PREFIX=/opt/soh

prepare() {
  cd "${srcdir}/${_reponame}-${pkgver}"

  # Symlink libultraship
  rm -r libultraship
  #ln -sf ../libultraship-${_lus_commit} libultraship
  ln -sf ../libultraship-${_lus_tag} libultraship

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

  CFLAGS="${CFLAGS/-Werror=format-security/}" \
  CXXFLAGS="${CXXFLAGS/-Werror=format-security/}" \
    cmake -Bbuild -GNinja -DCMAKE_BUILD_TYPE=Release \
        -DNON_PORTABLE=On -DCMAKE_INSTALL_PREFIX=$SHIP_PREFIX .

  cmake --build build --target ZAPD --config Release

  if [ "$__generate_headers" = 1 ]; then
    cmake --build build --target ExtractAssetsHeaders
  else
    rm -f soh.otr || true
    rm -rf Extract || true
    mkdir Extract
    cp -r OTRExporter/assets Extract/assets

    build/ZAPD/ZAPD.out botr -se OTR --norom
  fi

  cmake --build build --target soh --config Release
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

  # Change the external xml folder path so that it always points to this package's install path
  find "${pkgdir}/${SHIP_PREFIX}/assets/extractor" -maxdepth 1 -name Config_\*.xml -exec \
    sed -i "/ExternalXMLFolder/s,assets/extractor,${SHIP_PREFIX}/&," {} +

  install -dm755 "${pkgdir}/usr/share/licenses/soh-otr-exporter"
  install -Dm644 "OTRExporter/LICENSE" "${pkgdir}/usr/share/licenses/soh-otr-exporter/LICENSE"
}
