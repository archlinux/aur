# Maintainer: AltoXorg <machinademoniko@gmail.com>

_reponame=Ghostship
_torch_commit=aaed953d180356f933bc0011d250f7de1366c42e
_lus_commit=8c55f607f2249f3ac696fc0f7277553fe3ce75a6
_sdl_gcdb_commit=07a5c6b80262a208200573186eb5d5ac2518e89d  # This needs to be updated on every package release

pkgname=ghostship
pkgver=1.0.1
pkgrel=1
pkgdesc="A yet another definitive port of Super Mario 64 coming out of Harbour Masters"
license=("MIT")
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/HarbourMasters/${_reponame}"
depends=("sdl2" "zenity" "libzip" "tinyxml2" "fmt" "spdlog")
makedepends=("git" "cmake" "ninja" "nlohmann-json")  # nlohmann-json is set as required on LUS's CMakeLists.txt but not dynamic linked
install="ghostship.install"
source=("${_reponame}-${pkgver}.tar.gz::https://github.com/HarbourMasters/${_reponame}/archive/refs/tags/${pkgver}.tar.gz"
        "Torch-${_torch_commit:0:8}.tar.gz::https://github.com/HarbourMasters/Torch/archive/${_torch_commit}.tar.gz"
        "libultraship-${_lus_commit:0:8}.tar.gz::https://github.com/Kenix3/libultraship/archive/${_lus_commit}.tar.gz"
        "https://github.com/mdqinc/SDL_GameControllerDB/raw/${_sdl_gcdb_commit}/gamecontrollerdb.txt"
        "ghostship-fix-mtxf_copy-incorrect-values.patch"
        "ghostship.desktop")
sha256sums=('dbccfbfc9bfb60924078b7f1035698150e5c6409822faa8dc922b4dac72a2852'
            '9cb17f0a5babc1a1e9a79cc7debc4fb43096ace4b7a9cccd99e9fb59facbff66'
            '0828b92327156da8683615bb2490c93f1acb141fcf6934b55140b4d801ca66f4'
            'f7309161d315a520392b5e4cf7bb409ad18b613807a9b3266a33664e4de02d3c'
            '938879042af21330e36476fb88cd383e85c1b7e19d95cb74957fd1266ef83854'
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


prepare() {
  cd "${srcdir}/${_reponame}-${pkgver}"

  rm -r libultraship Torch
  cp -r ../libultraship-${_lus_commit} libultraship
  cp -r ../Torch-${_torch_commit} Torch

  patch -Np1 -i "${srcdir}/ghostship-fix-mtxf_copy-incorrect-values.patch"
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
  cmake --build build --config $BUILD_TYPE --target GeneratePortO2R
}

package() {
  cd "${srcdir}/${_reponame}-${pkgver}"

  # Create Directories
  install -dm755 "${pkgdir}/${SHIP_PREFIX}" "${pkgdir}/usr/bin/"

  # Main executable & assets to /opt
  cp -r build/assets "${pkgdir}/${SHIP_PREFIX}"
  install -m755 build/Ghostship "${pkgdir}/${SHIP_PREFIX}"
  install -m644 -t "${pkgdir}/${SHIP_PREFIX}" \
        build/config.yml \
        build/ghostship.o2r \
        "${srcdir}/gamecontrollerdb.txt"

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
