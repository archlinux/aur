# shellcheck disable=SC2148,SC2154,SC2034

# Maintainer: William Horvath <william at horvath dot blog>

_where="${startdir:-$(pwd)}"

# true: generic build; false: AUR native build (default); shouldn't need to touch this
_generic_release=false
if [ "${_generic_release}" = "true" ]; then
  PKGEXT='.pkg.tar.xz'
  COMPRESSXZ=(xz -9 -c -z - --threads=0)
  _CPU_TARGET="-march=x86-64 -mtune=generic"
else
  _CPU_TARGET="-march=native -mtune=native"
fi

wow64build=$(cat "${_where}/buildiswow64" || _failure "how")

################################################################################################################################
################################################################################################################################
### OPTIONS
################################################################################################################################
################################################################################################################################

_disabled_staging="-W user32-Mouse_Message_Hwnd" ## e.g. "-W Compiler_Warnings -W user32-. . ."

## main AUR version control setting, wine/staging base will be taken from this if custompatches=false (default)
_patchbase_tag="07-06-2024-6f2466ea-0e802db6"

## to use this, set this to true, create a "custompatches" folder in the top-level PKGBUILD directory, and place your patches there.
## the patches from the wine-osu-patches git repo will no longer be applied, but you can copy them to the custompatches folder
## manually if you wish to use them alongside your own patches.
## also recommended to set _desired_wine_commit and _desired_staging_commit if this is used (see below)
_custompatches=false

## uses wine/staging master if empty, uses given commit or tag if set
## only applies if _custompatches is true, otherwise overwritten by upstream commits from patchbase repo
_desired_wine_commit=6f2466ea0c20245955d0d2b13b5162a1fe62815b
_desired_staging_commit=0e802db66f4e3129ab2ab287c9202be29c5502ef

_strip_package=true
_install_static=true ## .a libs which may be required for external programs such as winestreamproxy

_autoupdate=false ## not functional yet

_cleanbuildfolders=false ## removes src, pkg folders on exit (both failure and success)

################################################################################################################################
################################################################################################################################

if [ "${_custompatches}" != "true" ]; then _custompatches= ; fi
if [ "$wow64build" = "true" ]; then _wowname="-wow64"; else _wowname=""; fi

pkgname=wine-osu-spectator"${_wowname}"

pkgver=9.12
# workaround for pkgrel overwritten by pkgver() (taken from TkG PKGBUILD), real is the eval one
pkgrel=1
eval pkgrel=3

pkgdesc="A compatibility layer for running Windows programs, but with osu! specific patches"
if [ "$wow64build" = "true" ]; then pkgdesc+=" (WoW64 version)"; fi

provides=(wine-osu-spectator"${_wowname}")
conflicts=(wine-osu-spectator"${_wowname}")

install=wine.install
url="http://www.winehq.com"
arch=(x86_64)
license=(LGPL)

options=('!buildflags' '!staticlibs' 'ccache' '!lto' '!debug' '!strip')

source=(
  "winestart"
  "30-win32-aliases.conf"
  "wine-binfmt.conf"
  "buildiswow64"
  "git+https://github.com/wine-mirror/wine.git#commit=${_desired_wine_commit:-master}"
  "git+https://github.com/wine-staging/wine-staging.git#commit=${_desired_staging_commit:-master}"
)

sha512sums=(
  'dc115ccc8d64afc213d2860a2f3516c31aa2891cd1005498123d86e7e44e0fcf876fbc68c89b201ce5291a12127cb7ff478e9374dbd2512b5d094802780be160'
  '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb'
  'bdde7ae015d8a98ba55e84b86dc05aca1d4f8de85be7e4bd6187054bfe4ac83b5a20538945b63fb073caab78022141e9545685e4e3698c97ff173cf30859e285'
  'SKIP'
  'SKIP'
  'SKIP'
)
noextract=()

## don't needlessly add the wine-osu-patches repo if we explicitly specify custom ones
if ! { [ -d "${_where}"/custompatches ] && [ "${_custompatches}" = "true" ] ; }; then
  source+=("git+https://github.com/whrvt/wine-osu-patches.git#tag=${_patchbase_tag}")
  sha512sums+=('SKIP')

  ## didn't have a custompatches dir
  _custompatches=
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
)

makedepends=(autoconf bison ccache perl fontforge flex
  gcc
  clang
  llvm-libs
  llvm-mingw-w64-toolchain
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
  libvulkan.so=1-64
  samba
  opencl-headers
  nasm
  attr
  gst-plugins-base-libs
  gtk3
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
  vkd3d
  sdl2
  libgphoto2
  sane
  gsm
  cups
  samba dosbox
)

