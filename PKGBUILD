# Maintainer: AltoXorg <machinademoniko AT gmail DOT com>

# For package compiling issues, comment at the AUR package comments section or PM me on Discord @AltoXorg
# and I will try my best to resolve your problem if possible.

# An N64 Banjo-Kazooie NTSC-U 1.0 ROM must be provided in order to build this package.
# Rename it to following baserom name and place it right to where this PKGBUILD resides.

_reponame=BanjoRecomp
_baserom="baserom.us.rev0.z64"    # <-- Rename your rom file to this
_rom_uncompressed="banjo.us.v10.decompressed.z64"
_bin_name=BanjoRecompiled

_recomp_dir="${_reponame}"
_pkgname=${_reponame,,}
pkgname=${_pkgname}
pkgver=1.0.0
pkgrel=1
arch=("x86_64" "aarch64")
depends=("sdl2" "freetype2" "gtk3" "vulkan-driver" "vulkan-icd-loader" "hicolor-icon-theme")
makedepends=("git" "cmake" "ninja" "make" "clang20" "lld20" "mold" "rust")
pkgdesc="A static recompiled port of N64 Banjo-Kazooie for PC"
license=("GPL-3.0-only")
url="https://github.com/${_reponame}/${_reponame}"
source=("git+${url}.git#tag=v${pkgver}"

        # main dependencies
        "git+https://github.com/N64Recomp/N64ModernRuntime.git"
        "git+https://github.com/rt64/rt64.git"
        "bk-decomp::git+https://gitlab.com/banjo.decomp/banjo-kazooie.git"
        "git+https://github.com/${_reponame}/${_reponame}Syms.git"
        "git+https://github.com/N64Recomp/RecompFrontend.git"

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
        "git+https://github.com/renderbag/plume.git"

        # N64ModernRuntime dependencies
        "git+https://github.com/richgel999/miniz.git"
        "git+https://github.com/N64Recomp/o1heap.git"

        # RecompFrontend dependencies
        "git+https://github.com/sammycage/lunasvg.git"
        "git+https://github.com/mikke89/RmlUi.git"
        #"git+https://github.com/ubawurinna/freetype-windows-binaries"

        # re-spirv dependencies
        "git+https://github.com/KhronosGroup/SPIRV-Headers.git"

        # Tools for generating static recomps
        "git+https://github.com/MittenzHugg/bk_rom_compressor.git"
        "git+https://github.com/N64Recomp/N64Recomp.git"

        # N64Recomp dependencies
        "git+https://github.com/Decompollaborate/rabbitizer.git"
        "git+https://github.com/serge1/ELFIO.git"
        "git+https://github.com/fmtlib/fmt.git"
        "git+https://github.com/marzer/tomlplusplus.git"
        "git+https://github.com/zherczeg/sljit.git"

        # bk_rom_compressor dependencies
        "git+https://github.com/MittenzHugg/rarezip.git"

        # Misc. patches and the rom requirement
        "${_pkgname}.desktop"
        "file://${_baserom}")
sha256sums=('f51547b11e6c4a67bf879ae8aa60cf001df9412079652e97fa2960274b915db6'
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
            'SKIP'
            '231b48ef3b38bb06b4412ec911c13d5938f29b511ea0a814c364182fa112c01b'
            '59875835b9a5128bb0054315a7f929e2071c2001e528d70bf543e1d6680e6eff')

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


prepare() {
  _msg_info "Setting up the submodules..."

  cd "${srcdir}/${_recomp_dir}"
  _walk_submodules


  #_msg_info "Patching stuff up..."
}

build() {
  export PATH="/usr/lib/llvm20/bin/:${PATH}"

  _msg_info "Building the N64Recomp & RSPRecomp tools..."

  cd "${srcdir}/${_recomp_dir}/lib/N64ModernRuntime/N64Recomp"

  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release . \
    -DCMAKE_MAKE_PROGRAM=ninja \
    -G Ninja
  cmake --build build --config Release --target N64RecompCLI
  cmake --build build --config Release --target RSPRecomp

  cp build/{N64Recomp,RSPRecomp} "${srcdir}/${_recomp_dir}"

  # ------------------------------------------------------------

  _msg_info "Building bk_rom_decompress and decompressing the ROM"

  cd "${srcdir}/${_recomp_dir}/lib/bk-decomp/tools/bk_rom_compressor"

  make -C rarezip CC=clang gzip/librarezip.a
  cargo build --release --all-features --bin bk_rom_decompress
  ./target/release/bk_rom_decompress "${srcdir}/${_baserom}" "${_rom_uncompressed}"
  cp "${_rom_uncompressed}" "${srcdir}/${_recomp_dir}"

  # ------------------------------------------------------------

  cd "${srcdir}/${_recomp_dir}"

  _msg_info "Generating recomp functions..."
  ./RSPRecomp n_aspMain.us.rev0.toml
  ./N64Recomp banjo.us.rev0.toml

  # ------------------------------------------------------------

  _msg_info "Building the game..."

  if _is_debug; then
    BUILD_TYPE=RelWithDebInfo
  else
    BUILD_TYPE=Release
  fi

  export CFLAGS="${CFLAGS/-Werror=format-security/}"
  export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"
  # Use faster mold linker
  export LDFLAGS="$LDFLAGS -fuse-ld=mold"

  # Use recommended clang compiler
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
    -DCMAKE_MAKE_PROGRAM=ninja \
    -G Ninja \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_C_COMPILER=clang \
    -DPATCHES_C_COMPILER=clang \
    -DPATCHES_LD=ld.lld

  cmake --build build $NINJAFLAGS --target "${_bin_name}"
}


package() {
  cd "${srcdir}"

  cat << SHELL > launch.sh
#!/usr/bin/env bash
cd "${PKG_PREFIX}"
exec ./${_bin_name}
SHELL

  install -Dm755 "${_recomp_dir}/build/${_bin_name}" "${pkgdir}/${PKG_PREFIX}/${_bin_name}"

  # Strip the executable whether you like it or not, except for debugging purposes...
  if ! _is_debug; then
    strip --strip-all "${pkgdir}/${PKG_PREFIX}/${_bin_name}"
  fi

  cp -r --preserve=mode "${_recomp_dir}/assets" "${pkgdir}/${PKG_PREFIX}/"
  install -Dm644 "${_recomp_dir}/recompcontrollerdb.txt" "${pkgdir}/${PKG_PREFIX}/"

  install -Dm755 launch.sh "${pkgdir}/usr/bin/${_bin_name}"
  install -Dm644 ${_pkgname}.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${_recomp_dir}/icons/app.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

  install -Dm644 "${_recomp_dir}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
