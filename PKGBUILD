# shellcheck disable=SC2148,SC2154,SC2034

# Maintainer: William Horvath <william at horvath dot blog>

# Credit to Torge Matthies (openglfreak at googlemail dot com) for the original single-make implementation in wine-tkg-git 
# https://github.com/Frogging-Family/wine-tkg-git/commit/ee366e08bf2a6608813ab77b88f8c8ec742f1ca7

#### Setup, don't touch :^)
_where="${startdir:-$(pwd)}"

_devenv=false

_generic_release=false

## real pkgrel is the eval one
pkgver=10.0.rc1.w1.s4f96088
pkgrel=1
eval pkgrel=1

################################################################################################################################
################################################################################################################################
### USER OPTIONS
################################################################################################################################
################################################################################################################################

## apply staging patches?
_use_staging=true

## if staging patches are to be applied, what (array of) patches to apply?
## if unset, apply all
_enabled_staging=()

## if all staging patches are to be applied, what (array of) patches to omit?
## e.g. "Compiler_Warnings user32-. . ."
_disabled_staging=(eventfd_synchronization wined3d-unset-flip-gdi) # added manually from proton

## main AUR version control setting, wine/staging base will be taken from this if custompatches=false (default)
_patchbase_tag="12-09-2024-4161e62e-4f96088b"

## to use this, set this to true, create a "custompatches" folder in the top-level PKGBUILD directory, and place your patches there.
## the patches from the wine-osu-patches git repo will no longer be applied, but you can copy them to the
## custompatches folder manually if you wish to use them alongside your own patches.
## also recommended to set _desired_wine_commit and _desired_staging_commit if this is used (see below)
_custompatches=false

## (with custompatches) uses wine/staging master if empty, uses given commit or tag if set
## (without custompatches) ignored and overwritten by upstream commits from patchbase repo
_desired_wine_commit=4161e62e478f61fdcd0365d9bd7b21e3b1a5197b
_desired_staging_commit=4f96088b1e12db6134dff4090797c3d61b05833d

## (with custompatches) ignore the _desired_wine_commit above and take the wine commit from the "upstream-commit" file in the staging repo
_use_staging_upstream=false

## wine/staging upstream urls
_wine_git="https://gitlab.winehq.org/wine/wine.git"
_staging_git="https://github.com/wine-staging/wine-staging.git"

## install static .a libraries (recommend using standard wine for these instead)
_install_static=false

## strips debug and all other symbols from binaries to reduce size
_strip_package=true

## for native compilation:
##   "true": system clang (/usr/bin/clang)
##   "bundled": llvm-mingw's clang (requires _use_mingw=llvm)
##   anything else: gcc
_use_clang=true

## for cross compilation
##   llvm: llvm-mingw-{ucrt,msvcrt} (msvcrt will be preferred if both exist in /opt/llvm-mingw/, but it doesn't matter)
##   msvc: clang in msvc-mode
##   anything else: regular mingw-gcc
_use_mingw=msvc

## leave empty unless you want to manually change the type of build (true: wow64)
_wow64build=

## not functional yet
_autoupdate=false

################################################################################################################################
################################################################################################################################

_wow64build=${_wow64build:-"$(cat "${_where}/buildiswow64")"}
if [ "${_custompatches}" != "true" ]; then _custompatches= ; fi
if [ "$_wow64build" = "true" ]; then _wowname="-wow64"; else _wowname=""; fi

if [ "${_generic_release}" = "true" ]; then
  PKGEXT='.pkg.tar.xz'
  COMPRESSXZ=(xz -9 -c -z - --threads=0)
  _cpu_target="-march=nocona -mtune=core-avx2" # same as Proton
else
  _cpu_target="-march=native -mtune=native"
fi

pkgname=wine-osu-spectator"${_wowname}"

pkgdesc="A compatibility layer for running Windows programs, but with osu! specific patches (doesn't conflict with other Wine installations)"
if [ "$_wow64build" = "true" ]; then pkgdesc+=" (WoW64 version)"; fi

provides=("${pkgname}")
conflicts=("${pkgname}")

install=wine"${_wowname}".install
url="http://www.winehq.com"
arch=(x86_64)
license=(LGPL)

options=('!buildflags' '!staticlibs' 'ccache' '!lto' '!debug' '!strip')

source=(
  "winestart"
  "Makefile.single"
  "lto-fixup.patch"
  "buildiswow64"
  "wine::git+${_wine_git}#commit=${_desired_wine_commit:-master}"
  "wine-staging::git+${_staging_git}#commit=${_desired_staging_commit:-master}"
)

