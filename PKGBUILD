# shellcheck disable=SC2148,SC2154,SC2034

# Maintainer: William Horvath <william at horvath dot blog>

# Credit to Torge Matthies (openglfreak at googlemail dot com) for the original single-make implementation in wine-tkg-git
# https://github.com/Frogging-Family/wine-tkg-git/commit/ee366e08bf2a6608813ab77b88f8c8ec742f1ca7

#### Setup, don't touch :^)
_where="${startdir:-$(pwd)}"

_devenv=false
_debug=false

_generic_release=false

## real pkgrel is the eval one
pkgver=10.14.w268.s317665e
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
_disabled_staging=(oleaut32_VarAdd winedevice-Default_Drivers dsound-EAX ntdll-Junction_Points mountmgr-DosDevices ntdll-NtDevicePath ws2_32-af_unix) #  eventfd_synchronization
                   # esync added manually from proton, the rest are known to cause performance issues with path/directory traversal
                   # dsound-EAX causes crashing in osu! with compat. mode enabled

## main AUR version control setting, wine/staging base will be taken from this if custompatches=false (default)
_patchbase_tag="09-12-2025-e3c9d3ac-317665ee"

## to use this, set this to true, create a "custompatches" folder in the top-level PKGBUILD directory, and place your patches there.
## the patches from the wine-osu-patches git repo will no longer be applied, but you can copy them to the
## custompatches folder manually if you wish to use them alongside your own patches.
## also recommended to set _desired_wine_commit and _desired_staging_commit if this is used (see below)
_custompatches=false

## (custompatches=true) uses wine/staging master if empty, uses given commit or tag if set
##                     (if you want to update them to current master, just set them empty)
## (custompatches=false) ignored and overwritten by upstream commits from patchbase repo
_desired_wine_commit=e3c9d3ac76b223073253667e2447e1cbc407ac97
_desired_staging_commit=317665ee20ac811ae6f48a7c16d86502db764869

## (custompatches=true) ignore the _desired_wine_commit above and take the wine commit from the "upstream-commit" file in the staging repo
_use_staging_upstream=false

## wine/staging upstream urls
_wine_git="https://gitlab.winehq.org/wine/wine.git"
_staging_git="https://github.com/wine-staging/wine-staging.git"

## install static .a libraries (recommend using standard wine for these instead)
_install_static=false

## strips debug and all other symbols from binaries to reduce size
_strip_package=true

## use link-time optimizations for native compilation?
##   "true" or "thin": thin LTO (faster compilation/link time)
##   "full": full LTO (slower compilation, marginally more optimal than thin LTO)
##   anything else: no LTO
_use_lto=full

## for native compilation:
##   "true": system clang (/usr/bin/clang)
##   "bundled": llvm-mingw's clang (requires _use_mingw=llvm or _use_mingw=bundled-msvc)
##   anything else: gcc
_use_clang=false

## for cross compilation
##   "llvm": llvm-mingw (msvcrt will be preferred if both exist in /opt/llvm-mingw/, but it doesn't matter)
##   "msvc": clang in msvc-mode
##   "bundled-msvc": compile in msvc mode without mingw, but using llvm-mingw's binaries
##   "nomingw": compile without mingw (.dll.so)
##   anything else: regular mingw-gcc
_use_mingw=gcc

## leave empty unless you want to manually change the type of build (true: wow64)
_wow64build=

## if using llvm-mingw, the path to the root directory containing the installation
##   if it's empty (default), then try in order:
##      1. dirname "$(command -v i686-w64-mingw32-clang)"
##      2. /opt/llvm-mingw
##      3. /opt/llvm-mingw/llvm-mingw-msvcrt
##      4. /opt/llvm-mingw/llvm-mingw-ucrt
_llvm_mingw_prefdir=

################################################################################################################################
################################################################################################################################

_wow64build=${_wow64build:-"$(cat "${_where}/buildiswow64")"}
if [ "$_wow64build" = "true" ]; then _wowname="-wow64"; else _wowname=""; fi

pkgname=wine-osu-spectator"${_wowname}"

pkgdesc="A compatibility layer for running Windows programs, but with osu! specific patches (doesn't conflict with other Wine installations)"
if [ "$_wow64build" = "true" ]; then pkgdesc+=" (WoW64 version)"; fi

install=wine"${_wowname}".install
url="http://www.winehq.com"
arch=(x86_64)
license=(LGPL)

options=('!staticlibs' '!lto')
if [ "${_debug}" != "true" ]; then options+=('!buildflags' '!debug')
                              else options+=('debug' '!strip'); _strip_package=false; fi
if [ "${_strip_package}" != "true" ]; then options+=('!strip'); fi

if [ "${_generic_release}" = "true" ]; then
  COMPRESSZST=(zstd --threads=0 --auto-threads=logical --sparse -c -z -q --ultra -22 -)
  _cpu_target="-march=nocona -mtune=core-avx2" # same as Proton
else
  _cpu_target="-march=native -mtune=native"
fi

if [ -z "${MAKEFLAGS}" ]; then
  _mjobsflag="-j$(($(nproc) + 1))"
else
  _mjobsflag="${MAKEFLAGS#-j* }"
fi

if [ "${_custompatches}" != "true" ]; then _custompatches=''; fi

source=(
  "winestart.c"
  "Makefile.single"
  "makedep-fix.patch"
  "buildiswow64"
  "wine::git+${_wine_git}#commit=${_desired_wine_commit:-master}"
)