if [ "${wow64build}" != "true" ]; then
  depends+=(lib32-fontconfig lib32-lcms2 lib32-libxml2 lib32-libxcursor lib32-libxrandr lib32-libxdamage lib32-libxi lib32-gettext lib32-freetype2 lib32-glu lib32-libsm lib32-gcc-libs lib32-libpcap)
  makedepends+=(lib32-gtk3 lib32-attr lib32-libxkbcommon lib32-llvm-libs libvulkan.so=1-32 lib32-giflib lib32-libpng lib32-gnutls lib32-libxinerama lib32-libxcomposite lib32-libxmu lib32-libxxf86vm lib32-libldap lib32-mpg123 lib32-openal lib32-v4l-utils lib32-libpulse lib32-alsa-lib lib32-gst-plugins-base-libs lib32-libxcomposite lib32-mesa lib32-mesa-libgl lib32-opencl-icd-loader lib32-libxslt lib32-sdl2 lib32-libcups)
  optdepends+=(lib32-giflib lib32-libpng lib32-libldap lib32-gnutls lib32-mpg123 lib32-openal lib32-v4l-utils lib32-libpulse lib32-alsa-plugins lib32-alsa-lib lib32-libjpeg-turbo lib32-libxcomposite lib32-libxinerama lib32-opencl-icd-loader lib32-libxslt lib32-vkd3d lib32-sdl2)
fi

makedepends=("${makedepends[@]}" "${depends[@]}")

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags --abbrev=0 | cut -f2 -d'-'
}

