# Maintainer: William Horvath <william at horvath dot blog>

_where="${PWD:-$(pwd)}"

################################################################################################################################
################################################################################################################################
### OPTIONS
################################################################################################################################
################################################################################################################################

wow64build=".wow64" ## set to nothing (empty) to make a non-wow64 build
if [ -n "$wow64build" ]; then _wowname="wow64-"; else _wowname=""; fi

## these will do nothing if _autoupdate=false (default), the base is taken from the patch repo
_wine_commit=8c64979dcb2673659adacf39733e24d42b7fc01d
_staging_commit=5ecb89298f735f22264e7f201f827be37dcd7621

_cleanbuildfolders=false
_autoupdate=false
_disabled_staging="" ## e.g. "-W Compiler_Warnings -W user32-. . ."
_bundled_src=false ## unused for this pkgbuild

_userpatches=false ## unimplemented for now

################################################################################################################################
################################################################################################################################

pkgname=wine-osu-spectator-${_wowname}bin
pkgver=9.11${wow64build:-}
pkgrel=1

pkgdesc="A compatibility layer for running Windows programs, but with osu! specific patches"
provides=(wine-osu-spectator-${_wowname}bin)
conflicts=(wine-osu-spectator-${_wowname}bin)

install=wine.install
url="http://www.winehq.com"
arch=(x86_64)
license=(LGPL ISC)

options=('!buildflags' 'staticlibs' 'ccache' '!lto' '!debug' '!strip')

source=(
  git+https://github.com/whrvt/wine-osu-patches.git#tag=06-20-2024-8c64979d-5ecb8929
  winestart # wow64 gcc-latest LD_LIBRARY_PATH shenanigans, LD_RUN_PATH and other methods did not seem to work
  30-win32-aliases.conf
  wine-binfmt.conf

  https://github.com/mstorsjo/llvm-mingw/releases/download/nightly/llvm-mingw-nightly-ucrt-ubuntu-20.04-x86_64.tar.xz
  https://kayari.org/gcc-latest/gcc-latest.deb # only used for wow64 builds
)

sha512sums=('9fd04c1b52de080d828e1c24783ab758ab7d68fb8bb44e701d536d9bc815dbbdc67bc69aab26993488cbc5fc2f80c65c9a257d7b4d321fb58ad190bd1433a8c5'
            'cfc2ee43b1409096d64340ca62694393152baea28dc9e1df6f76b2ab8129e737bb916b0f1d36bf437da777a3bd1a9cb0529079439aecbc5b2c37645ea6d55bdf'
            '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb'
            'bdde7ae015d8a98ba55e84b86dc05aca1d4f8de85be7e4bd6187054bfe4ac83b5a20538945b63fb073caab78022141e9545685e4e3698c97ff173cf30859e285'
            'SKIP' 'SKIP')

noextract=(gcc-latest.deb)

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

