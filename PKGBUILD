# Maintainer: AltoXorg <atrl101 AT yahoo DOT com>

_reponame=2ship2harkinian
pkgbase=2s2h-git
pkgname=(2s2h-git 2s2h-otr-exporter-git)
pkgver=2.0.0.r0.g5139d60c4
pkgrel=1
arch=("x86_64" "i686" "armv7h" "aarch64")
#url="https://shipofharkinian.com/"
url="https://github.com/HarbourMasters/${_reponame}"
_depends_2s2h=("sdl2" "zenity" "libpng" "libogg" "libvorbis" "opus" "opusfile")
_depends_2s2h_otr_exporter=("libpng")
_depends_lus=("libzip" "fmt" "spdlog" "tinyxml2")
depends=("${_depends_2s2h[@]}" "${_depends_2s2h_otr_exporter[@]}" "${_depends_lus[@]}")
makedepends=("git" "cmake" "ninja" "python" "curl" "lsb-release" "boost" "nlohmann-json")
source=("git+https://github.com/HarbourMasters/${_reponame}.git"
        "git+https://github.com/Kenix3/libultraship.git"
        "git+https://github.com/HarbourMasters/OTRExporter.git"
        #"git+https://github.com/HarbourMasters/ZAPDTR.git"
        "git+https://github.com/louist103/ZAPDTR.git"
        "2s2h.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
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

_init_submodules() {
  dir="$1"
  shift 1

  for sub in "$@"; do
    git submodule init "${dir}${sub}"
    git config "submodule.${dir}${sub}.url" "${srcdir}/${sub}"
    git -c protocol.file.allow=always submodule update "${dir}${sub}"
  done
}

pkgver() {
  cd "${srcdir}/${_reponame}"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_reponame}"

  # Init all submodules
  _init_submodules "" "${_main_submodules[@]}"
}

build() {
  cd "${srcdir}/${_reponame}"

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

package_2s2h-git() {
  pkgdesc="An unofficial port of The Legend of Zelda Majora's Mask (git)"
  provides=("2s2h")
  conflicts=("2s2h")
  depends=("${_depends_2s2h[@]}" "${_depends_lus[@]}")
  license=("CC0-1.0")
  install=2s2h.install

  cd "${srcdir}/${_reponame}"

  DESTDIR="${pkgdir}" cmake --install build --component ship
  DESTDIR="${pkgdir}" cmake --install build --component 2s2h

  install -dm755 "${pkgdir}/usr/bin/"
  ln -s "${SHIP_PREFIX}/2s2h.elf" "${pkgdir}/usr/bin/2s2h"
  install -Dm644 "${srcdir}/2s2h.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 mm/linux/2s2hIcon.png "${pkgdir}/usr/share/pixmaps/2s2h.png"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/2s2h-git/LICENSE"

  # Copy game documentation
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/2s2h/README.md"
  #cp -r docs "${pkgdir}/usr/share/doc/2s2h/docs"
}

package_2s2h-otr-exporter-git() {
  pkgdesc="OTR generation tools for 2S2H. Includes asset XML files needed for generation. (git)"
  provides=("2s2h-otr-exporter")
  conflicts=("2s2h-otr-exporter")
  license=("MIT")
  depends=("${_depends_2s2h_otr_exporter[@]}" "${_depends_lus[@]}")

  cd "${srcdir}/${_reponame}"

  DESTDIR="${pkgdir}" cmake --install build --component extractor

  install -Dm644 "OTRExporter/LICENSE" "${pkgdir}/usr/share/licenses/2s2h-otr-exporter-git/LICENSE"
}
