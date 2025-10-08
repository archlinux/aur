# Maintainer: AltoXorg <machinademoniko@gmail.com>

_reponame=Starship
_torch_commit=f75facb20883570ed091e8ae733ec0539f606e57
_lus_commit=45c4f8d6c19c6176f5e0918917c655ea09ecc212
_sdl_gcdb_commit=dce2d3593c6a96a57716d13d58aa3b1d4965fe6f  # This needs to be updated on every package release

pkgname=starship-sf64
pkgver=2.0.0
pkgrel=3
pkgdesc="An unofficial native port of Star Fox 64"
license=("CC0-1.0" "MIT")
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/HarbourMasters/${_reponame}"
depends=("sdl2" "zenity" "libogg" "libvorbis" "libzip" "tinyxml2" "fmt" "spdlog" "zlib" "bzip2")
makedepends=("git" "cmake" "ninja" "nlohmann-json")  # nlohmann-json is set as required on LUS's CMakeLists.txt but not dynamic linked
install="starship-sf64.install"
source=("${_reponame}-${pkgver}.tar.gz::https://github.com/HarbourMasters/${_reponame}/archive/refs/tags/v${pkgver}.tar.gz"
        "Torch-${_torch_commit:0:8}.tar.gz::https://github.com/HarbourMasters/Torch/archive/${_torch_commit}.tar.gz"
        "libultraship-${_lus_commit:0:8}.tar.gz::https://github.com/Kenix3/libultraship/archive/${_lus_commit}.tar.gz"
        "https://github.com/mdqinc/SDL_GameControllerDB/raw/${_sdl_gcdb_commit}/gamecontrollerdb.txt"
        "torch-src-dest-paths.patch::https://github.com/HarbourMasters/Torch/pull/187.patch"
        "lus-save-file-path.patch::https://github.com/Kenix3/libultraship/pull/908.patch"
        "starship-non-portable-fix.patch"
        "starship-stack-underflow-guard.patch"
        "starship-sf64.desktop")
sha256sums=('e96e03c5f077d045ced5488208b60bdc4077c381158d17b2571f9a476622d20b'
            'c6d98c370efa078029a98d6cc71d876d530b0827a04f2235b65be5dbb4d31220'
            '233f9d4e38b5b2b492b6d8e5e9e856605439cb7d955c7668fdf22809916bc6e9'
            'a401e7784adb216419677d401b14f2c8b1b3247d00e35f617ea5900da3ea409e'
            '80cb215a02a38d5148bf9084721774427857fd6ba187609156439a391d25907e'
            '906d6265cf744c6f988f39b5986232304801a8a49aea1e39cf8911bd83ddc497'
            '4a83fe383d6f134258c2dbc59b4c18e97a7a68893a6ce798d0cf83866de26382'
            'fdd57de6bdec69803f13897a30116c8a01c9e5dd3eeb83e5e754b0bfb5723c12'
            '1a8c55f65d81c5e69cf8bc81109552ec62144b7d27733f3ccd2b4862341c63ca')

SHIP_PREFIX=/opt/starship-sf64

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

  rm -r libultraship tools/Torch
  cp -r ../libultraship-${_lus_commit} libultraship
  cp -r ../Torch-${_torch_commit} tools/Torch

  patch -Np1 -i "${srcdir}/starship-non-portable-fix.patch"
  patch -Np1 -i "${srcdir}/starship-stack-underflow-guard.patch"

  cd libultraship
  patch -Np1 -i "${srcdir}/lus-save-file-path.patch"

  cd ../tools/Torch
  patch -Np1 -i "${srcdir}/torch-src-dest-paths.patch"
}

build() {
  cd "${srcdir}/${_reponame}-${pkgver}"

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
  cmake --build build --config $BUILD_TYPE --target GeneratePortO2R  # Generates starship.o2r
}

package() {
  cd "${srcdir}/${_reponame}-${pkgver}"

  # Create Directories
  install -dm755 "${pkgdir}/${SHIP_PREFIX}"
  install -dm755 "${pkgdir}/usr/bin/"

  # Create Directories
  install -dm755 "${pkgdir}/${SHIP_PREFIX}" "${pkgdir}/usr/bin/"

  # Main executable & assets to /opt
  cp -r build/assets "${pkgdir}/${SHIP_PREFIX}"
  install -m755 build/Starship "${pkgdir}/${SHIP_PREFIX}"
  install -m644 -t "${pkgdir}/${SHIP_PREFIX}" \
        build/config.yml \
        build/starship.o2r \
        "${srcdir}/gamecontrollerdb.txt"

  # Link executable to /usr/bin, add to desktop entry & icons
  ln -s "${SHIP_PREFIX}/Starship" "${pkgdir}/usr/bin/StarshipSF64"
  install -Dm644 "${srcdir}/starship-sf64.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 logo.png "${pkgdir}/usr/share/pixmaps/starship-sf64.png"

  # Licenses
  install -Dm644 "libultraship/LICENSE" "${pkgdir}/usr/share/licenses/starship-sf64/libultraship-LICENSE"
  install -Dm644 "tools/Torch/LICENSE" "${pkgdir}/usr/share/licenses/starship-sf64/torch-LICENSE"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/starship-sf64/LICENSE.md"

  # Copy game documentation
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/starship-sf64/README.md"
}