sha512sums=(
  '2d431b8830f783b9973ef3df50606b3dae705dffe3cd6106a7daa3b5ad89eaecd6b0e7da835ebf18985a6f3c9c1c952866f39126e34fb6503935baa91a9e8189'
  '59920a54e9bd8d1f73c15675f7df29829680b59f4d1c4fc74fe710e4b596fd6a96f3b43994eb5da0fd1e50299b0ada933c6f3796e1d0698febb7870995f7f266'
  'c949136c1dca345ab4e86cb7ac6d0f02595e09a9f0c344dc9ca454cfa3aab8845a2e1f36f27e9357f3a6a3ead0d6b7f1ffb1444246cd3b76aedbe30942d20859'
  'SKIP'
  'SKIP'
  'SKIP'
)
noextract=()

## don't needlessly add the wine-osu-patches repo if we explicitly specify custom ones
if ! { [ -d "${_where}"/custompatches ] && [ "${_custompatches}" = "true" ] ; }; then
  source+=("git+https://github.com/whrvt/wine-osu-patches.git#tag=${_patchbase_tag}")
  sha512sums+=('SKIP')

  if [ "${_custompatches}" = "true" ]; then
    msg2 "WARNING: _custompatches=true but custompatches directory not found. Will be using wine-osu-patches repo."
    _custompatches=""
  fi
fi

depends=(
  fontconfig
  lcms2
  libxml2
  libxcursor
  libxrandr
  libxdamage
  libxi
  gettext
  freetype2
  glu
  libsm
  gcc-libs
  libpcap
  desktop-file-utils
  libvulkan.so=1-64
  gnutls
  libxkbcommon
  libxcomposite
  libpulse
  bash
  ffmpeg
  gst-plugins-good
  gst-libav
)

makedepends=(autoconf bison ccache perl fontforge flex gawk
  gcc
  giflib
  libpng
  libxmu
  libxxf86vm
  wayland
  libldap
  mpg123
  openal
  v4l-utils
  alsa-lib
  mesa
  mesa-libgl
  opencl-icd-loader
  libxslt
  sdl2
  gsm
  vulkan-headers
  samba
  opencl-headers
  nasm
  attr
  gtk3
  zlib
  xz
#  ntsync-header
)

optdepends=(
  libxinerama
  giflib
  libpng
  libldap
  mpg123
  openal
  v4l-utils
  alsa-plugins
  alsa-lib
  libjpeg-turbo
  libxcomposite
  libxinerama
  opencl-icd-loader
  libxslt
  vkd3d
  sdl2
  gsm
  samba
  dosbox
  libusb
)

if [ "${_wow64build}" != "true" ]; then
  depends+=(lib32-libxkbcommon libvulkan.so=1-32 lib32-gst-plugins-good lib32-gnutls lib32-libxcomposite lib32-libpulse lib32-fontconfig lib32-lcms2 lib32-libxml2 lib32-libxcursor lib32-libxrandr lib32-libxdamage lib32-libxi lib32-gettext lib32-freetype2 lib32-glu lib32-libsm lib32-gcc-libs lib32-libpcap)
  makedepends+=(lib32-ffmpeg lib32-zlib lib32-xz lib32-wayland lib32-gtk3 lib32-attr lib32-giflib lib32-libpng lib32-libxmu lib32-libxxf86vm lib32-libldap lib32-mpg123 lib32-openal lib32-v4l-utils lib32-alsa-lib lib32-mesa lib32-mesa-libgl lib32-opencl-icd-loader lib32-libxslt lib32-sdl2)
  optdepends+=(lib32-gst-libav lib32-libusb lib32-libxinerama lib32-giflib lib32-libpng lib32-libldap lib32-mpg123 lib32-openal lib32-v4l-utils lib32-alsa-plugins lib32-alsa-lib lib32-libjpeg-turbo lib32-libxcomposite lib32-libxinerama lib32-opencl-icd-loader lib32-libxslt lib32-vkd3d lib32-sdl2)
  if [ "${_use_clang}" = "true" ]; then makedepends+=(lib32-llvm-libs); fi
fi

pkgver() {
  _pkgver=$(git -C "${srcdir}"/"${pkgname}" describe --tags --abbrev=0 | cut -f2- -d'-')
  _whash=$(git -C "${srcdir}"/"${pkgname}" rev-list --count --cherry-pick wine-"${_pkgver}"...HEAD)
  _shash=${_desired_staging_commit:0:7}

  printf '%s%s%s' "${_pkgver//-/.}" ".w${_whash:?}" "$(if [ "${_apply_staging}" != "false" ]; then echo -n ".s${_shash:?}"; fi)"
}