sha512sums=(
  '05e6d1148841b7844155e9992ad16fe8cfe924db4092a9aeb707d47551c63df5b6ba3a8036f8b70d1320b07ca11458a8bf614baf9f82542c96e7b72c48de6a8f'
  '59920a54e9bd8d1f73c15675f7df29829680b59f4d1c4fc74fe710e4b596fd6a96f3b43994eb5da0fd1e50299b0ada933c6f3796e1d0698febb7870995f7f266'
  '3ce23732b9c433a9b295e366fc397ad8ff21624fbde635facfdd9435fd3132f51a7adf30d2a7b097d5509f8e333a144bcea550b9c6c479b9129d1405b90e8431'
  'SKIP'
  'SKIP'
)

if   [[ "${_use_lto}" =~ (true|full) ]]; then _lto_type="full" && _use_lto="true"
elif  [ "${_use_lto}" = "thin" ];        then _lto_type="thin" && _use_lto="true"; fi

if [ "${_use_mingw}" = "nomingw" ]; then
  ## these won't work in a non-mingw build
  _use_lto="false"
  _use_clang="false"
elif [ "${_use_lto}" = "true" ]; then
  ## don't needlessly add the lto fixup if we don't want lto
  source+=("lto-fixup.patch")
  sha512sums+=('7d02ef59e9223e1d64e0f27532d2df947b6a9029a0859be9b02fca0daa543cce400af827cd0272f3fac3a3c9bc606c34f0521cd21bd45c1d523b8d9747709df7')
fi

## don't needlessly add the wine-osu-patches repo if we explicitly specify custom ones
if ! { [ -d "${_where}"/custompatches ] && [ "${_custompatches}" = "true" ] ; }; then
  source+=("git+https://github.com/whrvt/wine-osu-patches.git#tag=${_patchbase_tag}")
  sha512sums+=('SKIP')
  if [ "${_custompatches}" = "true" ]; then
    msg2 "WARNING: _custompatches=true but custompatches directory not found. Will be using wine-osu-patches repo."
    _custompatches=""
  fi
fi
## don't needlessly add the staging repo if we don't want staging
if [ "${_use_staging}" = "true" ]; then
  source+=("wine-staging::git+${_staging_git}#commit=${_desired_staging_commit:-master}")
  sha512sums+=('SKIP')
fi
noextract=()

depends=(
  libpcap             fontconfig
  desktop-file-utils  lcms2
  libvulkan.so=1-64   libxml2
  gnutls              libxcursor
  libxkbcommon        libxrandr
  libxcomposite       libxdamage
  libpulse            libxi
  bash                gettext
  ffmpeg              freetype2
  gst-plugins-good    glu
  gst-libav           libsm
  gcc-libs            libunwind
)

makedepends=(autoconf bison ccache perl fontforge flex gawk
#  python # for make_vulkan
  gcc         
  giflib      libxslt
  libpng      sdl2
  libxmu      gsm
  libxxf86vm  vulkan-headers
  wayland     samba
  libldap     opencl-headers
  mpg123      nasm
  openal      attr
  v4l-utils   gtk3
  alsa-lib    zlib
  mesa        xz
  mesa-libgl
)

optdepends=(
  libxinerama     libxcomposite
  giflib
  libpng          libxslt
  mpg123          sdl2
  alsa-plugins    samba
  alsa-lib        dosbox
  'NTSYNC-MODULE: ntsync support (in-kernel, MUST have full ntsyncv7)'
  'ntsync-dkms>=6.12.6: ntsync support (dkms module, recommended until 6.14 release)'
)

if [ "${_wow64build}" != "true" ]; then
  depends+=(lib32-libxkbcommon libvulkan.so=1-32 lib32-gst-plugins-good lib32-gnutls lib32-libxcomposite lib32-libpulse lib32-fontconfig lib32-lcms2 lib32-libxml2 lib32-libxcursor lib32-libxrandr lib32-libxdamage lib32-libxi lib32-gettext lib32-freetype2 lib32-glu lib32-libsm lib32-gcc-libs lib32-libpcap)
  makedepends+=(lib32-ffmpeg-minimal-dev lib32-zlib lib32-xz lib32-wayland lib32-gtk3 lib32-attr lib32-giflib lib32-libpng lib32-libxmu lib32-libxxf86vm lib32-libldap lib32-mpg123 lib32-openal lib32-alsa-lib lib32-mesa lib32-mesa-libgl lib32-libxslt lib32-sdl2)
  optdepends+=(lib32-ffmpeg lib32-gst-libav lib32-libusb lib32-libxinerama lib32-giflib lib32-libpng lib32-libldap lib32-mpg123 lib32-openal lib32-alsa-plugins lib32-alsa-lib lib32-libjpeg-turbo lib32-libxcomposite lib32-libxinerama lib32-libxslt lib32-vkd3d lib32-sdl2)
  if [ "${_use_clang}" = "true" ]; then makedepends+=(lib32-clang lib32-llvm-libs); fi
fi
makedepends=("${makedepends[@]}" "${depends[@]}")

pkgver() {
  _pkgver=$(git -C "${srcdir}"/wine describe --tags --abbrev=0 | cut -f2- -d'-')
  _whash=$(git -C "${srcdir}"/wine rev-list --count --cherry-pick wine-"${_pkgver}"..."${_desired_wine_commit}")
  _shash=${_desired_staging_commit:0:7}

  printf '%s%s%s' "${_pkgver//-/.}" ".w${_whash:?}" "$(if [ "${_use_staging}" = "true" ]; then echo -n ".s${_shash:?}"; fi)"
}

build64dir="${_where}/src/wine-64-build"
build32dir="${_where}/src/wine-32-build"

