# Maintainer: AltoXorg <machinademoniko AT gmail DOT com>

# For package compiling issues, comment at the AUR package comments section or PM me on Discord @AltoXorg
# and I will try my best to resolve your problem if possible.
# This is much very experimental, so expect some game issues and crashes...

# An N64 Majora's Mask US ROM must be provided in order to build this package.
# Rename it to "baserom.mm.us.rev1.z64" and place it right to where this script is.

_reponame=Zelda64Recomp
_pkgname=${_reponame,,}
pkgname=${_pkgname}-git
pkgver=1.2.2.r0.g54950a1
_zrecomp_dirname="${_reponame}"
pkgrel=1
arch=("x86_64" "aarch64")
depends=("sdl2" "freetype2" "libx11" "libxrandr" "gtk3" "vulkan-driver" "vulkan-icd-loader")
makedepends=("git" "cmake" "ninja" "python" "make" "clang19" "lld" "mold")
pkgdesc="A port of The Legend of Zelda Majora's Mask made possible by static recompilation (git)"
license=("GPL-3.0-only")
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")  #  i don't have control over the bin version so i'll append this anyway...
url="https://github.com/Zelda64Recomp/${_reponame}"
source=("git+${url}.git#branch=dev"

        # main dependencies
        "git+https://github.com/mikke89/RmlUi.git"
        "git+https://github.com/rt64/rt64.git"
        #"git+https://github.com/ubawurinna/freetype-windows-binaries.git"
        "mm-decomp::git+https://github.com/zeldaret/mm.git"
        "git+https://github.com/sammycage/lunasvg.git"
        "git+https://github.com/DLTcollab/sse2neon.git"
        "git+https://github.com/N64Recomp/N64ModernRuntime.git"
        "git+https://github.com/Zelda64Recomp/Zelda64RecompSyms.git"
        "git+https://github.com/SergeyMakeev/slot_map.git"

        # RT64 dependencies
        "git+https://github.com/epezent/implot.git"
        "git+https://github.com/redorav/hlslpp.git"
        #"git+https://github.com/mupen64plus/mupen64plus-win32-deps.git"
        #"git+https://github.com/mupen64plus/mupen64plus-core.git"
        "git+https://github.com/Cyan4973/xxHash.git"
        "git+https://github.com/zeux/volk.git"
        "git+https://github.com/KhronosGroup/Vulkan-Headers.git"
        "git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git"
        "git+https://github.com/ocornut/imgui.git"
        "git+https://github.com/john-chapman/im3d.git"
        #"git+https://github.com/GPUOpen-LibrariesAndSDKs/D3D12MemoryAllocator.git"
        "dxc::git+https://github.com/rt64/dxc-bin.git"
        "git+https://github.com/nothings/stb.git"
        "git+https://github.com/btzy/nativefiledialog-extended.git"
        "git+https://github.com/redorav/ddspp.git"
        "git+https://github.com/facebook/zstd.git"
        "git+https://github.com/rt64/re-spirv.git"

        # N64ModernRuntime dependencies
        "git+https://github.com/richgel999/miniz.git"
        "git+https://github.com/N64Recomp/o1heap.git"

        # re-spirv dependencies
        "git+https://github.com/KhronosGroup/SPIRV-Headers.git"

        # Tools for building MM elf and generating static recomps
        "git+https://github.com/z64tools/z64decompress.git"
        "git+https://github.com/N64Recomp/N64Recomp.git"

        # N64Recomp dependencies
        "git+https://github.com/Decompollaborate/rabbitizer.git"
        "git+https://github.com/serge1/ELFIO.git"
        "git+https://github.com/fmtlib/fmt.git"
        "git+https://github.com/marzer/tomlplusplus.git"
        "git+https://github.com/zherczeg/sljit.git"

        # Misc. patches and the rom requirement
        "zelda64recomp.desktop"
        "file://baserom.mm.us.rev1.z64")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '59443fba2781cecccf96f76772a04764477c1c57d3226baa43d8cc3c30b085ad'
            'efb1365b3ae362604514c0f9a1a2d11f5dc8688ba5be660a37debf5e3be43f2b')