_fake_gnuc_flag="-fgnuc-version=5.99.99"
_polly_flags="-Xclang -load -Xclang /usr/lib/LLVMPolly.so -mllvm -polly -mllvm -polly-parallel -mllvm -polly-omp-backend=LLVM -mllvm -polly-vectorizer=stripmine"
## native compiler setup
if [ "${_use_clang}" = "true" ]; then
  makedepends+=(clang llvm-libs polly)

  _cc="/usr/bin/clang" # TODO: remove /usr/bin hardcode
  _cxx="/usr/bin/clang++"

  _extra_native_flags="${_fake_gnuc_flag} -flto=full -fvirtual-function-elimination -D__LLD_LTO__ --rtlib=compiler-rt --unwindlib=libgcc"
  _extra_ld_flags="-flto=full -fvirtual-function-elimination -fuse-ld=lld"
  _lld_lto="true" # will apply _makefile_add_lto_flags() after _configure64(), and the "5000-clang-fixup-lto.patch" from the wine-osu-patches repo
  _use_polly="${_use_polly:-} native"
elif [ "${_use_clang}" = "bundled" ] && [ "${_use_mingw}" = "llvm" ]; then
  makedepends+=(polly)
  _cc="clang"
  _cxx="clang++"

  _extra_native_flags="${_fake_gnuc_flag} -flto=full -fvirtual-function-elimination -D__LLD_LTO__"
  _extra_ld_flags="-flto=full -fvirtual-function-elimination -fuse-ld=lld"
  _lld_lto="true"
  _use_polly="${_use_polly:-} native"
else
  _cc="gcc"
  _cxx="g++"

  _lto_flags="-fuse-linker-plugin -fdevirtualize-at-ltrans -flto-partition=one -flto -Wl,-flto" # requires lto-fixup.patch, should apply automatically
  _extra_native_flags="-floop-nest-optimize -floop-parallelize-all -fgraphite-identity" # graphite opts
fi

## cross-compiler setup
if [ "${_use_mingw}" = "llvm" ]; then
  makedepends+=(llvm-mingw-w64-toolchain)

  _cross64="x86_64-w64-mingw32-clang"
  _crossxx64="x86_64-w64-mingw32-clang++"
  _cross32="i686-w64-mingw32-clang"
  _crossxx32="i686-w64-mingw32-clang++"

  _mingw_bin_dir="$(command -v i686-w64-mingw32-clang)"
  if [ -n "${_mingw_bin_dir}" ]; then
    _mingw_path="$(dirname "${_mingw_bin_dir}")"
  elif [ -f "/opt/llvm-mingw/bin/clang" ]; then
    _mingw_path="/opt/llvm-mingw/bin"
  elif [ -f "/opt/llvm-mingw/llvm-mingw-msvcrt/bin/clang" ]; then
    _mingw_path="/opt/llvm-mingw/llvm-mingw-msvcrt/bin"
  else
    _mingw_path="/opt/llvm-mingw/llvm-mingw-ucrt/bin"
  fi

  if [[ "${_mingw_path}" =~ "msvcrt" ]]; then
    # set so that we don't use fallback code for __GNUC__ <= 4.2.1
    # which may be unnecessarily pessimistic
    # doesn't work with ucrt due to some specific modules failing
    _extra_common_flags="${_extra_common_flags:-} ${_fake_gnuc_flag}"
  fi

  _cross_path="${_mingw_path}":"${PATH}"
  _extra_cross_flags="${_extra_cross_flags:-} -ffunction-sections -fdata-sections -Wl,--gc-sections"
else
  # remove llvm-mingw paths from externally set PATH
  if [[ "${PATH}" =~ "llvm-mingw" ]]; then
    _mingw_path="$(dirname "$(command -v i686-w64-mingw32-clang)")"
    _cross_path="${PATH//"${_mingw_path}":/}"
  else
    _cross_path="${PATH}"
  fi

  if [ "${_use_mingw}" = "msvc" ]; then
    makedepends+=(clang llvm-libs llvm lld polly)

    _cross64="clang"
    _crossxx64="clang++"
    _cross32="clang"
    _crossxx32="clang++"

    _extra_cross_flags="${_extra_cross_flags:-} --rtlib=compiler-rt -ffunction-sections -fdata-sections"
    _use_polly="${_use_polly:-} cross"
  else
    makedepends+=(mingw-w64-binutils mingw-w64-gcc mingw-w64-crt mingw-w64-headers mingw-w64-winpthreads)

    _cross64="x86_64-w64-mingw32-gcc"
    _crossxx64="x86_64-w64-mingw32-g++"
    _cross32="i686-w64-mingw32-gcc"
    _crossxx32="i686-w64-mingw32-g++"

    _extra_cross_flags="${_extra_cross_flags:-} -floop-nest-optimize -floop-parallelize-all -fgraphite-identity" # graphite opts
  fi