# DISCLAIMER: I KNOW THIS IS REALLY BAD, WIP REFACTORING
_set_vars() {
  if [ -z "${_cc}" ]; then # try to avoid redundant work
    _fake_gnuc_flag="-fgnuc-version=5.99.99"
    [[ "$(dirname "$(command -v clang)")" =~ ^(/usr|/bin|/sbin).* ]] && \
      _polly_flags="-fplugin=/usr/lib/LLVMPolly.so -mllvm=-polly -mllvm=-polly-parallel -mllvm=-polly-omp-backend=LLVM -mllvm=-polly-vectorizer=stripmine"
    _ccache="$(command -v ccache)"
    _stripprog="$(command -v strip)"

    ## paths setup
    if { [ -n "${_llvm_mingw_prefdir:-}" ] && [ -d "${_llvm_mingw_prefdir}" ] && [ -x "${_llvm_mingw_prefdir}/bin/i686-w64-mingw32-clang" ]; }; then
      _llvm_mingw_path="${_llvm_mingw_prefdir}/bin"
    else
      _llvm_mingw_path="$(dirname "$(command -v i686-w64-mingw32-clang)")"
    fi

    if [[ "${_use_mingw}" =~ (llvm|bundled*) ]]; then
      makedepends+=(llvm-mingw-w64-toolchain)
      if [ "${_llvm_mingw_path}" = "." ]; then
        if [ -f "/opt/llvm-mingw/bin/clang" ]; then
          _llvm_mingw_path="/opt/llvm-mingw/bin"
        elif [ -f "/opt/llvm-mingw/llvm-mingw-msvcrt/bin/clang" ]; then
          _llvm_mingw_path="/opt/llvm-mingw/llvm-mingw-msvcrt/bin"
        else
          _llvm_mingw_path="/opt/llvm-mingw/llvm-mingw-ucrt/bin"
        fi
      fi
      if [ -x "${_llvm_mingw_path}/i686-w64-mingw32-clang" ]; then
        _cross_path="${_llvm_mingw_path}:${PATH}"
      else
        _failure "You need to install: llvm-mingw-w64-toolchain ."
      fi
    elif [ "${_use_mingw}" = "msvc" ]; then
      makedepends+=(clang llvm llvm-libs)
      _msvc_path="$(dirname "$(PATH="${PATH//"${_llvm_mingw_path}":/}" command -v clang)")"
      if [ "${_msvc_path}" != "." ]; then
        _cross_path="${_msvc_path}:${PATH}"
      else
        _failure "You need to install: clang llvm llvm-libs lib32-clang lib32-llvm-libs ."
      fi
    else
      makedepends+=(mingw-w64-binutils mingw-w64-gcc mingw-w64-crt mingw-w64-headers mingw-w64-winpthreads)
      _mingw_gcc_path="$(dirname "$(command -v x86_64-w64-mingw32-gcc-ar)")"
      if [ "${_mingw_gcc_path}" != "." ]; then
        _cross_path="${_mingw_gcc_path}:${PATH}"
      else
        _failure "You need to install: mingw-w64-binutils mingw-w64-gcc mingw-w64-crt mingw-w64-headers mingw-w64-winpthreads ."
      fi
    fi

    if [ "${_use_clang}" = "bundled" ]; then
      _native_path="${_llvm_mingw_path}:${PATH}"
    elif [ "${_llvm_mingw_path}" != "." ]; then
      _native_path="${PATH//"${_llvm_mingw_path}":/}"
    else
      _native_path="${PATH}"
    fi

    ## native compiler setup
    export PATH="${_native_path:-"${PATH}"}"
    if ! [[ "${_use_clang}" =~ (bundled|true) ]]; then
      _cc="$(command -v gcc)"
      _cxx="$(command -v g++)"

      _extra_native_flags+=" -static-libgcc -floop-nest-optimize -fgraphite-identity -mtls-dialect=gnu2" # graphite opts + gcc opts
      if [ "${_use_lto}" = "true" ]; then # requires lto-fixup.patch
        makedepends+=(lld) # bfd is so slow

        _lto_flags+=" -fuse-ld=lld -ffat-lto-objects -fuse-linker-plugin -fdevirtualize-at-ltrans -flto-partition=one -flto"
        _extra_ld_flags+=" -static-libgcc -fuse-ld=lld -ffat-lto-objects -fuse-linker-plugin -fdevirtualize-at-ltrans -flto-partition=one -flto"
        export wine_preloader_LDFLAGS="-fuse-ld=bfd"
        export wine64_preloader_LDFLAGS="-fuse-ld=bfd"
        export preloader_CFLAGS="-fuse-ld=bfd"
      fi
    else
      _cc="$(command -v clang)"
      _cxx="$(command -v clang++)"

      if [ "${_use_clang}" = "true" ]; then
        makedepends+=(polly lld)
        _extra_native_flags+=" ${_polly_flags:-} -rtlib=compiler-rt -unwindlib=libgcc -static-libgcc"
        _extra_ld_flags+=" -rtlib=compiler-rt -unwindlib=libgcc -static-libgcc"
      else
        _extra_native_flags+=" -static-libgcc"
        _extra_ld_flags+=" -static-libgcc"
      fi

      if [ "${_use_lto}" = "true" ]; then # requires lto-fixup.patch
        _extra_ld_flags+=" -flto=${_lto_type} -fuse-ld=lld"
        _lto_flags+=" -flto=${_lto_type} -Wl,--lto-whole-program-visibility -D__LLD_LTO__"
        export wine_preloader_LDFLAGS="-fno-lto -fuse-ld=lld -Wl,--no-relax"
        export wine64_preloader_LDFLAGS="-fno-lto -fuse-ld=lld -Wl,--no-relax"
        export preloader_CFLAGS="-fno-lto -fuse-ld=lld -Wl,--no-relax"
      fi

      _extra_native_flags+=" ${_fake_gnuc_flag} -mtls-dialect=gnu2"
    fi

    ## cross-compiler setup
    export PATH="${_cross_path:-"${PATH}"}"
    if [ "${_use_mingw}" = "llvm" ]; then
      _cross64="$(command -v x86_64-w64-mingw32-clang)"
      _crossxx64="$(command -v x86_64-w64-mingw32-clang++)"
      _cross32="$(command -v i686-w64-mingw32-clang)"
      _crossxx32="$(command -v i686-w64-mingw32-clang++)"
      if [[ "${_cross_path}" =~ "msvcrt" ]] || [ "${_devenv}" = "true" ]; then
        # set so that we don't use fallback code for __GNUC__ <= 4.2.1
        # which may be unnecessarily pessimistic
        # doesn't work with ucrt due to some specific modules failing
        # TODO: upstream a fix for ucrt breakage (to mingw?)
        _extra_cross_flags+=" ${_fake_gnuc_flag}"
      fi

      _extra_cross_flags+=" -ffunction-sections -fdata-sections"
      _extra_crossld_flags+=" -Wl,--gc-sections,-O2,--sort-common,--as-needed,--file-alignment=4096"
    elif [[ "${_use_mingw}" = *msvc ]]; then
      _cross64="$(command -v clang)"
      _crossxx64="$(command -v clang++)"
      _cross32="$(command -v clang)"
      _crossxx32="$(command -v clang++)"

      _extra_cross_flags+=" -fmsc-version=1933 -ffunction-sections -fdata-sections"
      _extra_crossld_flags+=" -Wl,/FILEALIGN:4096,/OPT:REF,/OPT:ICF,/HIGHENTROPYVA:NO"
      if [ "${_use_mingw}" = "msvc" ]; then _extra_cross_flags+=" ${_polly_flags:-}"; fi
    elif [ "${_use_mingw}" = "nomingw" ]; then
      _cross64="$(command -v gcc)"
      _crossxx64="$(command -v g++)"
      _cross32="$(command -v gcc)"
      _crossxx32="$(command -v g++)"

      _extra_cross_flags+=" -ffunction-sections -fdata-sections"
      _extra_crossld_flags+=" -Wl,--gc-sections"
    else
      _cross64="$(command -v x86_64-w64-mingw32-gcc)"
      _crossxx64="$(command -v x86_64-w64-mingw32-g++)"
      _cross32="$(command -v i686-w64-mingw32-gcc)"
      _crossxx32="$(command -v i686-w64-mingw32-g++)"

      _extra_cross_flags+=" -floop-nest-optimize -fgraphite-identity -mtls-dialect=gnu2" # graphite opts + mingw-gcc opts
      _extra_crossld_flags+=" -Wl,-O2,--sort-common,--as-needed,--file-alignment=4096"
    fi

    CPPFLAGS="-D_GNU_SOURCE -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=0 -DNDEBUG -D_NDEBUG"
    _common_cflags="${_cpu_target} ${_extra_common_flags:-} -pipe -O3 -mfpmath=sse -fno-strict-aliasing -fwrapv -fno-semantic-interposition \
                    -Wno-error=incompatible-pointer-types -Wno-error=implicit-function-declaration -w"

    _GCC_FLAGS="${_common_cflags:-} ${_lto_flags:-} ${_extra_native_flags:-} ${CPPFLAGS:-} -ffunction-sections -fdata-sections" # only for the non-mingw side
    _CROSS_FLAGS="${_common_cflags:-} ${_extra_cross_flags:-} ${CPPFLAGS:-}" # only for the mingw side

    _LD_FLAGS="${_GCC_FLAGS:-} ${_extra_ld_flags:-} -Wl,-O2,--sort-common,--as-needed,--gc-sections,--hash-style=gnu"
    _CROSS_LD_FLAGS="${_common_cflags:-} ${_extra_crossld_flags:-} ${CPPFLAGS:-}"

    _GCC_FLAGS=$(echo "${_GCC_FLAGS}" | tr ' ' '\n' | awk '!seen[$0]++' | tr '\n' ' ' | sed 's/ $//')
    _CROSS_FLAGS=$(echo "${_CROSS_FLAGS}" | tr ' ' '\n' | awk '!seen[$0]++' | tr '\n' ' ' | sed 's/ $//')
    _LD_FLAGS=$(echo "${_LD_FLAGS}" | tr ' ' '\n' | awk '!seen[$0]++' | tr '\n' ' ' | sed 's/ $//')
    _CROSS_LD_FLAGS=$(echo "${_CROSS_LD_FLAGS}" | tr ' ' '\n' | awk '!seen[$0]++' | tr '\n' ' ' | sed 's/ $//')

    _compilerhash="$(md5sum "${_cc}" | cut -d ' ' -f 1),$(md5sum "${_cross64}" | cut -d ' ' -f 1),$(md5sum "${_cross32}" | cut -d ' ' -f 1)"

    # this is required for ccache to survive compiler reinstalls
    CCACHE_COMPILERCHECK="${CCACHE_COMPILERCHECK:-"string:${_compilerhash}"}"
  fi

  # re-export everything to persist between makepkg stages

  export CPPFLAGS CCACHE_COMPILERCHECK

  export CC="${_ccache} ${_cc}"
  export CXX="${_ccache} ${_cxx}"
  export STRIP="${_stripprog}"

  export x86_64_CC="${_ccache} ${_cross64}"
  export x86_64_CXX="${_ccache} ${_crossxx64}"

  export i386_CC="${_ccache} ${_cross32}"
  export i386_CXX="${_ccache} ${_crossxx32}"

  export x86_64_CFLAGS="${_CROSS_FLAGS} ${_common_64_cflags:-} -std=gnu23"
  export x86_64_CXXFLAGS="${_CROSS_FLAGS} ${_common_64_cflags:-}"

  export i386_CFLAGS="${_CROSS_FLAGS} ${_common_32_cflags:-} -std=gnu23"
  export i386_CXXFLAGS="${_CROSS_FLAGS} ${_common_32_cflags:-}"

  export CFLAGS="${_GCC_FLAGS} ${_common_64_cflags:-} ${_lto_cache_flags:-} -std=gnu23"
  export CXXFLAGS="${_GCC_FLAGS//${_fake_gnuc_flag}/} ${_lto_cache_flags:-}"
  export CROSSCFLAGS="${_CROSS_FLAGS} -std=gnu23"
  export CROSSCXXFLAGS="${_CROSS_FLAGS//${_fake_gnuc_flag}/}"

  export LDFLAGS="${_LD_FLAGS} ${_lto_cache_flags:-}"
  export CROSSLDFLAGS="${_CROSS_LD_FLAGS}"

  export PATH="${_cross_path:-"${PATH}"}"
}

