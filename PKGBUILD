# Maintainer: AltoXorg <atrl101 AT yahoo DOT com>

_reponame=Shipwright
_lus_commit=1ca7d0fa78013e49450a4a9881236a19a6600d64
_ZAPDTR_commit=eff29036118349e142ee8efca80fd975a2a2b6ff
_OTRExporter_commit=04b85b95fab07a394b62dcd28a502a3040f08e0c

pkgbase=soh
pkgname=(soh soh-otr-exporter)
pkgver=8.0.6
pkgrel=1
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://shipofharkinian.com/"
_depends_soh=("sdl2" "sdl2_net" "libpulse" "glew" "zenity")
_depends_soh_otr_exporter=("libpng")
depends=("${_depends_soh[@]}" "${_depends_soh_otr_exporter[@]}")
makedepends=("cmake" "ninja" "python" "curl" "lsb-release" "boost")
source=("${_reponame}-${pkgver}.tar.gz::https://github.com/HarbourMasters/${_reponame}/archive/refs/tags/${pkgver}.tar.gz"
        "libultraship-${_lus_commit:0:8}.tar.gz::https://github.com/Kenix3/libultraship/archive/${_lus_commit}.tar.gz"
        #"libultraship-${_lus_tag}.tar.gz::https://github.com/Kenix3/libultraship/archive/refs/tags/${_lus_tag}.tar.gz"
        "ZAPDTR-${_ZAPDTR_commit:0:8}.tar.gz::https://github.com/HarbourMasters/ZAPDTR/archive/${_ZAPDTR_commit}.tar.gz"
        "OTRExporter-${_OTRExporter_commit:0:8}.tar.gz::https://github.com/HarbourMasters/OTRExporter/archive/${_OTRExporter_commit}.tar.gz"
        "misc-compile-fixes.patch::https://github.com/HarbourMasters/${_reponame}/commit/1bc15d5bf3042d4fd64e1952eb68c47a7d5d8061.patch"
        "soh.desktop")
sha256sums=('cd1f45b19266d8848cd3251600a4fb3d255fb359bd02bc9e9294332b1f8e9a65'
            'f85227373ed22e6d016266563fb3eb68a2dc3a5476b4ad9ac9c1c1a4a4c6ec85'
            '6438cd1c7abad6ea9b65326892a1b220384bdce78e9d1a324c132d68c982111c'
            '5f5ff0a0eb7f5536c9076dd777d3914c4b2e064c7a22303a24c1a4a9ed7d462f'
            'e39dbd17a8b2e584465bfc5c0c5667bf331072edf9d08abde328393ece626f5e'
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

  # Patch every compilation errors available
  patch -Np1 < "${srcdir}/misc-compile-fixes.patch" || true
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