fi

makedepends=("${makedepends[@]}" "${depends[@]}")
#depends+=(NTSYNC-MODULE)

## exported at the start of every function
_set_vars() {
  export build64dir="${_where}/src/${pkgname}-64-build"
  export build32dir="${_where}/src/${pkgname}-32-build"

  export PATH="${_cross_path}"

  _common_cflags="${_cpu_target} ${_extra_common_flags:-} -pipe -O3 -fomit-frame-pointer -fwrapv -fno-strict-aliasing -mfpmath=sse \
                 -Wno-error=incompatible-pointer-types -Wno-error=implicit-function-declaration -w"
                 # -Wall -Wno-unknown-attributes -Wno-unused-but-set-variable -Wno-unused-variable -Wunaligned-access"
  _native_common_cflags="${_lto_flags:-} ${_extra_native_flags:-} -ffunction-sections -fdata-sections" # only for the non-mingw side

  export CPPFLAGS="-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=0 -DNDEBUG -D_NDEBUG"
  _GCC_FLAGS="${_common_cflags} ${_native_common_cflags} ${CPPFLAGS}"
  _CROSS_FLAGS="${_common_cflags} ${CPPFLAGS} ${_extra_cross_flags}"

  if [[ "${_use_polly}" =~ native ]]; then
    _GCC_FLAGS+=" ${_polly_flags}"
  fi

  if [[ "${_use_polly}" =~ cross ]]; then
    _CROSS_FLAGS+=" ${_polly_flags}"
  fi

  _LD_FLAGS="${_GCC_FLAGS} ${_extra_ld_flags:-} -Wl,-O2,--sort-common,--as-needed,--gc-sections"
  _CROSS_LD_FLAGS="${_common_cflags} ${CPPFLAGS}"

  if [ "${_use_mingw}" = "msvc" ]; then
    _CROSS_LD_FLAGS+=" -Wl,/FILEALIGN:4096,/OPT:REF,/OPT:ICF"
  else
    _CROSS_LD_FLAGS+=" -Wl,-O2,--sort-common,--as-needed,--file-alignment=4096"
  fi

  export CC="ccache ${_cc}"
  export CXX="ccache ${_cxx}"

  export x86_64_CC="ccache ${_cross64}"
  export x86_64_CXX="ccache ${_crossxx64}"
  export x86_64_CFLAGS="${_CROSS_FLAGS} ${_common_64_cflags:-}"

  export i386_CC="ccache ${_cross32}"
  export i386_CXX="ccache ${_crossxx32}"
  export i386_CFLAGS="${_CROSS_FLAGS} ${_common_32_cflags:-}"

  export CFLAGS="${_GCC_FLAGS} -std=gnu17"
  export CXXFLAGS="${_GCC_FLAGS//${_fake_gnuc_flag}/} -std=gnu++17" # Beautiful
  export CROSSCFLAGS="${_CROSS_FLAGS} -std=gnu17"
  export CROSSCXXFLAGS="${_CROSS_FLAGS//${_fake_gnuc_flag}/} -std=gnu++17"

  export LDFLAGS="${_LD_FLAGS}"
  export CROSSLDFLAGS="${_CROSS_LD_FLAGS}"
}

_set_vars64() {
  _common_64_cflags=""
  _common_32_cflags=""
  _set_vars

  if [ -f "/usr/lib/libunwind.a" ] && [ -f "/usr/lib/libz.a" ] && [ -f "/usr/lib/liblzma.a" ]; then
    export UNWIND_CFLAGS=""
    export UNWIND_LIBS="-static-libgcc -l:libunwind.a -l:liblzma.a -l:libz.a"
  fi

  export CROSSCC="${x86_64_CC}"
}

_set_vars32() {
  ## lib32 fsync doesn't compile with clang due to undefined atomic ops otherwise (ntdll.so)
  # if [ "${_use_clang}" = "true" ] || [ "${_use_clang}" = "bundled" ]; then
  #   export I386_LIBS="-latomic"
  # fi

  _common_64_cflags=""
  _common_32_cflags=""
  _set_vars

  export CROSSCC="${i386_CC}"
}

