# Maintainer: AltoXorg <machinademoniko@gmail.com>

_reponame=Starship
pkgname=starship-sf64-git
pkgver=v2.0.0.r74.g3d882079
pkgrel=1
pkgdesc="An unofficial native port of Star Fox 64 (git)"
license=("CC0-1.0" "MIT")
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/HarbourMasters/${_reponame}"
provides=("starship-sf64")
conflicts=("starship-sf64")
depends=("sdl2" "zenity" "libogg" "libvorbis" "libzip" "tinyxml2" "fmt" "spdlog" "zlib" "bzip2")
makedepends=("git" "cmake" "ninja" "nlohmann-json")  # nlohmann-json is set as required on LUS's CMakeLists.txt but not dynamic linked
install="starship-sf64.install"
source=("git+https://github.com/HarbourMasters/${_reponame}.git"
        "git+https://github.com/HarbourMasters/Torch.git"
        "git+https://github.com/Kenix3/libultraship.git"
        "git+https://github.com/mdqinc/SDL_GameControllerDB"
        "starship-stack-underflow-guard.patch"
        "starship-sf64.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
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

_init_submodule() {
  dir="$1"
  sub="${2:-$1}"

  git submodule init "${dir}"
  git config "submodule.${dir}.url" "${srcdir}/${sub}"
  git -c protocol.file.allow=always submodule update "${dir}"
}

# -- Print helpers
_msg_info() {
  echo "${BOLD}>> ${GREEN}$@${ALL_OFF}"
}

_msg_warn() {
  echo "${BOLD}>> ${YELLOW}$@${ALL_OFF}"
}

_walk_submodules() {
    absdir="$(pwd | sed "s|^${srcdir}/||")"
    _msg_info "Entering directory <${absdir}>"

    local submodules="$(git ls-tree -r HEAD | awk '$2 == "commit"')"

    if [ -z "$submodules" ]; then
      return
    fi

    local mode type hash dir
    while ifs=" " read -r mode type hash dir; do
        local basedir="$(basename "$dir")"
        local submodule_url="$(git config -f .gitmodules "submodule.${dir}.url")"

        if [ ! -e "${srcdir}/${basedir}" ]; then
            _msg_warn "Local repository ${basedir} (${submodule_url}) is missing. ${dir} is ignored for init!"
            continue
        fi

        _msg_info "Initializing submodule ${dir}"

        # Check if this specific commit exists locally within the repo
        (
            cd "${srcdir}/${basedir}"
            if ! git branch -a --contains "$hash" > /dev/null; then
                _msg_warn "Commit ${hash} of repo ${basedir} didn't get pulled from remote (${submodule_url}). Fetching now..."
                git fetch "$submodule_url" "$hash"
            fi
        )

        # Initialize and update submodule
        git submodule init "${dir}"
        git config "submodule.${dir}.url" "${srcdir}/${basedir}"
        git -c protocol.file.allow=always submodule update "${dir}"

        ( cd "$dir"; _walk_submodules; )
    done <<< "$submodules"

    _msg_info "Leaving directory <${absdir}>"
}

pkgver() {
  cd "${srcdir}/${_reponame}"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd "${srcdir}/${_reponame}"
  _walk_submodules

  patch -Np1 -i "${srcdir}/starship-stack-underflow-guard.patch"
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
  cmake --build build --config $BUILD_TYPE --target GeneratePortO2R  # Generates starship.o2r
}

package() {
  cd "${srcdir}/${_reponame}"

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
        "${srcdir}/SDL_GameControllerDB/gamecontrollerdb.txt"

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