makedepends=(${makedepends[@]} ${depends[@]})

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
    _GLIBC_LIBS=""
    _GLIBC_LIBS_NATIVE=""
  fi

  export CPPFLAGS="-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=0 -DNDEBUG -D_NDEBUG"
  _common_cflags="${_GLIBC_LIBS_COMMON} -march=x86-64 -mtune=native -O2 -pipe -fno-semantic-interposition -fno-strict-aliasing -fomit-frame-pointer -fwrapv -Wno-error=incompatible-pointer-types -Wno-error=implicit-function-declaration -Wno-error=return-mismatch -Wno-error=int-conversion -w"

  _LTO_FLAGS="-flto -fdevirtualize-at-ltrans -flto-partition=one -Wl,-flto"
  #_GCC_NATIVE_FLAGS="-floop-nest-optimize -fgraphite-identity -floop-strip-mine " # gcc-latest is not compiled with libisl which is needed for graphite, but not currently used
  #_OPTIMIZE_HARDER_FLAGS="-fipa-pta -fgcse-sm -fgcse-las -fira-loop-pressure -fsched-pressure -fsched-spec-load" # not currently used
  _native_common_cflags="${_LTO_FLAGS} ${_GLIBC_LIBS_NATIVE}"

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
  cd "${_where}"

  ## removes pkg dir if already existing
  rm -rf "${_where}"/pkg || true 

  ## rename downloaded llvm-mingw
  mv "${srcdir}"/llvm-mingw-nightly-ucrt-ubuntu-20.04-x86_64 "${srcdir}"/llvm-mingw

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

  if [ "${_bundled_src}" != "true" ]; then # skip this stuff if we are using bundled
    ## removes wine/staging dirs if already existing
    rm -rf "${srcdir}"/{${pkgname:?},wine-staging} || true

    _wine_commit=$(cat "${srcdir}"/wine-osu-patches/wine-commit)
    _staging_commit=$(cat "${srcdir}"/wine-osu-patches/staging-commit)

    ## Mainline setup

    if ! [ -d "${_where}"/wine ]; then
      cd "${_where}"
      git clone https://github.com/wine-mirror/wine.git
    fi

    cd "${_where}"/wine
    git pull

    if [ "$_autoupdate" != "true" ]; then
      git reset --hard $_wine_commit
    fi

    _currcommit=$(git rev-parse HEAD)

    if [ "$_currcommit" != "$_wine_commit" ]; then
      msg2 "Wine mainline updated to: $_currcommit"
      sed -i "s/^_wine_commit=$_wine_commit$/_wine_commit=$_currcommit/g" "${_where}"/PKGBUILD
    else
      msg2 "Wine mainline at: $_currcommit"
    fi

    ## Staging setup

    if ! [ -d "${_where}"/wine-staging ]; then
      cd "${_where}"
      git clone https://github.com/wine-staging/wine-staging.git
    fi

    cd "${_where}"/wine-staging
    git pull

    if [ "$_autoupdate" != "true" ]; then
      git reset --hard $_staging_commit
    fi

    _currcommit=$(git rev-parse HEAD)

    if [ "$_currcommit" != "$_staging_commit" ]; then
      msg2 "Wine staging updated to: $_currcommit"
      sed -i "s/^_staging_commit=$_staging_commit$/_staging_commit=$_currcommit/g" "${_where}"/PKGBUILD
    else
      msg2 "Wine staging at: $_currcommit"
    fi

    cd "${_where}"
    cp -r "${_where}"/wine "${srcdir}"/"${pkgname}"
    cp -r "${_where}"/wine-staging "${srcdir}"/
    cd "${srcdir}"

    ## apply wine-staging patchset

    pushd wine-staging/staging
    ./patchinstall.py DESTDIR="${srcdir}/${pkgname}" --all $_disabled_staging
    popd
  
  fi # end ! _bundled_src

  ## Applying patches
  touch "${_where}"/patchlog.txt && printf "Patches applied:\n\n" > "${_where}"/patchlog.txt

  cd "${srcdir}"/"${pkgname}"
  for patch in $(find "${srcdir}/wine-osu-patches" -type f -regex ".*\.patch" | sort); do
    shortname="${patch#"${srcdir}/wine-osu-patches/"}"
    printf "\nApplying '${shortname}'\n\n" >> "${_where}"/patchlog.txt
    msg2 "Applying '${shortname}'"
    patch -Np1 <"${patch}" >> "${_where}"/patchlog.txt
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

  cd "${srcdir}"

  ## Deleting old build directories (if existing)
  if [ -z "${wow64build}" ]; then rm -rf $pkgname-32-build || true; mkdir $pkgname-32-build; fi
  rm -rf $pkgname-64-build || true
  mkdir $pkgname-64-build
}

buildwow64() { _set_vars;
  cd "${srcdir}"

  export PKG_CONFIG_LIBDIR=${srcdir}/llvm-mingw/x86_64-w64-mingw32/lib/pkgconfig:/usr/lib/pkgconfig:${srcdir}/llvm-mingw/i686-w64-mingw32/lib/pkgconfig:/usr/lib32/pkgconfig
  export PKG_CONFIG_PATH=$PKG_CONFIG_LIBDIR:$PKG_CONFIG_PATH_CUSTOM

  export x86_64_CC="ccache x86_64-w64-mingw32-clang"
  export CROSSCC="ccache x86_64-w64-mingw32-clang"

  export SOURCE_DATE_EPOCH=0

  msg2 "Building Wine-64..."
  cd "$srcdir/$pkgname-64-build"
  ../$pkgname/configure \
    --libdir=/opt/$pkgname/lib64 \
    --enable-archs=x86_64,i386 \
    --with-mingw="ccache x86_64-w64-mingw32-clang" \
    "${_sharedopts[@]}"

  make -j$(($(nproc) + 1))
}