## ccache configuration (taken from https://raw.githubusercontent.com/openglfreak/wine-tkg-userpatches/next/config/ccache.cfg)
_prep_ccache() {
  _compilerhash="$(md5sum "$(command -v "${_cc}")" | cut -d ' ' -f 1),$(md5sum "$(command -v "${_cross64}")" | cut -d ' ' -f 1),$(md5sum "$(command -v "${_cross32}")" | cut -d ' ' -f 1)"
  export _compilerhash

  export CCACHE_DIR="${XDG_CACHE_HOME:-${HOME}/.cache}/ccache/wine"
  mkdir -p "${CCACHE_DIR}"
  export CCACHE_COMPILERCHECK="string:${_compilerhash}" \
         CCACHE_BASEDIR="${srcdir}"
  ccache --set-config=compression=true \
         --set-config=compression_level=1 \
         --set-config=sloppiness=file_macro,time_macros \
         --set-config=hash_dir=false \
         --set-config=inode_cache=true \
         --set-config=temporary_dir="${CCACHE_DIR}/tmp"
}

prepare() { _set_vars;
  if [ "${_where}/src" != "${srcdir}" ]; then _failure "Something weird is going on with your PKGBUILD's path, exiting early to avoid tampering with your files."; fi
  cd "${_where}" || _failure

  ## Removes pkg dir if already existing
  rm -rf "${_where}"/pkg || true

  ## Rename our working copy of the wine source
  mv "${srcdir}"/wine "${srcdir}"/"${pkgname}" || _failure

  ## Source base re-configuration
  _desired_wine_commit=${_desired_wine_commit:-master}
  _desired_staging_commit=${_desired_staging_commit:-master}

  if [ "${_custompatches}" != "true" ]; then
    _patchdir="${srcdir}/wine-osu-patches"

    _patchbase_wine_commit=$(cat "${srcdir}"/wine-osu-patches/wine-commit)
    _patchbase_staging_commit=$(cat "${srcdir}"/wine-osu-patches/staging-commit)
    if [ -f "${srcdir}"/wine-osu-patches/staging-exclude ]; then
      IFS=" " read -r -a _disabled_staging <<< "$(sed -E "s/-W\ //g" "${srcdir}"/wine-osu-patches/staging-exclude)"
    fi
    if [ "${_autoupdate}" != "true" ]; then
      _desired_wine_commit=$_patchbase_wine_commit
      _desired_staging_commit=$_patchbase_staging_commit
    fi
  else
    msg "Using custom patches"
    _patchdir="${_where}/custompatches"
  fi

  ## Staging setup

  if [ "${_autoupdate}" != "true" ]; then
    cd "${srcdir}"/wine-staging || _failure
    git reset --hard "${_desired_staging_commit}" || _failure

    if [ "${_custompatches}" = "true" ]; then
      _patchbase_staging_commit=$(git rev-parse HEAD)
      _desired_staging_commit=$_patchbase_staging_commit

      if [ "${_use_staging}" = "true" ] && [ "${_use_staging_upstream}" = "true" ]; then
        _patchbase_wine_commit="$(cat "${srcdir}"/wine-staging/staging/upstream-commit)"
        _desired_wine_commit=$_patchbase_wine_commit
      fi
    fi

    sed -i "s/^_desired_staging_commit=.*$/_desired_staging_commit=${_desired_staging_commit}/g" "${_where}/PKGBUILD"
  fi

  msg2 "Wine staging at: $_patchbase_staging_commit"

  ## Mainline setup

  if [ "${_autoupdate}" != "true" ]; then
    cd "${srcdir}"/"${pkgname}" || _failure
    git reset --hard "${_desired_wine_commit}" || _failure

    if [ "${_custompatches}" = "true" ]; then
      _patchbase_wine_commit=$(git rev-parse HEAD)
      _desired_wine_commit=$_patchbase_wine_commit
    fi

    sed -i "s/^_desired_wine_commit=.*$/_desired_wine_commit=${_desired_wine_commit}/g" "${_where}/PKGBUILD"
  fi

  msg2 "Wine mainline at: $_patchbase_wine_commit"

  cd "${srcdir}" || _failure

  ## Add current config to custompatches dir

  if [ "${_custompatches}" = "true" ]; then
    echo -n "${_desired_wine_commit}" > "${_patchdir}/wine-commit"
    echo -n "${_desired_staging_commit}" > "${_patchdir}/staging-commit"
    echo -n "${_disabled_staging[@]/#/-W }" > "${_patchdir}/staging-exclude"
  fi

  ## Patching setup

  touch "${_where}"/patchlog.txt || _failure
  printf "Wine commit: %s\nStaging commit: %s\n" "${_patchbase_wine_commit}" "${_patchbase_staging_commit}" > "${_where}"/patchlog.txt

  if [ -f "${srcdir}"/wine-staging/patches/patchinstall.sh ]; then
    staging_patcher="${srcdir}"/wine-staging/patches/patchinstall.sh
  else
    staging_patcher="${srcdir}"/wine-staging/staging/patchinstall.py
  fi

  _enabled_staging=("${_enabled_staging[@]:-"--all"}")

  if [ "${_use_staging}" != "false" ]; then
    msg2 "Applying staging patches"
    printf "\nApplying staging patches\n\n" >> "${_where}"/patchlog.txt

    if [ "${_use_staging_upstream}" != "true" ] && find "${_patchdir}"/staging-overrides -name "*spatch" -print0 -quit | grep . >/dev/null; then
      for override in "${_patchdir}"/staging-overrides/*; do
        base=$(basename "${override}")
        dest=$(find "${srcdir}"/wine-staging/patches/ -name "${base%.spatch}*")
        cp "${override}" "${dest}"
      done

      msg2 "Overrode all staging patches matching those in staging-overrides/*.spatch"
      printf "\nOverrode all staging patches matching those in staging-overrides/*.spatch\n\n" >> "${_where}"/patchlog.txt
    fi

    # shellcheck disable=SC2048,SC2086
    "${staging_patcher[@]}" DESTDIR="${srcdir}"/"${pkgname}" --no-autoconf "${_enabled_staging[@]}" ${_disabled_staging[*]/#/-W } &>> "${_where}"/patchlog.txt || \
        _failure "Error applying staging patches, check patchlog.txt for info."
  fi

  ## Apply other patches

  printf "\nApplying other patches\n\n" >> "${_where}"/patchlog.txt
  cd "${srcdir}"/"${pkgname}" || _failure

  patchlist=()

  if [ "${_use_clang}" != "true" ] && [ "${_use_clang}" != "bundled" ]; then patchlist+=("${srcdir}"/lto-fixup.patch); fi

  mapfile -t patchlist_tmp < <(find "${_patchdir}" -type f -regex ".*\.patch" | LC_ALL=C sort -f)

  patchlist+=("${patchlist_tmp[@]}")

  for patch in "${patchlist[@]}"; do
    shortname="${patch#"${_where}/"}"
    printf "\nApplying %s\n\n" "${shortname}" >> "${_where}"/patchlog.txt
    msg2 "Applying '${shortname}'"
    git apply --ignore-whitespace --verbose "${patch}" &>> "${_where}"/patchlog.txt || \
    patch -Np1 <"${patch}" &>> "${_where}"/patchlog.txt || \
        _failure "An error occurred applying ${shortname}, check patchlog.txt for info."
  done

  sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i "${srcdir}/${pkgname}"/configure*

  if [ "${_strip_package}" = "true" ]; then
    awk -i inplace '/STRIPPROG=/ { sub(/ %s/, " %s -s") }1' "${srcdir}/${pkgname}/tools/makedep.c"
    sed -i 's|stripcmd=$stripprog|stripcmd="$stripprog -s"|g' "${srcdir}/${pkgname}/tools/install-sh"
  fi

  ## clean up .orig files if patches succeeded
  find "${srcdir}"/"${pkgname}" -iregex ".*orig" -execdir rm {} \;

  # ./dlls/winevulkan/make_vulkan # don't really need dx12 support for this package...

  tools/make_requests
  if [ -e tools/make_specfiles ]; then
    tools/make_specfiles
  fi

  ## make tools/make_makefiles happy
  git config commit.gpgsign false &>/dev/null || true
  git config user.email "wine@build.dev" &>/dev/null || true
  git config user.name "winebuild" &>/dev/null || true
  git add --all &>/dev/null || true
  git commit --allow-empty -m "makepkg" &>/dev/null || true

  tools/make_makefiles

  _prep_ccache
  autoreconf -fi
}

_configure64() { _set_vars64;
  cd "${build64dir}" || _failure

  msg2 "Configuring Wine-64"
  ../"${pkgname}"/configure \
    "${_sharedopts[@]}" \
    "${_wine64opts[@]}" || _failure "Wine-64 configure failed; check ${build64dir#"${_where}/"}/config.log for more information"

  if [ -n "${_lld_lto}" ]; then
    msg2 "Hotfixing Wine-64 Makefile for LLD LTO..."
    _makefile_add_lto_flags Makefile || _failure "Couldn't apply Makefile hotfix."
  fi
}

_configure32() { _set_vars32;
  cd "${build32dir}" || _failure

  msg2 "Configuring Wine-32"
  ../"${pkgname}"/configure \
    "${_sharedopts[@]}" \
    "${_wine32opts[@]}" || _failure "Wine-32 configure failed; check ${build32dir#"${_where}/"}/config.log for more information"
}

## Used for single-make build
_tools64() { _set_vars64;
  cd "${build64dir}" || _failure

  msg2 "Building Wine-64 tools"

  if [ -n "${_lld_lto}" ]; then
    _noltoflags="-fno-lto -fno-virtual-function-elimination -O1"
  else
    _noltoflags="-fno-lto -O1"
  fi
  shopt -s globstar
  # don't use lto to speed up tools compilation
  for mkfile in tools/Makefile tools/**/Makefile; do
    "$@" -C "${mkfile%/Makefile}" CFLAGS="${CFLAGS} ${_noltoflags}" LDFLAGS="${LDFLAGS} ${_noltoflags}" CROSSCFLAGS="${CROSSCFLAGS} ${_noltoflags}" CROSSLDFLAGS="${CROSSLDFLAGS} ${_noltoflags}"
  done
  chmod -R +x "${build64dir}"/tools
  shopt -u globstar
}