_set_vars

_set_vars64() {
  _common_64_cflags='' # "-march=x86-64 -mtune=native"
  _common_32_cflags='' # "-m32 -march=i686 -mtune=native"

  _set_vars

  # if [ -f "/usr/lib/libunwind.a" ] && [ -f "/usr/lib/libz.a" ] && [ -f "/usr/lib/liblzma.a" ]; then
  #   export UNWIND_CFLAGS=""
  #   export UNWIND_LIBS="-l:libunwind.a -l:liblzma.a -l:libz.a"
  # fi

  export CROSSCC="${x86_64_CC}"
}

_set_vars32() {
  export PKG_CONFIG_PATH="/usr/lib32/ffmpeg-minimal-dev/pkgconfig:/usr/lib32/pkgconfig:/usr/share/pkgconfig:${PKG_CONFIG_PATH}"
  _common_64_cflags='' # "-m32 -march=i686 -mtune=native"
  _common_32_cflags='' # "-m32 -march=i686 -mtune=native"

  _set_vars

  export CROSSCC="${i386_CC}"
}

prepare() { _set_vars;
  if [ "${_where}/src" != "${srcdir}" ]; then _failure "Something weird is going on with your PKGBUILD's path, exiting early to avoid tampering with your files."; fi
  cd "${_where}" || _failure

  ## Removes pkg dir if already existing
  rm -rf "${_where}"/pkg || true

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
    _desired_wine_commit=$_patchbase_wine_commit
    _desired_staging_commit=$_patchbase_staging_commit
  else
    msg "Using custom patches"
    _patchdir="${_where}/custompatches"
  fi

  ## Staging setup
  if [ "${_use_staging}" = "true" ]; then
    cd "${srcdir}"/wine-staging || _failure
    git reset --hard "${_desired_staging_commit}" || _failure
    git clean -ffdx &>/dev/null || true

    if [ "${_custompatches}" = "true" ]; then
      _patchbase_staging_commit=$(git rev-parse HEAD)
      _desired_staging_commit=$_patchbase_staging_commit

      if [ "${_use_staging_upstream}" = "true" ]; then
        _patchbase_wine_commit="$(cat "${srcdir}"/wine-staging/staging/upstream-commit)"
        _desired_wine_commit=$_patchbase_wine_commit
      fi
    fi

    sed -i "s/^_desired_staging_commit=.*$/_desired_staging_commit=${_desired_staging_commit}/g" "${_where}/PKGBUILD"

    msg2 "Wine staging at: $_patchbase_staging_commit"
  fi

  ## Mainline setup

  cd "${srcdir}"/wine || _failure
  git reset --hard "${_desired_wine_commit}" || _failure
  git clean -ffdx &>/dev/null || true

  if [ "${_custompatches}" = "true" ]; then
    _patchbase_wine_commit=$(git rev-parse HEAD)
    _desired_wine_commit=$_patchbase_wine_commit
  fi

  sed -i "s/^_desired_wine_commit=.*$/_desired_wine_commit=${_desired_wine_commit}/g" "${_where}/PKGBUILD"

  msg2 "Wine mainline at: $_patchbase_wine_commit"
  touch "${_where}"/patchlog.txt || _failure
  printf "Wine commit: %s\n" "${_patchbase_wine_commit}" > "${_where}"/patchlog.txt

  cd "${srcdir}" || _failure

  ## Add current config to custompatches dir

  if [ "${_custompatches}" = "true" ]; then
    echo -n "${_desired_wine_commit}" > "${_patchdir}/wine-commit"
    echo -n "${_desired_staging_commit}" > "${_patchdir}/staging-commit"
    echo -n "${_disabled_staging[@]/#/-W }" > "${_patchdir}/staging-exclude"
  fi

  ## Patching setup

  if [ "${_use_staging}" = "true" ]; then
    _staging_args=()
    printf "Staging commit: %s\n" "${_patchbase_staging_commit}" >> "${_where}"/patchlog.txt

    if [ -f "${srcdir}"/wine-staging/patches/patchinstall.sh ]; then
      staging_patcher="${srcdir}"/wine-staging/patches/patchinstall.sh
    else
      staging_patcher="${srcdir}"/wine-staging/staging/patchinstall.py
    fi

    local staging_patcher_relpath
    staging_patcher_relpath="$(realpath --relative-to="${PWD:-${srcdir}}" "${staging_patcher}")" || _failure "Couldn't build a relative path to the staging patcher."

    msg2 "Applying staging patches"
    printf "\nApplying staging patches\n\n" >> "${_where}"/patchlog.txt

    # for better git history ("rebase mode", very slow)
    # if [ "${_devenv}" = "true" ]; then _staging_args+=(-r); fi

    # shellcheck disable=SC2206
    _staging_args+=(--no-autoconf ${_enabled_staging[@]:-"--all"} ${_disabled_staging[*]/#/-W })

    printf "Staging args: %s\n" "${_staging_args[*]}" >> "${_where}"/patchlog.txt

    if [ -d "${_patchdir}"/staging-overrides ] && find "${_patchdir}"/staging-overrides -name "*spatch" -print0 -quit | grep . >/dev/null; then
      for override in "${_patchdir}"/staging-overrides/*; do
        base=$(basename "${override}")
        dest=$(find "${srcdir}"/wine-staging/patches/ -name "${base%.spatch}*")
        cp "${override}" "${dest}"
      done

      msg2 "Overrode all staging patches matching those in staging-overrides/*.spatch"
      printf "\nOverrode all staging patches matching those in staging-overrides/*.spatch\n\n" >> "${_where}"/patchlog.txt
    fi

    # known to causes issues on wow64 (if seccomp is used on the host)
    # if [ "${_wow64build}" = "true" ]; then _disabled_staging+=(ntdll-Syscall_Emulation); fi

    local wine_src_relpath
    wine_src_relpath="$(realpath --relative-to="${PWD:-${srcdir}}" "${srcdir}"/wine)" || _failure "Couldn't build a relative path to the wine source directory."

    "${staging_patcher_relpath[@]}" DESTDIR="${wine_src_relpath}" "${_staging_args[@]}" &>> "${_where}"/patchlog.txt || \
        _failure "Error applying staging patches, check patchlog.txt for info."
  fi

  ## Apply other patches

  cd "${srcdir}"/wine || _failure

  git config commit.gpgsign false &>/dev/null || true
  git config user.email "wine@build.dev" &>/dev/null || true
  git config user.name "winebuild" &>/dev/null || true
  git add --all &>/dev/null || true
  git commit --allow-empty -m "staging" &>/dev/null || true

  printf "\nApplying other patches\n\n" >> "${_where}"/patchlog.txt

  patchlist=("${srcdir}"/makedep-fix.patch)
  if [ "${_use_lto}" = "true" ] && ! { find "${_patchdir}"/ -name "*LTO-fixup.patch" -print0 -quit | grep . >/dev/null ; }; then patchlist+=("${srcdir}"/lto-fixup.patch); fi

  pattern=("(" "(" "-regex" ".*\.patch")

  if [ "${_wow64build}" = "true" ]; then
    pattern+=(")" "-a" "(" "-not" "-regex" ".*\.3264\.patch")
  fi

  if [ "${_use_mingw}" = "nomingw" ]; then
    # it's not worth figuring out why this patchset fails for such a niche build configuration
    pattern+=(")" "-a" "(" "-not" "-regex" ".*jpeg-SIMD.*\.patch")
  fi

  pattern+=(")" ")")

  local patchdir_relpath
  patchdir_relpath="$(realpath --relative-to="${PWD:-"${srcdir}/wine"}" "${_patchdir}")" || _failure "Couldn't build a relative path to the patch directory."

  mapfile -t patchlist_tmp < <(find "${patchdir_relpath}" -type f "${pattern[@]}" | LC_ALL=C sort -f)

  patchlist+=("${patchlist_tmp[@]}")

  for patch in "${patchlist[@]}"; do
    printf "\nApplying %s\n\n" "${patch//..\//}" >> "${_where}"/patchlog.txt
    msg2 "Applying '${patch//..\//}'"
    #git apply --ignore-whitespace --verbose "${patch}" &>> "${_where}"/patchlog.txt || \
    patch -Np1 <"${patch}" &>> "${_where}"/patchlog.txt || \
      _failure "An error occurred applying ${patch//..\//}, check patchlog.txt for info."
  done

  sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i "${srcdir}/wine"/configure* || true

  if [ "${_strip_package}" = "true" ]; then
    awk -i inplace '/STRIPPROG=/ { sub(/ %s/, " %s -s") }1' "${srcdir}/wine/tools/makedep.c"
    # shellcheck disable=SC2016
    sed -i 's|stripcmd=$stripprog|stripcmd="$stripprog -s"|g' "${srcdir}/wine/tools/install-sh"
  fi

  ## clean up .orig files if patches succeeded
  find "${srcdir}"/wine/ -iregex ".*orig" -execdir rm '{''}' '+' || true

  # run this if e.g. proton vkd3d is in the wine tree
  # msg2 "Running make_vulkan..."
  # ./dlls/winevulkan/make_vulkan
  # ./dlls/winevulkan/make_vulkan -x vk.xml

  msg2 "Running make_requests..."
  tools/make_requests || _failure

  if [ -e tools/make_specfiles ]; then
    msg2 "Running make_specfiles..."
    tools/make_specfiles || _failure
  fi

  ## make tools/make_makefiles happy
  git add --all &>/dev/null || true
  git commit --allow-empty -m "pre" &>/dev/null || true

  msg2 "Running make_makefiles..."
  tools/make_makefiles || _failure

  msg2 "Running autoreconf..."
  autoreconf -fi

  git add --all &>/dev/null || true
  git commit --amend --allow-empty -m "makepkg" &>/dev/null || true
}

_configure64() { _set_vars64;
  cd "${build64dir}" || _failure

  msg2 "Configuring Wine-64"
  ../wine/configure \
    "${_sharedopts[@]}" \
    "${_wine64opts[@]}" || _failure "Wine-64 configure failed; check ${build64dir#"${_where}/"}/config.log for more information"
}

_configure32() { _set_vars32;
  cd "${build32dir}" || _failure

  msg2 "Configuring Wine-32"
  ../wine/configure \
    "${_sharedopts[@]}" \
    "${_wine32opts[@]}" || _failure "Wine-32 configure failed; check ${build32dir#"${_where}/"}/config.log for more information"
}

## Used for single-make build
_tools64() { _set_vars64;
  cd "${build64dir}" || _failure

  msg2 "Building Wine-64 tools"

  shopt -s globstar
  # don't use lto to speed up tools compilation
  _noltoflags="-fno-lto -O1"
  for mkfile in tools/Makefile tools/**/Makefile; do
    "$@" -C "${mkfile%/Makefile}" CFLAGS="${CFLAGS} ${_noltoflags}" LDFLAGS="${LDFLAGS} ${_noltoflags}" CROSSCFLAGS="${CROSSCFLAGS} ${_noltoflags}" CROSSLDFLAGS="${CROSSLDFLAGS} ${_noltoflags}"
  done
  chmod -R +x "${build64dir}"/tools
  shopt -u globstar
}

# shellcheck disable=SC2120
_build64() { _set_vars64;
  cd "${build64dir}" || _failure

  msg2 "Building Wine-64"
  if [ "${_wow64build}" = "true" ]; then
    make "${_mjobsflag:-}" || _failure "Wine-64 Compilation failed"
  else
    MAKEFLAGS="${_mjobsflag:-}"
    exec "${@}" || _failure "Wine-64 Compilation failed"
  fi
}

# invoked by make -f Makefile.single
_build32() { _set_vars32;
  cd "${build32dir}" || _failure

  msg2 "Building Wine-32"

  MAKEFLAGS="${_mjobsflag:-}"
  exec "${@}" || _failure "Wine-32 Compilation failed"
}

build() { _set_vars;
  _sharedopts=(); _wine64opts=(); _wine32opts=()

  if [ "${_devenv}" = "true" ]; then
    msg "Optimizing development environment..."

    # ccache/lto cache
    _prep_ccache

    # configure cache
    _confcachedir="${_where}"/.confcaches
    _compilerwithflagshash="$(sha512sum - < <(printf '%s' "${CFLAGS}${LDFLAGS}${CROSSCFLAGS}${CROSSLDFLAGS}${_compilerhash}") | cut -d ' ' -f 1)"
    _confcacheprefix="${_confcachedir}"/"${pkgver%.w*}-${pkgrel}-${_compilerwithflagshash}${_wowname}"

    if [ ! -d "${_confcachedir}" ]; then
      mkdir "${_confcachedir}" || \
          _failure "Couldn't create an autoconf cache directory in ${_confcachedir#"${_where}/"}. This shouldn't have happened."
    fi

    _sharedopts+=(--config-cache)
    _wine64opts+=(--cache-file="${_confcacheprefix}"-64.cache)
    _wine32opts+=(--cache-file="${_confcacheprefix}"-32.cache)

    # "awesome"
    if [ ! -f "${_confcacheprefix}"-64.cache ]; then
      rm -rf "${srcdir}"/*64-build || true
      find "${_confcachedir}"/ -type f -regex '.*64\.cache' -execdir mv '{''}'{,.off} ';' || true
      if [ -f "${_confcacheprefix}"-64.cache.off ]; then
        mv "${_confcacheprefix}"-64.cache{.off,}
      fi
    fi
    if [ ! -f "${_confcacheprefix}"-32.cache ]; then
      rm -rf "${srcdir}"/*32-build || true
      find "${_confcachedir}"/ -type f -regex '.*32\.cache' -execdir mv '{''}'{,.off} ';' || true
      if [ -f "${_confcacheprefix}"-32.cache.off ]; then
        mv "${_confcacheprefix}"-32.cache{.off,}
      fi
    fi

    git -C "${srcdir}"/wine/ config --unset commit.gpgsign &>/dev/null || true
    git -C "${srcdir}"/wine/ config --unset user.email &>/dev/null || true
    git -C "${srcdir}"/wine/ config --unset user.name &>/dev/null || true
    cp -r "${HOME}/.config/edwkspc/wine/".* "${srcdir}"/wine/ &>/dev/null || true
    printf '%s\n%s\n%s\n%s\n%s' '.vscode' '.gitignore' '*patch' '.clang-format' '.clangd' > "${srcdir}"/wine/.gitignore || true # vscode? cringe!
  else
    # was it worth it?
    rm -rf "${srcdir}"/*-build || true
  fi

  _sharedopts+=(
    --prefix=/opt/"${pkgname}"  --without-oss
    --disable-tests             --without-coreaudio
    --disable-winemenubuilder   --without-cups
    --disable-win16             --without-sane
    --with-x                    --without-gphoto
    --with-gstreamer            --without-pcsclite
    --with-ffmpeg               --without-pcap
    --with-wayland              --without-capi
    --silent                    --without-v4l2
    --enable-silent-rules       --without-netapi
  )

  _wine64opts+=(
    --libdir=/opt/"${pkgname}"/lib
  )
  if [ "${_use_mingw}" != "nomingw" ]; then
    _wine64opts+=(--with-mingw="${x86_64_CC}")
  else
    _wine64opts+=(--without-mingw)
  fi

  if [ "${_wow64build}" = "true" ]; then
    _wine64opts+=(--enable-archs="x86_64,i386")
  else
    _wine64opts+=(--enable-win64)

    local wine64_build_relpath
    wine64_build_relpath="$(realpath --relative-to="${build32dir}" "${build64dir}")" || _failure "Couldn't build a relative path to the wine-64 build directory."

    _wine32opts+=(
      --libdir=/opt/"${pkgname}"/lib
      --with-wine64="${wine64_build_relpath}"
    )
    if [ "${_use_mingw}" != "nomingw" ]; then
      _wine32opts+=(--with-mingw="${i386_CC}")
    else
      _wine32opts+=(--without-mingw)
    fi
  fi

  local _old_SOURCE_DATE_EPOCH="$SOURCE_DATE_EPOCH"
  export SOURCE_DATE_EPOCH=0

  if [ ! -d "${build64dir}" ]; then mkdir "${build64dir}"; fi

  ## don't build lib32 for wow64 builds
  if [ "${_wow64build}" = "true" ]; then
    _configure64
    _build64
  else
    _TMP_VARFILE="$(mktemp)" && export _TMP_VARFILE
    trap 'rm -f -- "$_TMP_VARFILE"' EXIT
    { ( unset MAKEFLAGS; unset MFLAGS; set ); echo; set +o; } >"$_TMP_VARFILE"

    if [ ! -d "${build32dir}" ]; then mkdir "${build32dir}"; fi
    make -f "${_where}"/Makefile.single "${_mjobsflag:-}"
  fi

  ## build launch wrapper to symlink to /usr/bin/ later
  msg2 "Building launch wrapper..."
  env cc "${srcdir}"/winestart.c -Wl,-s -Oz -march=x86-64 -static -o "${srcdir}"/winestart

  export SOURCE_DATE_EPOCH="$_old_SOURCE_DATE_EPOCH"
}

package() { _set_vars;
  if [ "${_install_static}" = "true" ]; then
    _installtype="install"
  else
    _installtype="install-lib"
  fi

  mkdir -p "${pkgdir}"/opt/"${pkgname}" || _failure

  local install_relpath
  install_relpath="$(realpath --relative-to="${build64dir}" "${pkgdir}"/opt/"${pkgname}")" || _failure "Couldn't get a relative path to the pkgdir from the build dir"

  if [ "${_wow64build}" != "true" ]; then
    _set_vars32
    msg2 "Packaging Wine-32"
    cd "${build32dir}" || _failure
    make "${_mjobsflag:-}" \
      prefix="${install_relpath}" \
      libdir="${install_relpath}"/lib \
      dlldir="${install_relpath}"/lib/wine $_installtype || _failure "Wine-32 installation failed"
  fi

  _set_vars64
  msg2 "Packaging Wine-64"
  cd "${build64dir}" || _failure
  make "${_mjobsflag:-}" \
    prefix="${install_relpath}" \
    libdir="${install_relpath}"/lib \
    dlldir="${install_relpath}"/lib/wine $_installtype || _failure "Wine-64 installation failed"

  cd "${pkgdir}" || _failure

  ln -srf ./opt/"${pkgname}"/lib{,64}
  ln -srf ./opt/"${pkgname}"/lib{,32}

  if [ "${_install_static}" != "true" ] && [ "${_strip_package}" = "true" ]; then # stripping with static libs is broken for some reason?
    msg "Stripping symbols from libraries..."

    find ./opt/"${pkgname}"/lib/ \
      -type f '(' -iname '*.a' -or -iname '*.dll' -or -iname '*.so' -or -iname '*.sys' -or -iname '*.drv' -or -iname '*.exe' ')' \
      -print0 \
      | xargs -0 strip -s &>/dev/null || true
  fi

  if [ ! -f ./opt/"${pkgname}"/bin/wine ] && [ -f ./opt/"${pkgname}"/bin/wine64 ]; then
    ln -srf ./opt/"${pkgname}"/bin/wine{64,}
  fi

  if [ ! -f ./opt/"${pkgname}"/bin/wine64 ] && [ -f ./opt/"${pkgname}"/bin/wine ]; then
    ln -srf ./opt/"${pkgname}"/bin/wine{,64}
  fi

  ## Add simple wrapper and link it to /usr/bin/
  cp "${srcdir}"/winestart ./opt/"${pkgname}"/bin/winestart
  chmod +x ./opt/"${pkgname}"/bin/winestart
  install -d ./usr/bin
  ln -sf /opt/"${pkgname}"/bin/winestart "${pkgdir}"/usr/bin/wine-osu"${_wowname}"

  # should work, but doesn't for some reason?
  # if [ "${_wow64build}" != "true" ] && (git -C "${srcdir}"/"${pkgname}"/ merge-base --is-ancestor 765ea3470ad96dfcbd8ce4c239225206ea41be8a HEAD &> /dev/null); then
  #   ln -sf /opt/"${pkgname}"/bin/winestart "${pkgdir}"/usr/bin/wine-osu-forcewow64
  # fi

  ## Clean patchlog dirnames and add to package
  sed -i "s|${_where}\/||g" "${_where}"/patchlog.txt

  cp "${_where}"/patchlog.txt ./opt/"${pkgname}"
}

################################################################################################################################
################################################################################################################################
## more random helpers

## ccache configuration (taken from https://raw.githubusercontent.com/openglfreak/wine-tkg-userpatches/next/config/ccache.cfg)
## only with _devenv=true
_prep_ccache() {
  export CCACHE_DIR="${XDG_CACHE_HOME:-${HOME}/.cache}/ccache/wine${_wowname}"
  mkdir -p "${CCACHE_DIR}"
  export CCACHE_BASEDIR="${CCACHE_BASEDIR:-"${srcdir}"}"
  "${_ccache}" --set-config=compression=true \
               --set-config=compression_level=1 \
               --set-config=sloppiness=file_macro,time_macros \
               --set-config=hash_dir=false \
               --set-config=inode_cache=true \
               --set-config=temporary_dir="${CCACHE_DIR}/tmp"

  if [[ "${_use_clang}" =~ (bundled|true) ]] && [ "${_lto_type:-}" = "thin" ]; then
    _ltodir="${XDG_CACHE_HOME:-${HOME}/.cache}/thinlto/${pkgname}"
    if [ ! -d "${_ltodir}" ]; then mkdir -p "${_ltodir}"; fi
    export _lto_cache_flags="-Wl,--thinlto-cache-dir=${_ltodir}"
  fi
}

_failure() {
  if [ -n "$*" ]; then msg "$*"; fi
  error "Exiting."
  exit 1
}
