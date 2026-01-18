# Maintainer: AltoXorg <machinademoniko@gmail.com>

_reponame=Ghostship
pkgname=ghostship-git
pkgver=1.0.0.r14.gdf7e9119
pkgrel=1
pkgdesc="A yet another definitive port of Mario Kart 64 made by HarbourMasters team"
license=("MIT")
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/HarbourMasters/${_reponame}"
provides=("ghostship")
conflicts=("ghostship")
depends=("sdl2" "zenity" "libzip" "tinyxml2" "fmt" "spdlog")
makedepends=("git" "cmake" "ninja" "nlohmann-json")  # nlohmann-json is set as required on LUS's CMakeLists.txt but not dynamic linked
install="ghostship.install"
source=("git+https://github.com/HarbourMasters/${_reponame}.git"
        "git+https://github.com/HarbourMasters/Torch.git"
        "git+https://github.com/Kenix3/libultraship.git"
        "git+https://github.com/mdqinc/SDL_GameControllerDB.git"
        "ghostship.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '230c28306ca1bd47976d3fb69d2cb50078b59e7ead713f187d804cd009b870e8')

SHIP_PREFIX=/opt/ghostship

_is_debug() {
  for opt in "${OPTIONS[@]}"; do
    if [ "$opt" = debug ]; then
      return 0
    fi
  done

  return 1
}


_init_submodule() {
  dir="$1"
  sub="${2:-$1}"

  git submodule init "${dir}"
  git config "submodule.${dir}.url" "${srcdir}/${sub}"
  git -c protocol.file.allow=always submodule update "${dir}"
}

pkgver() {
  cd "${srcdir}/${_reponame}"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd "${srcdir}/${_reponame}"

  _init_submodule libultraship
  _init_submodule Torch
}

build() {
  cd "${srcdir}/${_reponame}"

  if _is_debug; then
    BUILD_TYPE=RelWithDebInfo
  else
    BUILD_TYPE=Release
  fi

  export CFLAGS="${CFLAGS/-Werror=format-security/}"
  export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"

  cmake . \
    -Bbuild \
    -GNinja \
    -DNON_PORTABLE=On \
    -DCMAKE_INSTALL_PREFIX=$SHIP_PREFIX

  cmake --build build --config $BUILD_TYPE $NINJAFLAGS
  cmake --build build --config $BUILD_TYPE --target GeneratePortO2R
}

package() {
  cd "${srcdir}/${_reponame}"

  # Create Directories
  install -dm755 "${pkgdir}/${SHIP_PREFIX}" "${pkgdir}/usr/bin/"

  # Main executable & assets to /opt
  cp -r build/assets "${pkgdir}/${SHIP_PREFIX}"
  install -m755 build/Ghostship "${pkgdir}/${SHIP_PREFIX}"
  install -m644 -t "${pkgdir}/${SHIP_PREFIX}" \
        build/config.yml \
        build/ghostship.o2r \
        "${srcdir}/SDL_GameControllerDB/gamecontrollerdb.txt"

  # Link executable to /usr/bin, add to desktop entry & icons
  ln -s "${SHIP_PREFIX}/Ghostship" "${pkgdir}/usr/bin/Ghostship"
  install -Dm644 "${srcdir}/ghostship.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 logo.png "${pkgdir}/usr/share/pixmaps/ghostship.png"

  # Licenses (HarbourMasters libraries and port source code are MIT)
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/ghostship/LICENSE.md"
  install -Dm644 "libultraship/LICENSE" "${pkgdir}/usr/share/licenses/ghostship/libultraship-LICENSE"
  install -Dm644 "Torch/LICENSE" "${pkgdir}/usr/share/licenses/ghostship/torch-LICENSE"

  # Copy game documentation
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/ghostship/README.md"
}