_build64() { _set_vars64;
  cd "${build64dir}" || _failure

  msg2 "Building Wine-64"

  make -j$(($(nproc) + 1)) || _failure "Compilation failed"
}

_build32() { _set_vars32;
  cd "${build32dir}" || _failure

  msg2 "Building Wine-32"

  make -j$(($(nproc) + 1)) || _failure "Compilation failed"
}

build() { _set_vars;
  if [ "${_devenv}" = "true" ]; then
    _confcachedir="${_where}"/.confcaches
    _compilerwithflagshash="$(sha512sum - < <(printf '%s' "${CFLAGS}${LDFLAGS}${CROSSCFLAGS}${CROSSLDFLAGS}${_compilerhash}") | cut -d ' ' -f 1)"
    _confcacheprefix="${_confcachedir}"/"${pkgver%.w*}-${pkgrel}-${_compilerwithflagshash}"

    if [ ! -d "${_confcachedir}" ]; then
      mkdir "${_confcachedir}" || \
          _failure "Couldn't create an autoconf cache directory in ${_confcachedir#"${_where}/"}. This shouldn't have happened."
    fi
    ln -s "${HOME}/.config/edwkspc/wine/".* "${srcdir}"/"${pkgname}"/ || true
  fi

  _sharedopts=(
    --prefix=/opt/"${pkgname}"
    --disable-tests
    --disable-winemenubuilder
    --disable-win16
    --with-x
    --with-gstreamer
    --with-ffmpeg
    --with-wayland
    --silent
    --enable-silent-rules
    --without-oss
    --without-coreaudio
    --without-cups
    --without-sane
    --without-gphoto
    --without-pcsclite
    --without-pcap
    --without-capi
    --without-v4l2
    --without-netapi
  )

  _wine64opts=(
    --libdir=/opt/"${pkgname}"/lib64
    --with-mingw="${x86_64_CC}"
  )
  _wine32opts=()

  if [ "${_wow64build}" = "true" ]; then
    _wine64opts+=(--enable-archs="x86_64,i386")
  else
    _wine64opts+=(--enable-win64)

    _wine32opts+=(
      --libdir=/opt/"${pkgname}"/lib
      --with-wine64="${build64dir}"
      --with-mingw="${i386_CC}" 
    )
  fi

  if [ "${_devenv}" = "true" ]; then
    _sharedopts+=(--config-cache)
    _wine64opts+=(--cache-file="${_confcacheprefix}"-64.cache)
    _wine32opts+=(--cache-file="${_confcacheprefix}"-32.cache)
  fi

  local _old_SOURCE_DATE_EPOCH="$SOURCE_DATE_EPOCH"
  export SOURCE_DATE_EPOCH=0

  rm -rf "${build64dir}" || true
  mkdir "${build64dir}" || true

  ## don't build lib32 for wow64 builds
  if [ "${_wow64build}" = "true" ]; then
    _configure64
    _build64
  else
    _TMP_VARFILE="$(mktemp)" && export _TMP_VARFILE
    trap 'rm -f -- "$_TMP_VARFILE"' EXIT
    { ( unset MAKEFLAGS; unset MFLAGS; set ); echo; set +o; } >"$_TMP_VARFILE"

    rm -rf "${build32dir}" || true
    mkdir "${build32dir}" || true
    make -f "${_where}"/Makefile.single -j$(($(nproc) + 1))
  fi

  export SOURCE_DATE_EPOCH="$_old_SOURCE_DATE_EPOCH"
}

