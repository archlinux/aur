# Maintainer: AltoXorg <atrl101 AT yahoo DOT com>

_reponame=2ship2harkinian
_lus_commit=5f4be9b6f5f74917c303ab8b66a0b2f4ef91613d
_ZAPDTR_commit=684f21a475dcfeee89938ae1f4afc42768a3e7ef
_OTRExporter_commit=32e088e28c8cdd055d4bb8f3f219d33ad37963f3

pkgbase=2s2h
pkgname=(2s2h 2s2h-otr-exporter)
pkgver=3.0.0
pkgrel=1
arch=("x86_64" "i686" "armv7h" "aarch64")
#url="https://shipofharkinian.com/"
url="https://github.com/HarbourMasters/${_reponame}"
_depends_2s2h=("sdl2" "zenity" "libpng" "libogg" "libvorbis" "opus" "opusfile")
_depends_2s2h_otr_exporter=("libpng")
_depends_lus=("libzip" "fmt" "spdlog" "tinyxml2")
depends=("${_depends_2s2h[@]}" "${_depends_2s2h_otr_exporter[@]}" "${_depends_lus[@]}")
makedepends=("git" "cmake" "ninja" "python" "curl" "lsb-release" "boost" "nlohmann-json")
source=("${_reponame}-${pkgver}.tar.gz::https://github.com/HarbourMasters/${_reponame}/archive/refs/tags/${pkgver}.tar.gz"
        "libultraship-${_lus_commit:0:8}.tar.gz::https://github.com/Kenix3/libultraship/archive/${_lus_commit}.tar.gz"
        "OTRExporter-${_OTRExporter_commit:0:8}.tar.gz::https://github.com/louist103/OTRExporter/archive/${_OTRExporter_commit}.tar.gz"
        "ZAPDTR-${_ZAPDTR_commit:0:8}.tar.gz::https://github.com/louist103/ZAPDTR/archive/${_ZAPDTR_commit}.tar.gz"
        "2s2h.desktop")
sha256sums=('cf42d481b399554b2405c41ec0e1e7bf22b6c603522c6a0772324858420ae133'
            '3df918a599a4c6320de36644107075dc9a51eb7bd23130cf8101ceba056fa96d'
            '91a863f8899f2ebfc7868ccad4b5982ae416799c76358ce5b2c0edc11e42a672'
            '8016f735f9ef4e177384b0e51f243e374bf2f67ba66bdd5d21af8b185aed1635'
            '8c8525a09a94c30106f44219c0f0239789d5c53cd6e30c7748b55f8d83cee24b')

# -- Per-repo submodules
_main_submodules=(
  libultraship
  OTRExporter
  ZAPDTR
)

SHIP_PREFIX=/opt/2s2h

_is_debug() {
  for opt in "${OPTIONS[@]}"; do
    if [ "$opt" = debug ]; then
      return 0
    fi
  done

  return 1
}


prepare() {
  cd "${srcdir}/${_reponame}-${pkgver}"

  rm -r libultraship ZAPDTR OTRExporter
  cp -r ../libultraship-${_lus_commit} libultraship
  #cp -r ../libultraship-${_lus_tag} libultraship
  cp -r ../ZAPDTR-${_ZAPDTR_commit} ZAPDTR
  cp -r ../OTRExporter-${_OTRExporter_commit} OTRExporter
}

build() {
  cd "${srcdir}/${_reponame}-${pkgver}"

  if _is_debug; then
    BUILD_TYPE=Debug
  else
    BUILD_TYPE=Release
  fi

  export CFLAGS="${CFLAGS/-Werror=format-security/}"
  export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"

  # Compile error fix, might be committed to upstream
  CFLAGS+=" -Wno-return-mismatch"

  cmake . \
    -Bbuild \
    -GNinja \
    -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
    -DNON_PORTABLE=On \
    -DCMAKE_INSTALL_PREFIX=$SHIP_PREFIX
    #-DBUILD_REMOTE_CONTROL=1

  cmake --build build --target ZAPD --config $BUILD_TYPE $NINJAFLAGS
  cmake --build build --target Generate2ShipOtr --config $BUILD_TYPE $NINJAFLAGS
  cmake --build build --config $BUILD_TYPE $NINJAFLAGS
}

package_2s2h() {
  pkgdesc="An unofficial port of The Legend of Zelda Majora's Mask"
  depends=("${_depends_2s2h[@]}" "${_depends_lus[@]}")
  license=("CC0-1.0")
  install=2s2h.install

  cd "${srcdir}/${_reponame}-${pkgver}"

  DESTDIR="${pkgdir}" cmake --install build --component ship
  DESTDIR="${pkgdir}" cmake --install build --component 2s2h

  install -dm755 "${pkgdir}/usr/bin/"
  ln -s "${SHIP_PREFIX}/2s2h.elf" "${pkgdir}/usr/bin/2s2h"
  install -Dm644 "${srcdir}/2s2h.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 mm/linux/2s2hIcon.png "${pkgdir}/usr/share/pixmaps/2s2h.png"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/2s2h/LICENSE"

  # Copy game documentation
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/2s2h/README.md"
  #cp -r docs "${pkgdir}/usr/share/doc/2s2h/docs"
}

package_2s2h-otr-exporter() {
  pkgdesc="OTR generation tools for 2S2H. Includes asset XML files needed for generation"
  license=("MIT")
  depends=("${_depends_2s2h_otr_exporter[@]}" "${_depends_lus[@]}")

  cd "${srcdir}/${_reponame}-${pkgver}"

  DESTDIR="${pkgdir}" cmake --install build --component extractor

  install -Dm644 "OTRExporter/LICENSE" "${pkgdir}/usr/share/licenses/2s2h-otr-exporter/LICENSE"
}
