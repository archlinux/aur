# shellcheck disable=SC2148,SC2154,SC2034

# Maintainer: William Horvath <william at horvath dot blog>

_where="${PWD:-$(pwd)}"

################################################################################################################################
################################################################################################################################
### OPTIONS
################################################################################################################################
################################################################################################################################

wow64build=".wow64" ## set to "" (empty) to make a non-wow64 build, otherwise set to .wow64 (default)

## should be empty unless you want a custom commit, the commits are taken from the patchbase repository by default
_desired_wine_commit=
_desired_staging_commit=

_cleanbuildfolders=false
_autoupdate=false
_disabled_staging="" ## e.g. "-W Compiler_Warnings -W user32-. . ."

## to use this, create a "custompatches" folder in the top-level PKGBUILD directory and place your patches there.
## the patches from the wine-osu-patches git repo will no longer be applied, but you can copy them to the custompatches folder
## manually if you wish to use them alongside your own patches.
_custompatches=false

################################################################################################################################
################################################################################################################################

if [ -n "$wow64build" ]; then _wowname="wow64-"; else _wowname=""; fi

pkgname=wine-osu-spectator-"${_wowname}"bin

pkgver=9.11${wow64build:-}
pkgrel=3

pkgdesc="A compatibility layer for running Windows programs, but with osu! specific patches"
if [ -n "$wow64build" ]; then pkgdesc+=" (WoW64 version)"; fi

provides=(wine-osu-spectator-"${_wowname}"bin)
conflicts=(wine-osu-spectator-"${_wowname}"bin)

install=wine.install
url="http://www.winehq.com"
arch=(x86_64)
license=(LGPL ISC)

options=('!buildflags' 'staticlibs' 'ccache' '!lto' '!debug' '!strip')

source=(
  git+https://github.com/whrvt/wine-osu-patches.git#tag=06-21-2024-6c5d17af-593249dc
  winestart # wow64 gcc-latest LD_LIBRARY_PATH shenanigans, LD_RUN_PATH and other methods did not seem to work
  30-win32-aliases.conf
  wine-binfmt.conf

  https://github.com/mstorsjo/llvm-mingw/releases/download/nightly/llvm-mingw-nightly-ucrt-ubuntu-20.04-x86_64.tar.xz
)

sha512sums=(
  '05bdd8ed7595dcb96f3dab60d0df66fe766a0b811d40692d022267e45f0f62a1d8592b2a42189b83cee3dc8ac0ea7aed8f1e2ad0d3f8c30923852ae97f794c52'
  '755697df574bbdbcbbd29f87eccf0c38af6166fa73e066326b875f3fc5544ad72fd8d8280357e9594a0c029394d7a1ad8e19983efd8d33b50074451ea77bb91b'
  '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb'
  'bdde7ae015d8a98ba55e84b86dc05aca1d4f8de85be7e4bd6187054bfe4ac83b5a20538945b63fb073caab78022141e9545685e4e3698c97ff173cf30859e285'
  'SKIP'
)
noextract=()

if [ -n "${_desired_wine_commit}" ]; then
  source+=("git+https://gitlab.winehq.org/wine/wine.git#commit=${_desired_wine_commit}")
else
  source+=('git+https://gitlab.winehq.org/wine/wine.git')
fi
sha512sums+=('SKIP')

if [ -n "${_desired_staging_commit}" ]; then
  source+=("git+https://github.com/wine-staging/wine-staging.git#commit=${_desired_staging_commit}")
else
  source+=('git+https://github.com/wine-staging/wine-staging.git')
fi
sha512sums+=('SKIP')

if [ -n "${wow64build}" ]; then
  source+=('https://kayari.org/gcc-latest/gcc-latest.deb')
  sha512sums+=('SKIP')
  noextract+=('gcc-latest.deb')
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
  faudio
  desktop-file-utils
)

makedepends=(autoconf bison ccache perl fontforge flex
  giflib
  libpng
  gnutls
  libxinerama
  libxcomposite
  libxmu
  libxxf86vm
  libxkbcommon
  wayland
  libldap
  mpg123
  openal
  v4l-utils
  libpulse
  alsa-lib
  mesa
  mesa-libgl
  opencl-icd-loader
  libxslt
  sdl2
  libcups
  libgphoto2
  sane
  gsm
  vulkan-headers
  samba
  opencl-headers
  nasm
)