package() { _set_vars;
  if [ "${_install_static}" = "true" ]; then
    _installtype="install"
  else
    _installtype="install-lib"
  fi

  if [ "${_wow64build}" != "true" ]; then
    _set_vars32
    msg2 "Packaging Wine-32"
    cd "${build32dir}" || _failure
    make -j$(($(nproc) + 1)) \
      prefix="${pkgdir}"/opt/"${pkgname}" \
      libdir="${pkgdir}"/opt/"${pkgname}"/lib \
      dlldir="${pkgdir}"/opt/"${pkgname}"/lib/wine $_installtype || _failure "Wine-32 installation failed"
  fi

  _set_vars64
  msg2 "Packaging Wine-64"
  cd "${build64dir}"|| _failure
  make -j$(($(nproc) + 1)) \
    prefix="${pkgdir}"/opt/"${pkgname}" \
    libdir="${pkgdir}"/opt/"${pkgname}"/lib64 \
    dlldir="${pkgdir}"/opt/"${pkgname}"/lib64/wine $_installtype || _failure "Wine-64 installation failed"

  if [ "${_install_static}" != "true" ] && [ "${_strip_package}" = "true" ]; then # stripping with static libs is broken for some reason?
    msg "Stripping symbols from libraries..."

    find "${pkgdir}"/opt/"${pkgname}"/lib{,64} \
      -type f '(' -iname '*.a' -or -iname '*.dll' -or -iname '*.so' -or -iname '*.sys' -or -iname '*.drv' -or -iname '*.exe' ')' \
      -print0 \
      | xargs -0 strip -s &>/dev/null || true
  fi

  if [ "${_wow64build}" = "true" ]; then
    ln -srf "${pkgdir}"/opt/"${pkgname}"/bin/wine{,64}
  fi

  cp "${srcdir}"/winestart "${pkgdir}"/opt/"${pkgname}"/bin/wine-osu"${_wowname}"

  ## Force our wine to use its own libraries
  install -d "${pkgdir}"/usr/bin
  ln -sf /opt/"${pkgname}"/bin/wine-osu"${_wowname}" "${pkgdir}"/usr/bin/wine-osu"${_wowname}"
  chmod +x "${pkgdir}"/opt/"${pkgname}"/bin/wine-osu"${_wowname}"

  ## Clean patchlog dirnames and add to package
  sed -i "s|${_where}\/||g" "${_where}"/patchlog.txt

  cp "${_where}"/patchlog.txt "${pkgdir}"/opt/"${pkgname}"
}