PKG_PREFIX="/opt/${_pkgname}"


# -- Print helpers
_msg_info() {
  echo "${BOLD}>> ${GREEN}$@${ALL_OFF}"
}

_msg_warn() {
  echo "${BOLD}>> ${YELLOW}$@${ALL_OFF}"
}

_is_debug() {
  for opt in "${OPTIONS[@]}"; do
    if [ "$opt" = debug ]; then
      return 0
    fi
  done

  return 1
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
            _msg_warn "Local repository ${basedir} (${submodule_url}) is missing from this PKGBUILD's directory. ${dir} is ignored for init!"
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

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  _msg_info "Setting up the submodules..."

  cd "${srcdir}/${_zrecomp_dirname}"
  _walk_submodules

  cd "${srcdir}/N64Recomp"
  _walk_submodules


  #_msg_info "Patching stuff up..."
}

build() {
  _msg_info "Building the N64Recomp & RSPRecomp tools..."

  cd "${srcdir}/N64Recomp"

  cmake -B build -DCMAKE_BUILD_TYPE=Release .
  cmake --build build --target N64RecompCLI
  cmake --build build --target RSPRecomp

  cp build/{N64Recomp,RSPRecomp} "${srcdir}/${_zrecomp_dirname}"


  _msg_info "Building z64decompress and decompressing the MM rom"

  cd "${srcdir}/z64decompress"
  make
  ./z64decompress "${srcdir}/baserom.mm.us.rev1.z64" mm.us.rev1.rom_uncompressed.z64
  cp mm.us.rev1.rom_uncompressed.z64 "${srcdir}/${_zrecomp_dirname}/"


  cd "${srcdir}/${_zrecomp_dirname}"

  _msg_info "Generating recomp functions..."
  ./RSPRecomp aspMain.us.rev1.toml
  ./RSPRecomp njpgdspMain.us.rev1.toml
  ./N64Recomp us.rev1.toml


  _msg_info "Building the game..."

  if _is_debug; then
    BUILD_TYPE=RelWithDebInfo
  else
    BUILD_TYPE=Release
  fi

  # The entirety of the codebase doesn't care about security at all so we'll remove this flag
  export CFLAGS="${CFLAGS/-Werror=format-security/}"
  export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"
  # Use faster mold linker
  export LDFLAGS="$LDFLAGS -fuse-ld=mold"
  # Clang 20+ causes compile issues, we'll stay at version 19 for now
  export PATH="/usr/lib/llvm19/bin/:${PATH}"

  # Use recommended clang compiler
  cmake -B build -GNinja . \
    -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_C_COMPILER=clang

  cmake --build build $NINJAFLAGS
}


package() {
  cd "${srcdir}"

  bin_name=Zelda64Recompiled

  cat << SHELL > launch.sh
#!/usr/bin/env bash
cd "${PKG_PREFIX}"
exec ./${bin_name}
SHELL

  install -Dm755 "${_zrecomp_dirname}/build/${bin_name}" "${pkgdir}/${PKG_PREFIX}/${bin_name}"

  # Strip the executable whether you like it or not, except for debugging purposes...
  if ! _is_debug; then
    strip --strip-all "${pkgdir}/${PKG_PREFIX}/${bin_name}"
  fi

  cp -r --preserve=mode "${_zrecomp_dirname}/assets" "${pkgdir}/${PKG_PREFIX}/"
  install -Dm644 "${_zrecomp_dirname}/recompcontrollerdb.txt" "${pkgdir}/${PKG_PREFIX}/"

  install -Dm755 launch.sh "${pkgdir}/usr/bin/${bin_name}"
  install -Dm644 zelda64recomp.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${_zrecomp_dirname}/icons/512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/zelda64recomp.png"

  install -Dm644 "${_zrecomp_dirname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