optdepends=(
  giflib
  libpng
  libldap
  gnutls
  mpg123
  openal
  v4l-utils
  libpulse
  alsa-plugins
  alsa-lib
  libjpeg-turbo
  libxcomposite
  libxinerama
  opencl-icd-loader
  libxslt
  gst-plugins-base-libs
  vkd3d
  sdl2
  libgphoto2
  sane
  gsm
  cups
  samba dosbox
)

if [ -z "${wow64build}" ]; then
  depends+=(lib32-fontconfig lib32-lcms2 lib32-libxml2 lib32-libxcursor lib32-libxrandr lib32-libxdamage lib32-libxi lib32-gettext lib32-freetype2 lib32-glu lib32-libsm lib32-gcc-libs lib32-libpcap lib32-faudio)
  makedepends+=(lib32-giflib lib32-libpng lib32-gnutls lib32-libxinerama lib32-libxcomposite lib32-libxmu lib32-libxxf86vm lib32-libldap lib32-mpg123 lib32-openal lib32-v4l-utils lib32-libpulse lib32-alsa-lib lib32-libxcomposite lib32-mesa lib32-mesa-libgl lib32-opencl-icd-loader lib32-libxslt lib32-sdl2 lib32-libcups)
  optdepends+=(lib32-giflib lib32-libpng lib32-libldap lib32-gnutls lib32-mpg123 lib32-openal lib32-v4l-utils lib32-libpulse lib32-alsa-plugins lib32-alsa-lib lib32-libjpeg-turbo lib32-libxcomposite lib32-libxinerama lib32-opencl-icd-loader lib32-libxslt lib32-gst-plugins-base-libs lib32-vkd3d lib32-sdl2)
fi

makedepends=("${makedepends[@]}" "${depends[@]}")

# exported at the start of every function
_set_vars() {
  export LD_LIBRARY_PATH="${srcdir}/llvm-mingw/lib:${srcdir}/llvm-mingw/x86_64-w64-mingw32/lib:${srcdir}/llvm-mingw/i686-w64-mingw32/lib:${srcdir}/llvm-mingw/lib/clang/19/lib/windows:$LD_LIBRARY_PATH"
  if [ -n "${wow64build}" ]; then
    export PATH="${srcdir}/llvm-mingw/bin":"${srcdir}/gcc-latest/bin":"${PATH}"
    export LD_RUN_PATH="/opt/$pkgname/lib64/wine/x86_64-unix":"${LD_RUN_PATH}"
    _GLIBC_LIBS_COMMON="-L${srcdir}/gcc-latest/lib64"
    _GLIBC_LIBS_NATIVE="-Wl,-rpath,/opt/$pkgname/lib64/wine/x86_64-unix -static-libgcc -static-libstdc++"
  else
    export PATH="${srcdir}/llvm-mingw/bin":"${PATH}"
    _GLIBC_LIBS_COMMON=""
    _GLIBC_LIBS_NATIVE=""
  fi

  export CPPFLAGS="-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=0 -DNDEBUG -D_NDEBUG"
  _common_cflags="${_GLIBC_LIBS_COMMON} -march=x86-64 -mtune=native -O2 -pipe -fno-strict-aliasing -fomit-frame-pointer -fwrapv -Wno-error=incompatible-pointer-types -Wno-error=implicit-function-declaration -Wno-error=return-mismatch -Wno-error=int-conversion -w"

  #_LTO_FLAGS="-flto -fdevirtualize-at-ltrans -flto-partition=one -Wl,-flto" # not currently used
  #_GCC_NATIVE_FLAGS="-floop-nest-optimize -fgraphite-identity -floop-strip-mine " # gcc-latest is not compiled with libisl which is needed for graphite, but not currently used
  #_OPTIMIZE_HARDER_FLAGS="-fipa-pta -fgcse-sm -fgcse-las -fira-loop-pressure -fsched-pressure -fsched-spec-load" # not currently used
  _native_common_cflags="${_GLIBC_LIBS_NATIVE}"

  _GCC_FLAGS="${_common_cflags} ${_native_common_cflags} ${CPPFLAGS}"
  _LD_FLAGS="${_GCC_FLAGS} -Wl,-O2,--sort-common,--as-needed"

  _CROSS_FLAGS="${_common_cflags} ${CPPFLAGS} -L${srcdir}/llvm-mingw/lib -I${srcdir}/llvm-mingw/include -I${srcdir}/llvm-mingw/lib/clang/19/include -I${srcdir}/llvm-mingw/generic-w64-mingw32/include -L${srcdir}/llvm-mingw/x86_64-w64-mingw32/lib -L${srcdir}/llvm-mingw/i686-w64-mingw32/lib -L${srcdir}/llvm-mingw/lib/clang/19/lib/windows"
  _CROSS_LD_FLAGS="${_CROSS_FLAGS} -Wl,-O2,--sort-common,--as-needed,--file-alignment=4096"

  export STRIP="ccache strip"

  export CC="ccache gcc"
  export CXX="ccache g++"
  export CROSSCC="ccache x86_64-w64-mingw32-clang"
  export CROSSCC64="ccache x86_64-w64-mingw32-clang"
  export CROSSCC32="ccache i686-w64-mingw32-clang"
  export x86_64_CC="ccache x86_64-w64-mingw32-clang"
  export i386_CC="ccache i686-w64-mingw32-clang"

  export CFLAGS="${_GCC_FLAGS}"
  export CXXFLAGS="${_GCC_FLAGS}"
  export CROSSCFLAGS="${_CROSS_FLAGS}"
  export CROSSCXXFLAGS="${_CROSS_FLAGS}"

  export LDFLAGS="${_LD_FLAGS}"
  export CROSSLDFLAGS="${_CROSS_LD_FLAGS}"
}