# exported at the start of every function
_set_vars() {
  export build64dir="${_where}/src/${pkgname}-64-build"
  export build32dir="${_where}/src/${pkgname}-32-build"

  export PATH="/opt/llvm-mingw/bin":"${PATH}"

  export CPPFLAGS="-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=0 -DNDEBUG -D_NDEBUG"
  _common_cflags="${_CPU_TARGET} -O3 -pipe -fno-strict-aliasing -fomit-frame-pointer -fwrapv -Wno-error=incompatible-pointer-types -Wno-error=implicit-function-declaration -Wno-error=return-mismatch -Wno-error=int-conversion -w"

  _LTO_FLAGS="-fuse-linker-plugin -fdevirtualize-at-ltrans -flto-partition=one -ffat-lto-objects -flto -Wl,-flto"
  #_GRAPHITE_FLAGS="-floop-nest-optimize -fgraphite-identity -floop-strip-mine"
  #_OPTIMIZE_HARDER_FLAGS="-fipa-pta -fgcse-sm -fgcse-las -fira-loop-pressure -fsched-pressure -fsched-spec-load"

  _native_common_cflags="${_LTO_FLAGS}" # only for the non-mingw side

  _GCC_FLAGS="${_common_cflags} ${_native_common_cflags} ${CPPFLAGS}"
  _LD_FLAGS="${_GCC_FLAGS} -Wl,-O2,--sort-common,--as-needed"

  _CROSS_FLAGS="${_common_cflags} ${CPPFLAGS} -L/opt/llvm-mingw/lib -I/opt/llvm-mingw/include -I/opt/llvm-mingw/lib/clang/${__llvm_ver}/include -I/opt/llvm-mingw/generic-w64-mingw32/include -L/opt/llvm-mingw/x86_64-w64-mingw32/lib -L/opt/llvm-mingw/i686-w64-mingw32/lib -L/opt/llvm-mingw/lib/clang/${__llvm_ver}/lib/windows"
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
  if [ "${_where}/src" != "${srcdir}" ]; then _failure "Something weird is going on with your PKGBUILD's path, exiting early to avoid tampering with your files."; fi
  cd "${_where}" || _failure

  ## Removes pkg dir if already existing
  rm -rf "${_where}"/pkg || true

  ## Source base re-configuration

  _desired_wine_commit=${_desired_wine_commit:-master}
  _desired_staging_commit=${_desired_staging_commit:-master}

  if [ "${_custompatches}" != "true" ]; then
    _patchbase_wine_commit=$(cat "${srcdir}"/wine-osu-patches/wine-commit)
    _patchbase_staging_commit=$(cat "${srcdir}"/wine-osu-patches/staging-commit)
    if [ "${_autoupdate}" != "true" ]; then
      _desired_wine_commit=$_patchbase_wine_commit
      _desired_staging_commit=$_patchbase_staging_commit
    fi
  else
    msg "Using custom patches"
  fi

  ## Mainline setup

  ## Rename our working copy of the wine source
  mv "${srcdir}"/wine "${srcdir}"/"${pkgname}" || _failure

  if [ "${_autoupdate}" != "true" ]; then
    cd "${srcdir}"/"${pkgname}" || _failure
    git reset --hard "${_desired_wine_commit}" || _failure

    if [ "${_custompatches}" = "true" ]; then
      _patchbase_wine_commit=$(git rev-parse HEAD)
    fi

    sed -i "s/^_desired_wine_commit=.*$/_desired_wine_commit=${_patchbase_wine_commit}/g" "${_where}/PKGBUILD"
    cd "${srcdir}" || _failure
  fi

  msg2 "Wine mainline at: $_patchbase_wine_commit"

  ## Staging setup

  if [ "${_autoupdate}" != "true" ]; then
    cd "${srcdir}"/wine-staging || _failure
    git reset --hard "${_desired_staging_commit}" || _failure

    if [ "${_custompatches}" = "true" ]; then
      _patchbase_staging_commit=$(git rev-parse HEAD)
    fi

    sed -i "s/^_desired_staging_commit=.*$/_desired_staging_commit=${_patchbase_staging_commit}/g" "${_where}/PKGBUILD"
    cd "${srcdir}" || _failure
  fi

  msg2 "Wine staging at: $_patchbase_staging_commit"

  cd "${srcdir}" || _failure

  ## Patching setup

  touch "${_where}"/patchlog.txt || _failure
  printf "Wine commit:%s\nStaging commit:%s\n" "${_desired_wine_commit}" "${_desired_staging_commit}" > "${_where}"/patchlog.txt

  ## Apply wine-staging patchset

  msg2 "Applying staging patches"
  printf "\nApplying staging patches\n\n" >> "${_where}"/patchlog.txt
  pushd wine-staging/staging >/dev/null || _failure
  # shellcheck disable=SC2086
  ./patchinstall.py DESTDIR="${srcdir}"/"${pkgname}" --all $_disabled_staging &>> "${_where}"/patchlog.txt || \
      _failure "Error applying staging patches, check patchlog.txt for info."
  popd >/dev/null || _failure

  ## Applying patches

  if [ "${_custompatches}" = "true" ]; then
    if ! [ -d "${_where}/custompatches" ]; then _failure "_custompatches=true but custompatches directory not found."; fi
    patchdir="${_where}/custompatches"
    echo -n "${_desired_wine_commit}" > "${patchdir}/wine-commit"
    echo -n "${_desired_staging_commit}" > "${patchdir}/staging-commit"
  else
    patchdir="${srcdir}/wine-osu-patches"
  fi

  printf "\nApplying other patches\n\n" >> "${_where}"/patchlog.txt
  cd "${srcdir}"/"${pkgname}" || _failure

  for patch in $(find "${patchdir}" -type f -regex ".*\.patch" | LC_ALL=C sort -f); do
    shortname="${patch#"${patchdir}/"}"
    printf "\nApplying %s\n\n" "${shortname}" >> "${_where}"/patchlog.txt
    msg2 "Applying '${shortname}'"
    patch -Np1 <"${patch}" &>> "${_where}"/patchlog.txt || \
        _failure "An error occurred applying ${_custompatches:+custompatches/}${shortname}, check patchlog.txt for info."
  done

  ## make tools/make_makefiles happy
  git config user.email "wine@build.dev" &>/dev/null || true
  git config user.name "winebuild" &>/dev/null || true
  git add --all &>/dev/null || true
  git commit --allow-empty -m "makepkg" &>/dev/null || true

  chmod +x tools/make_makefiles
  tools/make_makefiles
  chmod +x tools/make_requests
  tools/make_requests
  if [ -e tools/make_specfiles ]; then
    chmod +x tools/make_specfiles
    tools/make_specfiles
  fi
  autoreconf -fiv
}

_build() { _set_vars;
  cd "${srcdir}" || _failure

  rm -rf "${build64dir}" || true
  mkdir "${build64dir}"

  export PKG_CONFIG_LIBDIR=/opt/llvm-mingw/x86_64-w64-mingw32/lib/pkgconfig:/usr/lib/pkgconfig
  export PKG_CONFIG_PATH=$PKG_CONFIG_LIBDIR:$PKG_CONFIG_PATH_CUSTOM

  export x86_64_CC="ccache x86_64-w64-mingw32-clang"
  export CROSSCC="ccache x86_64-w64-mingw32-clang"
  
  msg2 "Building Wine-64"
  cd "${build64dir}" || _failure
  ../"${pkgname}"/configure \
    "${_sharedopts[@]}" \
    "${_wine64opts[@]}" || _failure "Wine-64 configure failed; check ${build64dir}/config.log for more information"

  make -j$(($(nproc) + 1)) || _failure "Compilation failed"

  ## don't build lib32 for wow64 builds
  if [ "${wow64build}" = "true" ]; then return 0; fi

  rm -rf "${build32dir}" || true
  mkdir "${build32dir}"

  export PKG_CONFIG_LIBDIR=/opt/llvm-mingw/i686-w64-mingw32/lib/pkgconfig:/usr/lib32/pkgconfig
  export PKG_CONFIG_PATH=$PKG_CONFIG_LIBDIR:$PKG_CONFIG_PATH_CUSTOM

  export i386_CC="ccache i686-w64-mingw32-clang"
  export CROSSCC="ccache i686-w64-mingw32-clang"

  # fsync doesn't compile on i386 due to undefined atomic ops otherwise (clang only, ntdll.so)
  if [[ "${CC}" =~ "clang" ]]; then
    export I386_LIBS="-latomic"
  fi

  msg2 "Building Wine-32"
  cd "${build32dir}" || _failure
  ../"${pkgname}"/configure \
    "${_sharedopts[@]}" \
    "${_wine32opts[@]}" || _failure "Wine-32 configure failed; check ${build32dir}/config.log for more information"

  make -j$(($(nproc) + 1)) || _failure "Compilation failed"
}

