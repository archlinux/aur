# Maintainer: AltoXorg <atrl101 AT yahoo DOT com>

_reponame=Shipwright
_lus_commit=5f4be9b6f5f74917c303ab8b66a0b2f4ef91613d
_ZAPDTR_commit=684f21a475dcfeee89938ae1f4afc42768a3e7ef
_OTRExporter_commit=32e088e28c8cdd055d4bb8f3f219d33ad37963f3

pkgbase=soh
pkgname=(soh soh-otr-exporter)
pkgver=9.1.0
pkgrel=1
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://shipofharkinian.com/"
_depends_soh=("sdl2" "sdl2_net" "zenity" "libzip" "libpng" "libogg" "libvorbis" "opus" "opusfile")
_depends_soh_otr_exporter=("libpng")
_depends_lus=("fmt" "spdlog" "tinyxml2")  # libzip could be placed here, but ZAPD.out didn't made to use it
depends=("${_depends_soh[@]}" "${_depends_soh_otr_exporter[@]}" "${_depends_lus[@]}")
makedepends=("git" "cmake" "ninja" "python" "curl" "lsb-release" "boost" "nlohmann-json")
source=("${_reponame}-${pkgver}.tar.gz::https://github.com/HarbourMasters/${_reponame}/archive/refs/tags/${pkgver}.tar.gz"
        "libultraship-${_lus_commit:0:8}.tar.gz::https://github.com/Kenix3/libultraship/archive/${_lus_commit}.tar.gz"
        "ZAPDTR-${_ZAPDTR_commit:0:8}.tar.gz::https://github.com/HarbourMasters/ZAPDTR/archive/${_ZAPDTR_commit}.tar.gz"
        "OTRExporter-${_OTRExporter_commit:0:8}.tar.gz::https://github.com/HarbourMasters/OTRExporter/archive/${_OTRExporter_commit}.tar.gz"
        "soh.desktop")
sha256sums=('dc6096819cba6074aa2fd183fae79c8cd934313a29a2348a2cdd67d8f6633c8a'
            '3df918a599a4c6320de36644107075dc9a51eb7bd23130cf8101ceba056fa96d'
            '8016f735f9ef4e177384b0e51f243e374bf2f67ba66bdd5d21af8b185aed1635'
            '91a863f8899f2ebfc7868ccad4b5982ae416799c76358ce5b2c0edc11e42a672'
            '25aebd34f6ad49073d8a5ce6915b6fa290470fc6d62a8143abe07a25707ff4a2')

# NOTE: If compiling complains about missing headers, set __generate_headers below to 1
__generate_headers=0  # Generate OTR (unnecessary) and asset headers. **requires rom**

_is_debug() {
  for opt in "${OPTIONS[@]}"; do
    if [ "$opt" = debug ]; then
      return 0
    fi
  done

  return 1
}

SHIP_PREFIX=/opt/soh

prepare() {
  cd "${srcdir}/${_reponame}-${pkgver}"

  rm -r libultraship ZAPDTR OTRExporter
  cp -r ../libultraship-${_lus_commit} libultraship
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

  if _is_debug; then
    BUILD_TYPE=Debug
  else
    BUILD_TYPE=Release
  fi

  CFLAGS="${CFLAGS/-Werror=format-security/}" \
  CXXFLAGS="${CXXFLAGS/-Werror=format-security/}" \
  cmake . \
    -Bbuild \
    -GNinja \
    -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
    -DNON_PORTABLE=On \
    -DCMAKE_INSTALL_PREFIX=$SHIP_PREFIX \
    -DBUILD_REMOTE_CONTROL=1

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
  depends=("${_depends_soh[@]}" "${_depends_lus[@]}")
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
  depends=("${_depends_soh_otr_exporter[@]}" "${_depends_lus[@]}")

  cd "${srcdir}/${_reponame}-${pkgver}"

  DESTDIR="${pkgdir}" cmake --install build --component extractor

  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/licenses/soh-otr-exporter"
  install -Dm644 "OTRExporter/LICENSE" "${pkgdir}/usr/share/licenses/soh-otr-exporter/LICENSE"
}