prepare() { _set_vars;
  cd "${_where}" || _failure

  ## removes pkg dir if already existing
  rm -rf "${_where}"/pkg || true 

  ## rename downloaded llvm-mingw
  mv "$(find "${srcdir}" -maxdepth 1 -type d -iregex ".*llvm-mingw-nightly.*")" "${srcdir}"/llvm-mingw

  ## extract gcc-latest
  if [ -n "${wow64build}" ]; then
    if ! [ -e "${_where}"/data.tar.xz ]; then ar xv gcc-latest.deb data.tar.xz; fi
    if ! [ -e "${_where}"/gcc-latest ]; then 
      tar -xf data.tar.xz ./opt/gcc-latest && \
      mv ./opt/gcc-latest . && \
      rmdir opt
    fi
    ln -s "${_where}"/gcc-latest "${srcdir}"/gcc-latest
  fi
  
  _patchbase_wine_commit=$(cat "${srcdir}"/wine-osu-patches/wine-commit)
  _patchbase_staging_commit=$(cat "${srcdir}"/wine-osu-patches/staging-commit)

  if [ -z "${_desired_wine_commit}" ]; then
    _desired_wine_commit=$_patchbase_wine_commit
  fi

  if [ -z "${_desired_staging_commit}" ]; then
    _desired_staging_commit=$_patchbase_staging_commit
  fi

  ## Mainline setup

  ## Rename our working copy of the wine source
  mv "${srcdir}"/wine "${srcdir}"/"${pkgname}" || _failure

  if [ "$_autoupdate" != "true" ]; then
    cd "${srcdir}"/"${pkgname}" || _failure
    git reset --hard "${_desired_wine_commit}" || _failure
    cd "${srcdir}" || _failure
  fi

  if [ "${_desired_wine_commit}" != "${_patchbase_wine_commit}" ]; then
    msg2 "Wine mainline updated to: $_desired_wine_commit"
  else
    msg2 "Wine mainline at: $_patchbase_wine_commit"
  fi

  ## Staging setup

  if [ "$_autoupdate" != "true" ]; then
    cd "${srcdir}"/wine-staging || _failure
    git reset --hard "${_desired_staging_commit}" || _failure
    cd "${srcdir}" || _failure
  fi

  if [ "${_desired_staging_commit}" != "${_patchbase_staging_commit}" ]; then
    msg2 "Wine staging updated to: $_desired_staging_commit"
  else
    msg2 "Wine staging at: $_patchbase_staging_commit"
  fi

  cd "${srcdir}" || _failure

  ## Patching setup

  touch "${_where}"/patchlog.txt || _failure
  printf "Wine commit:%s\nStaging commit:%s\n" "${_desired_wine_commit}" "${_desired_staging_commit}" > "${_where}"/patchlog.txt

  ## Apply wine-staging patchset

  msg2 "Applying staging patches"
  printf "\nApplying staging patches\n\n" >> "${_where}"/patchlog.txt
  pushd wine-staging/staging || _failure
  # shellcheck disable=SC2086
  ./patchinstall.py DESTDIR="${srcdir}"/"${pkgname}" --all $_disabled_staging >> "${_where}"/patchlog.txt
  popd || _failure

  ## Applying patches

  if [ "${_custompatches}" = "true" ]; then
    if ! [ -d "${_where}/custompatches" ]; then _failure "_custompatches=true but custompatches directory not found."; fi
    patchdir="${_where}/custompatches"
  else
    patchdir="${srcdir}/wine-osu-patches"
  fi

  printf "\nApplying other patches\n\n" >> "${_where}"/patchlog.txt
  cd "${srcdir}"/"${pkgname}" || _failure
  for patch in $(find "${patchdir}" -type f -regex ".*\.patch" | sort); do
    shortname="${patch#"${patchdir}/"}"
    printf "\nApplying %s\n\n" "${shortname}" >> "${_where}"/patchlog.txt
    msg2 "Applying '${shortname}'"
    patch -Np1 <"${patch}" >> "${_where}"/patchlog.txt || 
      if [ "${_custompatches}" != "true" ]; then 
        _failure "An error occurred applying ${shortname}, check patchlog.txt for info."
      else
        _failure "An error occurred applying custompatches/${shortname}, check patchlog.txt for info."
      fi
  done

  ## make tools/make_makefiles happy
  git config user.email "wine@build.dev"
  git config user.name "winebuild"
  git add --all && git commit -m "makepkg"

  chmod +x tools/make_makefiles
  tools/make_makefiles
  chmod +x tools/make_requests
  tools/make_requests
  if [ -e tools/make_specfiles ]; then
    chmod +x tools/make_specfiles
    tools/make_specfiles
  fi
  autoreconf -fiv

  cd "${srcdir}" || _failure

  ## Deleting old build directories (if existing)
  if [ -z "${wow64build}" ]; then rm -rf "${pkgname}"-32-build || true; mkdir "${pkgname}"-32-build; fi
  rm -rf "${pkgname}"-64-build || true
  mkdir "${pkgname}"-64-build
}