build() { _set_vars;
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

  _wine64opts=(
    --libdir=/opt/"${pkgname}"/lib64
    --with-mingw="ccache x86_64-w64-mingw32-clang"
  )

  if [ "${wow64build}" = "true" ]; then
    _wine64opts+=(--enable-archs="x86_64,i386")
  else
    _wine64opts+=(--enable-win64)

    _wine32opts=(
      --libdir=/opt/"${pkgname}"/lib
      --with-wine64="${build64dir}"
      --with-mingw="ccache i686-w64-mingw32-clang" 
    )
  fi

  local _old_SOURCE_DATE_EPOCH="$SOURCE_DATE_EPOCH"
  export SOURCE_DATE_EPOCH=0

  _build

  export SOURCE_DATE_EPOCH="$_old_SOURCE_DATE_EPOCH"
}

package() { _set_vars;
  if [ "${_install_static}" = "true" ]; then
    _installtype="install"
  else
    _installtype="install-lib"
  fi

  if [ "${wow64build}" != "true" ]; then
    msg2 "Packaging Wine-32"
    cd "${build32dir}" || _failure
    make -j$(($(nproc) + 1)) \
      prefix="${pkgdir}"/opt/"${pkgname}" \
      libdir="${pkgdir}"/opt/"${pkgname}"/lib \
      dlldir="${pkgdir}"/opt/"${pkgname}"/lib/wine $_installtype || _failure "Wine-32 installation failed"
  fi

  msg2 "Packaging Wine-64"
  cd "${build64dir}"|| _failure
  # clang doesn't like static libs on lib64 for some reason, use gcc
  make -j$(($(nproc) + 1)) \
    CC="ccache gcc" CXX="ccache g++" \
    prefix="${pkgdir}"/opt/"${pkgname}" \
    libdir="${pkgdir}"/opt/"${pkgname}"/lib64 \
    dlldir="${pkgdir}"/opt/"${pkgname}"/lib64/wine $_installtype || _failure "Wine-64 installation failed"

  ## Font aliasing settings for Win32 applications
  install -d "${pkgdir}"/usr/share/fontconfig/conf.{avail,default}
  install -m644 "${srcdir}"/30-win32-aliases.conf "${pkgdir}"/usr/share/fontconfig/conf.avail/30-win32-aliases"${_wowname}"-spec.conf
  ln -s ../conf.avail/30-win32-aliases.conf "${pkgdir}"/usr/share/fontconfig/conf.default/30-win32-aliases"${_wowname}"-spec.conf

  ## Install wine binary format
  install -Dm 644 "${srcdir}"/wine-binfmt.conf "${pkgdir}"/usr/lib/binfmt.d/wine"${_wowname}"-spec.conf

  if [ "${_strip_package}" = "true" ]; then
    msg2 "Stripping unneeded symbols from libraries"

    find "${pkgdir}"/opt/"${pkgname}"/lib{,64} \
      -type f '(' -iname '*.a' -or -iname '*.dll' -or -iname '*.so' -or -iname '*.sys' -or -iname '*.drv' -or -iname '*.exe' ')' \
      -print0 \
      | xargs -0 /usr/bin/strip --strip-unneeded &>/dev/null || true
  fi

  if [ "${wow64build}" = "true" ]; then
    ln -sf /opt/"${pkgname}"/bin/wine "${pkgdir}"/opt/"${pkgname}"/bin/wine64
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

# this is a bit hideous, what could go wrong?
__llvm_ver="$(env ls -1 /opt/llvm-mingw/lib/clang/)" || \
  _failure "A numbered folder in /opt/llvm-mingw/lib/clang/ wasn't found. Are you sure you have the llvm-mingw toolchain installed?"

trap exit_cleanup EXIT