################################################################################################################################
################################################################################################################################
## more random helpers

_makefile_add_lto_flags() {
    local makefile="$1"

    awk '
    BEGIN {
        modifications = 0
    }
    {
        lines[NR] = $0
    }
    END {
        for (i = 1; i <= NR; i++) {
            # Match either wine(64)-preloader target or preloader.o target only if followed by .c file
            if (lines[i] ~ /^loader\/wine64-preloader:/ || 
                lines[i] ~ /^loader\/wine-preloader:/ || 
                (lines[i] ~ /^loader\/preloader[.:]/ && lines[i] ~ /[.]c$/)) {
                in_target = 1
                print lines[i]
                continue
            }
            if (in_target) {
                if (lines[i] ~ /^\t/ || (lines[i] ~ /^[[:space:]]/ && prev_line_ended_backslash)) {
                    is_last_line = (i == NR || lines[i+1] ~ /^[^[:space:]].*:/)
                    has_backslash = (lines[i] ~ /\\[[:space:]]*$/)
                    
                    if (is_last_line && !has_backslash) {
                        print lines[i] " -fno-lto -fno-virtual-function-elimination -Wl,--no-relax"
                        modifications++
                        in_target = 0
                    } else {
                        print lines[i]
                        prev_line_ended_backslash = has_backslash
                    }
                    continue
                }
            }
            prev_line_ended_backslash = (lines[i] ~ /\\[[:space:]]*$/)
            in_target = 0
            print lines[i]
        }
        if (modifications != 2) {
            printf "Error: Expected exactly 2 modifications, but made %d\n", modifications > "/dev/stderr"
            exit 1
        }
    }' "$makefile" > "$makefile.new"
    
    if [ $? -eq 0 ]; then
        mv "$makefile.new" "$makefile"
        return 0
    else
        rm -f "$makefile.new"
        return 1
    fi
}

_failure() {
  if [ -n "$*" ]; then msg "$*"; fi
  error "Exiting."
  exit 1
}
