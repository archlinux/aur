# Maintainer: AltoXorg <atrl101 AT yahoo DOT com>

_reponame=2ship2harkinian
_lus_commit=0c4b491125e86709400d7bae866159eecd079d38
_ZAPDTR_commit=ce2d63d8dd594a8ebc35073868d071aa36258317
_OTRExporter_commit=c2a891be8ba1d33e09ee39eb4bf1c95e3b753e0e

pkgbase=2s2h
pkgname=(2s2h 2s2h-otr-exporter)
pkgver=1.0.0
pkgrel=1
arch=("x86_64" "i686" "armv7h" "aarch64")
#url="https://shipofharkinian.com/"
url="https://github.com/HarbourMasters/${_reponame}"
_depends_2s2h=("sdl2" "zenity" "libzip" "libpng")
_depends_2s2h_otr_exporter=("libpng")
_depends_lus=("fmt" "spdlog" "tinyxml2")
depends=("${_depends_2s2h[@]}" "${_depends_2s2h_otr_exporter[@]}" "${_depends_lus[@]}")
makedepends=("git" "cmake" "ninja" "python" "curl" "lsb-release" "boost" "nlohmann-json")
source=("${_reponame}-${pkgver}.tar.gz::https://github.com/HarbourMasters/${_reponame}/archive/refs/tags/${pkgver}.tar.gz"
        "libultraship-${_lus_commit:0:8}.tar.gz::https://github.com/Kenix3/libultraship/archive/${_lus_commit}.tar.gz"
        "OTRExporter-${_OTRExporter_commit:0:8}.tar.gz::https://github.com/louist103/OTRExporter/archive/${_OTRExporter_commit}.tar.gz"
        "ZAPDTR-${_ZAPDTR_commit:0:8}.tar.gz::https://github.com/louist103/ZAPDTR/archive/${_ZAPDTR_commit}.tar.gz"
        "non-portable-fixes.patch::https://github.com/Alto1772/2ship2harkinian/commit/08c485b5ece03df6256977aeac4a134eb86a9288.patch"
        "2s2h.desktop")
sha256sums=('96d9dbae53fcdcdf69c4fb1dd0e2308e50f022ce49240be32c982d59c809424e'
            '8c6e7183b6d07725a2000d641cb259e054ed60724034318bfc23c5e1b0820551'
            'd4606861376bcd40352283324626eb8800aea8a04415fead1cb37ca59f5df510'
            '8ff2cce232e4152a7161ca35c9eb88b013b071ca19fc79bc8854417f54f455d7'
            '95a50046e1bdc43315c75fe3ae4c9372e04de1580e43fb12857a318c6c584413'
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

  patch -Np1 < "${srcdir}/non-portable-fixes.patch" || true
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
