# Maintainer: AltoXorg <machinademoniko@gmail.com>

_reponame=SpaghettiKart
pkgname=spaghettikart-git
_pkgver=0.9.9.1
pkgver=0.9.9.1.Latest2.r180.gdb01cf3d6
pkgrel=1
pkgdesc="An unofficial native port of Mario Kart 64 (git)"
license=("unknown" "MIT")
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/HarbourMasters/${_reponame}"
provides=("spaghettikart")
conflicts=("spaghettikart")
depends=("sdl2" "sdl2_net" "zenity" "libogg" "libvorbis" "libzip" "tinyxml2" "fmt" "spdlog")
makedepends=("git" "cmake" "ninja" "nlohmann-json")  # nlohmann-json is set as required on LUS's CMakeLists.txt but not dynamic linked
install="spaghettikart.install"
source=("git+https://github.com/HarbourMasters/${_reponame}.git"
        "git+https://github.com/HarbourMasters/Torch.git"
        "git+https://github.com/Kenix3/libultraship.git"
        "git+https://github.com/mdqinc/SDL_GameControllerDB.git"
        "spaghettikart-cmake-flags.patch"
        "spaghettikart.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '2318ff2a4d1cd282e11a8167f18c9e51193a389d605da338d894557c527e848b'
            '4c17e6b2514dbc11c87542b2c99bb2de1fed8747a562b9c26a908c3ea86a6f5e')

SHIP_PREFIX=/opt/spaghettikart

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

  # The tag should have been in a version format, so my solution is to
  # Append both with the current package version and the reported git tag
  echo -n "${_pkgver}."  # TEMP fix until this resolved
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd "${srcdir}/${_reponame}"

  _init_submodule libultraship
  _init_submodule torch Torch

  # Required patch for compilation
  patch -Np1 -i "../spaghettikart-cmake-flags.patch"
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
  cmake --build build --config $BUILD_TYPE --target GenerateO2R  # Generates spaghetti.o2r
}

package() {
  cd "${srcdir}/${_reponame}"

  # Create Directories
  install -dm755 "${pkgdir}/${SHIP_PREFIX}" "${pkgdir}/usr/bin/"

  # Main executable & assets to /opt
  cp -r build/yamls "${pkgdir}/${SHIP_PREFIX}"
  install -m755 build/Spaghettify "${pkgdir}/${SHIP_PREFIX}"
  install -m644 -t "${pkgdir}/${SHIP_PREFIX}" \
        build/config.yml \
        build/spaghetti.o2r \
        "${srcdir}/SDL_GameControllerDB/gamecontrollerdb.txt"

  # Link executable to /usr/bin, add to desktop entry & icons
  ln -s "${SHIP_PREFIX}/Spaghettify" "${pkgdir}/usr/bin/Spaghettify"
  install -Dm644 "${srcdir}/spaghettikart.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/spaghettikart.png"

  # Licenses (HarbourMasters libraries are MIT, game engine + port source code is nonfree)
  install -Dm644 "libultraship/LICENSE" "${pkgdir}/usr/share/licenses/spaghettikart/libultraship-LICENSE"
  install -Dm644 "torch/LICENSE" "${pkgdir}/usr/share/licenses/spaghettikart/torch-LICENSE"

  # Copy game documentation
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/spaghettikart/README.md"
}