buildwow64() { _set_vars;
  cd "${srcdir}" || _failure

  export PKG_CONFIG_LIBDIR=${srcdir}/llvm-mingw/x86_64-w64-mingw32/lib/pkgconfig:/usr/lib/pkgconfig:${srcdir}/llvm-mingw/i686-w64-mingw32/lib/pkgconfig:/usr/lib32/pkgconfig
  export PKG_CONFIG_PATH=$PKG_CONFIG_LIBDIR:$PKG_CONFIG_PATH_CUSTOM

  export x86_64_CC="ccache x86_64-w64-mingw32-clang"
  export CROSSCC="ccache x86_64-w64-mingw32-clang"

  msg2 "Building Wine-64..."
  cd "${srcdir}"/"${pkgname}"-64-build || _failure
  ../"${pkgname}"/configure \
    --libdir=/opt/"${pkgname}"/lib64 \
    --enable-archs=x86_64,i386 \
    "${_sharedopts[@]}" \
    --with-mingw="ccache x86_64-w64-mingw32-clang"

  make -j$(($(nproc) + 1))
}

buildregular() { _set_vars;
  cd "${srcdir}" || _failure

  export PKG_CONFIG_LIBDIR=${srcdir}/llvm-mingw/x86_64-w64-mingw32/lib/pkgconfig:/usr/lib/pkgconfig
  export PKG_CONFIG_PATH=$PKG_CONFIG_LIBDIR:$PKG_CONFIG_PATH_CUSTOM

  export x86_64_CC="ccache x86_64-w64-mingw32-clang"
  export CROSSCC="ccache x86_64-w64-mingw32-clang"

  msg2 "Building Wine-64..."
  cd "${srcdir}"/"${pkgname}"-64-build || _failure
  ../"${pkgname}"/configure \
    --libdir=/opt/"${pkgname}"/lib64 \
    --enable-win64 \
    "${_sharedopts[@]}" \
    --with-mingw="ccache x86_64-w64-mingw32-clang" 

  make -j$(($(nproc) + 1))

  _wine32opts=(
    --libdir=/opt/"${pkgname}"/lib
    --with-wine64="${srcdir}"/"${pkgname}"-64-build
  )

  export PKG_CONFIG_LIBDIR=${srcdir}/llvm-mingw/i686-w64-mingw32/lib/pkgconfig:/usr/lib32/pkgconfig
  export PKG_CONFIG_PATH=$PKG_CONFIG_LIBDIR:$PKG_CONFIG_PATH_CUSTOM

  export i386_CC="ccache i686-w64-mingw32-clang"
  export CROSSCC="ccache i686-w64-mingw32-clang"

  msg2 "Building Wine-32..."
  cd "${srcdir}"/"${pkgname}"-32-build || _failure
  ../"${pkgname}"/configure \
    "${_sharedopts[@]}" \
    "${_wine32opts[@]}" \
    --with-mingw="ccache i686-w64-mingw32-clang"

  make -j$(($(nproc) + 1))
}