buildregular() { _set_vars;
  cd "${srcdir}"

  export PKG_CONFIG_LIBDIR=${srcdir}/llvm-mingw/x86_64-w64-mingw32/lib/pkgconfig:/usr/lib/pkgconfig
  export PKG_CONFIG_PATH=$PKG_CONFIG_LIBDIR:$PKG_CONFIG_PATH_CUSTOM

  export SOURCE_DATE_EPOCH=0

  msg2 "Building Wine-64..."
  cd "$srcdir/$pkgname-64-build"
  ../$pkgname/configure \
    --libdir=/opt/$pkgname/lib64 \
    --enable-win64 \
    "${_sharedopts[@]}" \
    --with-mingw="ccache x86_64-w64-mingw32-clang" 

  make -j$(($(nproc) + 1))

  _wine32opts=(
    --libdir=/opt/$pkgname/lib
    --with-wine64="$srcdir/$pkgname-64-build"
  )

  export PKG_CONFIG_LIBDIR=${srcdir}/llvm-mingw/i686-w64-mingw32/lib/pkgconfig:/usr/lib32/pkgconfig
  export PKG_CONFIG_PATH=$PKG_CONFIG_LIBDIR:$PKG_CONFIG_PATH_CUSTOM

  export i386_CC="ccache i686-w64-mingw32-clang"
  export CROSSCC="ccache i686-w64-mingw32-clang"

  export SOURCE_DATE_EPOCH=0

  msg2 "Building Wine-32..."
  cd "$srcdir/$pkgname-32-build"
  ../$pkgname/configure \
    "${_sharedopts[@]}" \
    "${_wine32opts[@]}" \
    --with-mingw="ccache i686-w64-mingw32-clang"

  make -j$(($(nproc) + 1))
}

build() {
  _sharedopts=(
    --prefix=/opt/$pkgname
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

  if [ -n "${wow64build}" ]; then
    buildwow64
  else 
    buildregular
  fi
}

package() { _set_vars;
  if [ -z "${wow64build}" ]; then
    msg2 "Packaging Wine-32..."
    cd "$srcdir/$pkgname-32-build"
    make -j$(($(nproc) + 1)) \
      prefix="$pkgdir/opt/$pkgname" \
      libdir="$pkgdir/opt/$pkgname/lib" \
      dlldir="$pkgdir/opt/$pkgname/lib/wine" install
  fi

  msg2 "Packaging Wine-64..."
  cd "$srcdir/$pkgname-64-build"
  make -j$(($(nproc) + 1)) \
    prefix="$pkgdir/opt/$pkgname" \
    libdir="$pkgdir/opt/$pkgname/lib64" \
    dlldir="$pkgdir/opt/$pkgname/lib64/wine" install

  ## Font aliasing settings for Win32 applications
  if ! [ -e "/usr/share/fontconfig/conf.avail/30-win32-aliases.conf" ] && ! [ -e "/usr/share/fontconfig/conf.default/30-win32-aliases.conf" ]; then
    install -d "${pkgdir}"/usr/share/fontconfig/conf.{avail,default}
    install -m644 "$srcdir/30-win32-aliases.conf" "${pkgdir}/usr/share/fontconfig/conf.avail"
    ln -s ../conf.avail/30-win32-aliases.conf "${pkgdir}/usr/share/fontconfig/conf.default/30-win32-aliases.conf"
  fi

  ## Install wine binary format
  if ! [ -e "/usr/lib/binfmt.d/wine.conf" ]; then
    install -Dm 644 "$srcdir/wine-binfmt.conf" "${pkgdir}/usr/lib/binfmt.d/wine.conf"
  fi

  ## Strip libs
  for _f in $(find "${pkgdir}"/opt/"${pkgname}"/lib{,64} -type f '(' -iname '*.a' -or -iname '*.dll' -or -iname '*.so' -or -iname '*.sys' -or -iname '*.drv' -or -iname '*.exe' ')'); do
    /usr/bin/strip --strip-unneeded "$_f" &>/dev/null && msg2 "${_f#"${_where}/pkg/${pkgname}"} stripped"
  done

  ## Force wine to use gcc-latest libraries (wow64)
  if [ -n "${wow64build}" ]; then
    mv $pkgdir/opt/$pkgname/bin/wine{,32}
    cp "${srcdir}"/winestart "$pkgdir/opt/$pkgname/bin/wine"
    chmod +x "$pkgdir/opt/$pkgname/bin/wine"

    ln -sf "$pkgdir/opt/$pkgname/bin/wine" "$pkgdir/opt/$pkgname/bin/wine64"
    cp -r "${_where}"/gcc-latest/lib64/* "$pkgdir/opt/$pkgname/lib64/wine/x86_64-unix/"
  fi

  cp "${_where}"/patchlog.txt "$pkgdir/opt/$pkgname"
}

exit_cleanup() {
  if [ "$_cleanbuildfolders" = "true" ]; then
    # Remove temporarily copied patches & other potential fluff
    msg2 "_cleanbuildfolders=true, removing src and package folders."
    rm -rf "${_where}"/{src,pkg}
  fi
}

trap exit_cleanup EXIT
