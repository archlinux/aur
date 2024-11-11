# Maintainer: AltoXorg <atrl101 AT yahoo DOT com>

_reponame=2ship2harkinian
_lus_commit=4160fa0aa07d3946cbed5e397c54e6260f67dc5a
_ZAPDTR_commit=b002f28757a7ff9f928a4d9dd1834137edb144bb
_OTRExporter_commit=854685155a6addaf72ec2415ac481a08ace9f9ce

pkgbase=2s2h
pkgname=(2s2h 2s2h-otr-exporter)
pkgver=1.1.0
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
        "2s2h.desktop")
sha256sums=('71c27f9761f2a5bd7f1ea1b4baa5de5d52ab7831d92b9937c049630f5a13bded'
            '998cb7006abbeefd6b54d9a4b36769da8c09a526ac0c2346c5221f95b1b17d2a'
            'baead3b1ca4376d46a5a633ddc0ebf3f790c8f3517fc3c99108e190c0cf5b618'
            'ce6c7de6ca1837770611b95ac81103d01e070916aca00afd358499a24da72365'
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