build() {
  _sharedopts=(
    --prefix=/opt/"${pkgname}"
    --disable-tests
    --with-x
    --with-gstreamer
    --with-xattr
    --with-wayland
    --enable-silent-rules
    --without-oss
    --without-coreaudio
    --without-cups
    --without-sane
  )

  local _old_SOURCE_DATE_EPOCH="$SOURCE_DATE_EPOCH"

  export SOURCE_DATE_EPOCH=0

  if [ -n "${wow64build}" ]; then
    buildwow64
  else
    buildregular
  fi

  export SOURCE_DATE_EPOCH="$_old_SOURCE_DATE_EPOCH"
}

package() { _set_vars;
  if [ -z "${wow64build}" ]; then
    msg2 "Packaging Wine-32..."
    cd "${srcdir}"/$pkgname-32-build || _failure
    make -j$(($(nproc) + 1)) \
      prefix="${pkgdir}"/opt/"${pkgname}" \
      libdir="${pkgdir}"/opt/"${pkgname}"/lib \
      dlldir="${pkgdir}"/opt/"${pkgname}"/lib/wine install
  fi

  msg2 "Packaging Wine-64..."
  cd "${srcdir}"/$pkgname-64-build || _failure
  make -j$(($(nproc) + 1)) \
    prefix="${pkgdir}"/opt/"${pkgname}" \
    libdir="${pkgdir}"/opt/"${pkgname}"/lib64 \
    dlldir="${pkgdir}"/opt/"${pkgname}"/lib64/wine install

  ## Font aliasing settings for Win32 applications
  if ! [ -e "/usr/share/fontconfig/conf.avail/30-win32-aliases.conf" ] && ! [ -e "/usr/share/fontconfig/conf.default/30-win32-aliases.conf" ]; then
    install -d "${pkgdir}"/usr/share/fontconfig/conf.{avail,default}
    install -m644 "${srcdir}"/30-win32-aliases.conf "${pkgdir}/usr/share/fontconfig/conf.avail"
    ln -s ../conf.avail/30-win32-aliases.conf "${pkgdir}/usr/share/fontconfig/conf.default/30-win32-aliases.conf"
  fi

  ## Install wine binary format
  if ! [ -e "/usr/lib/binfmt.d/wine.conf" ]; then
    install -Dm 644 "${srcdir}"/wine-binfmt.conf "${pkgdir}/usr/lib/binfmt.d/wine.conf"
  fi

  ## Strip libs
  msg2 "Stripping unneeded symbols from libraries"

  find "${pkgdir}"/opt/"${pkgname}"/lib{,64} \
    -type f '(' -iname '*.a' -or -iname '*.dll' -or -iname '*.so' -or -iname '*.sys' -or -iname '*.drv' -or -iname '*.exe' ')' \
    -print0 \
    | xargs -0 /usr/bin/strip --strip-unneeded &>/dev/null || true

  ## Force our wine to use its own libraries
  mv "${pkgdir}"/opt/"${pkgname}"/bin/{wine,_wine}
  
  if [ -n "${wow64build}" ]; then
    ## Use libgcc from gcc-latest
    ln -sf "${pkgdir}"/opt/"${pkgname}"/bin/_wine "${pkgdir}"/opt/"${pkgname}"/bin/_wine64
    cp -r "${_where}"/gcc-latest/lib64/* "${pkgdir}"/opt/"${pkgname}"/lib64/wine/x86_64-unix/
  else
    mv "${pkgdir}"/opt/"${pkgname}"/bin/{wine64,_wine64}
  fi

  cp "${srcdir}"/winestart "${pkgdir}"/opt/"${pkgname}"/bin/wine
  cp "${srcdir}"/winestart "${pkgdir}"/opt/"${pkgname}"/bin/wine64
  chmod +x "${pkgdir}"/opt/"${pkgname}"/bin/wine{,64}

  ## Clean patchlog dirnames and add to package
  sed -i "s|${_where}\/||g" "${_where}"/patchlog.txt

  cp "${_where}"/patchlog.txt "${pkgdir}"/opt/"${pkgname}"
}

exit_cleanup() {
  if [ "$_cleanbuildfolders" = "true" ]; then
    # Remove temporarily copied patches & other potential fluff
    msg2 "_cleanbuildfolders=true, removing src and package folders."
    rm -rf "${_where}"/{src,pkg}
  fi
}

# shellcheck disable=SC2120
_failure() {
  if [ -n "$*" ]; then msg "$*"; fi
  error "Exiting."
  exit 1
}

trap exit_cleanup EXIT
