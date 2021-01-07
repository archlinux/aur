# Maintainer: loathingkernel <loathingkernel _a_ gmail _d_ com>

pkgname=proton-ge-custom
_srctag=6.0-GE-rc1 
_commit=58620b9250f1925ba1d89b1ace51a22d631a3694
pkgver=${_srctag//-/.}
_geckover=2.47.1
_monover=5.1.1
pkgrel=1
epoch=1
pkgdesc="Compatibility tool for Steam Play based on Wine and additional components. GloriousEggroll's custom build"
arch=(x86_64)
url="https://github.com/GloriousEggroll/proton-ge-custom"
license=('custom')
depends=(
  fontconfig      lib32-fontconfig
  lcms2           lib32-lcms2
  libxml2         lib32-libxml2
  libxcursor      lib32-libxcursor
  libxrandr       lib32-libxrandr
  libxdamage      lib32-libxdamage
  libpulse        lib32-libpulse
  gsm             lib32-gsm
  libxi           lib32-libxi
  gettext         lib32-gettext
  freetype2       lib32-freetype2
  glu             lib32-glu
  libsm           lib32-libsm
  gcc-libs        lib32-gcc-libs
  libpcap         lib32-libpcap
  desktop-file-utils
  python
  steam-native-runtime
)
makedepends=(autoconf ncurses bison perl fontforge flex mingw-w64-gcc
  meson
  cargo
  rust                  lib32-rust-libs
  giflib                lib32-giflib
  libpng                lib32-libpng
  gnutls                lib32-gnutls
  libxinerama           lib32-libxinerama
  libxcomposite         lib32-libxcomposite
  libxmu                lib32-libxmu
  libxxf86vm            lib32-libxxf86vm
  libldap               lib32-libldap
  mpg123                lib32-mpg123
  openal                lib32-openal
  v4l-utils             lib32-v4l-utils
  libpulse              lib32-libpulse
  alsa-lib              lib32-alsa-lib
  libxcomposite         lib32-libxcomposite
  mesa                  lib32-mesa
  mesa-libgl            lib32-mesa-libgl
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  sdl2                  lib32-sdl2
  libgphoto2
  sane
  gsm
  vulkan-headers
  samba
  opencl-headers
  git
  cmake
  python-virtualenv
  nasm
  glslang
)
optdepends=(
  giflib                lib32-giflib
  libpng                lib32-libpng
  libldap               lib32-libldap
  gnutls                lib32-gnutls
  mpg123                lib32-mpg123
  openal                lib32-openal
  v4l-utils             lib32-v4l-utils
  alsa-plugins          lib32-alsa-plugins
  alsa-lib              lib32-alsa-lib
  libjpeg-turbo         lib32-libjpeg-turbo
  libxcomposite         lib32-libxcomposite
  libxinerama           lib32-libxinerama
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  sdl2                  lib32-sdl2
  libgphoto2
  sane
  gsm
  cups
  samba           dosbox
)
makedepends=(${makedepends[@]} ${depends[@]})
#install=${pkgname}.install
source=(
    proton-ge-custom::git+https://github.com/gloriouseggroll/proton-ge-custom.git#commit=${_commit}
    wine::git://source.winehq.org/git/wine.git
    wine-staging::git+https://github.com/wine-staging/wine-staging.git
    vkd3d-proton::git+https://github.com/HansKristian-Work/vkd3d-proton.git
    dxvk::git+https://github.com/doitsujin/dxvk.git
    openvr::git+https://github.com/ValveSoftware/openvr.git
    ffmpeg::git+https://git.ffmpeg.org/ffmpeg.git
    liberation-fonts::git+https://github.com/liberationfonts/liberation-fonts.git
    SPIRV-Headers::git+https://github.com/KhronosGroup/SPIRV-Headers.git
    Vulkan-Headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git
    dxil-spirv::git+https://github.com/HansKristian-Work/dxil-spirv.git
    FAudio::git+https://github.com/FNA-XNA/FAudio.git
    protonfixes-gloriouseggroll::git+https://github.com/gloriouseggroll/protonfixes.git
    lsteamclient-gloriouseggroll::git+https://github.com/gloriouseggroll/lsteamclient.git
    vrclient_x64-gloriouseggroll::git+https://github.com/gloriouseggroll/vrclient_x64.git
    gstreamer::git+https://gitlab.freedesktop.org/gstreamer/gstreamer.git
    gst-orc::git+https://gitlab.freedesktop.org/gstreamer/orc.git
    gst-plugins-base::git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-base.git
    gst-plugins-good::git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-good.git
    gst-plugins-bad::git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad.git
    gst-plugins-ugly::git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-ugly.git
    gst-libav::git+https://gitlab.freedesktop.org/gstreamer/gst-libav.git
    https://dl.winehq.org/wine/wine-gecko/${_geckover}/wine-gecko-${_geckover}-x86{,_64}.tar.bz2
    https://github.com/madewokherd/wine-mono/releases/download/wine-mono-${_monover}/wine-mono-${_monover}-x86.tar.xz
    proton-unfuck_makefile.patch
    proton-disable_lock.patch
    proton-user_compat_data.patch
    dxvk-extraopts.patch
    vkd3d-extraopts.patch
)
noextract=(
    wine-gecko-${_geckover}-{x86,x86_64}.tar.bz2
    wine-mono-${_monover}-x86.tar.xz
)

prepare() {
    # I know this is fugly and it should NOT be done
    # but the afdko package from AUR breaks regulalry.
    # Install it from pip in a virtualenv
    virtualenv --no-wheel afdko
    source afdko/bin/activate
    pip install --no-cache-dir afdko

    [ ! -d gecko ] && mkdir gecko
    mv wine-gecko-${_geckover}-x86{,_64}.tar.bz2 gecko/

    [ ! -d mono ] && mkdir mono
    mv wine-mono-${_monover}-x86.tar.xz mono/

    [ ! -d build ] && mkdir build
    cd proton-ge-custom
    for submodule in ffmpeg openvr FAudio fonts/liberation-fonts vkd3d-proton; do
        git submodule init "${submodule}"
        git config submodule."${submodule}".url "$srcdir"/"${submodule#*/}"
        git submodule update "${submodule}"
    done

    for submodule in wine wine-staging dxvk; do
        git submodule init "${submodule}"
        git config submodule."${submodule}".url "$srcdir"/"${submodule#*/}"
        git submodule update "${submodule}"
    done

    for submodule in gstreamer gst-{plugins-{base,good,bad,ugly},libav,orc}; do
        git submodule init "${submodule}"
        git config submodule."${submodule}".url "$srcdir"/"${submodule#*/}"
        git submodule update "${submodule}"
    done

    pushd vkd3d-proton
    for submodule in subprojects/{dxil-spirv,Vulkan-Headers,SPIRV-Headers}; do
        git submodule init "${submodule}"
        git config submodule."${submodule}".url "$srcdir"/"${submodule#*/}"
        git submodule update "${submodule}"
    done
    pushd subprojects/dxil-spirv
    git submodule init third_party/spirv-headers
    git config submodule.third_party/spirv-headers.url "$srcdir"/SPIRV-Headers
    git submodule update third_party/spirv-headers
    popd
    popd

    for submodule in lsteamclient vrclient_x64 protonfixes; do
        git submodule init "${submodule}"
        git config submodule."${submodule}".url "$srcdir"/"${submodule#*/}-gloriouseggroll"
        git submodule update "${submodule}"
    done

    ./patches/protonprep-nofshack.sh

    patch -p1 -i "$srcdir"/proton-unfuck_makefile.patch
    patch -p1 -i "$srcdir"/proton-disable_lock.patch
    patch -p1 -i "$srcdir"/proton-user_compat_data.patch

    # Uncomment to enable extra optimizations
    # Patch crossfiles with extra optimizations from makepkg.conf
    patch -p1 -i "$srcdir"/dxvk-extraopts.patch
    patch -p1 -i "$srcdir"/vkd3d-extraopts.patch
    local dxvk_cflags="$CFLAGS"
    local dxvk_ldflags="$LDFLAGS"
    # Filter known bad flags before applying optimizations
    # Filter fstack-protector{ ,-all,-strong} flag for MingW.
    # https://github.com/Joshua-Ashton/d9vk/issues/476
    dxvk_cflags="${dxvk_cflags// -fstack-protector*([\-all|\-strong])/}"
    # Doesn't compile with these flags in MingW so remove them.
    # They are also filtered in Wine PKGBUILDs so remove them
    # for winelib versions too.
    dxvk_cflags="${dxvk_cflags/ -fno-plt/}"
    dxvk_ldflags="${dxvk_ldflags/,-z,now/}"
    dxvk_ldflags="${dxvk_ldflags/,-z,relro/}"
    # If using -march=native and the CPU supports AVX, launching a d3d9
    # game can cause an Unhandled exception. The cause seems to be the
    # combination of AVX instructions and tree vectorization (implied by O3),
    # all tested archictures from sandybridge to haswell are affected.
    # Disabling AVX (and AVX2 as a side-effect).
    # Since Wine 5.16 AVX is supported. Testing showed 32bit applications
    # crashing with AVX regardless, but 64bit applications worked just fine.
    # So disable AVX only for the 32bit binaries and AVX2 for the 64bit.
    # Relevant Wine issues
    # https://bugs.winehq.org/show_bug.cgi?id=45289
    # https://bugs.winehq.org/show_bug.cgi?id=43516
    dxvk64_cflags="$dxvk_cflags -mno-avx"
    dxvk32_cflags="$dxvk_cflags -mno-avx"

    sed -i dxvk/build-win64.txt \
        -e "s|@CARGS@|\'${dxvk64_cflags// /\',\'}\'|g" \
        -e "s|@LDARGS@|\'${dxvk_ldflags// /\',\'}\'|g"
    sed -i dxvk/build-win32.txt \
        -e "s|@CARGS@|\'${dxvk32_cflags// /\',\'}\'|g" \
        -e "s|@LDARGS@|\'${dxvk_ldflags// /\',\'}\'|g"
    sed -i vkd3d-proton/build-win64.txt \
        -e "s|@CARGS@|\'${dxvk64_cflags// /\',\'}\'|g" \
        -e "s|@LDARGS@|\'${dxvk_ldflags// /\',\'}\'|g"
    sed -i vkd3d-proton/build-win32.txt \
        -e "s|@CARGS@|\'${dxvk32_cflags// /\',\'}\'|g" \
        -e "s|@LDARGS@|\'${dxvk_ldflags// /\',\'}\'|g"
}

build() {
    cd build
    ../proton-ge-custom/configure.sh \
        --no-steam-runtime \
        --with-ffmpeg \
        --build-name="${pkgname}"

    # Use -mno-avx for wine too
    # https://bugs.winehq.org/show_bug.cgi?id=45289
    # https://bugs.winehq.org/show_bug.cgi?id=43516
    export CFLAGS+=" -mno-avx"
    export CXXFLAGS+=" -mno-avx"
    # From wine-staging PKGBUILD
    # Doesn't compile without remove these flags as of 4.10
    export CFLAGS="${CFLAGS/ -fno-plt/}"
    export CXXFLAGS="${CXXFLAGS/ -fno-plt/}"
    export LDFLAGS="${LDFLAGS/,-z,now/}"
    # MingW Wine builds fail with relro
    export LDFLAGS="${LDFLAGS/,-z,relro/}"

    export WINEESYNC=0
    export WINEFSYNC=0
    #export CARGO_HOME="$srcdir/build/cargo"
    SUBMAKE_JOBS="${MAKEFLAGS/-j/}" \
        NO_DXVK=0 \
        SYSTEM_GECKO=0 \
        SYSTEM_MONO=0 \
        make -j1 dist
}

package() {
    cd build

    local _compatdir="$pkgdir/usr/share/steam/compatibilitytools.d"

    mkdir -p "$_compatdir"
    mv dist "$_compatdir/${pkgname}"

    i686-w64-mingw32-strip --strip-unneeded \
        "$_compatdir/${pkgname}"/dist/lib/wine/{,fakedlls/,dxvk/,vkd3d-proton/}*.dll
    i686-w64-mingw32-strip --strip-unneeded \
        "$_compatdir/${pkgname}"/dist/lib/wine/{,fakedlls/}*.exe
    x86_64-w64-mingw32-strip --strip-unneeded \
        "$_compatdir/${pkgname}"/dist/lib64/wine/{,fakedlls/,dxvk/,vkd3d-proton/}*.dll
    x86_64-w64-mingw32-strip --strip-unneeded \
        "$_compatdir/${pkgname}"/dist/lib64/wine/{,fakedlls/}*.exe

    local _geckodir="$_compatdir/${pkgname}/dist/share/wine/gecko/wine-gecko-${_geckover}"
    for ext in "dll" "exe"; do
      find "$_geckodir"-x86/ \
        -iname "*.$ext" \
        -execdir i686-w64-mingw32-strip --strip-unneeded {} \;
    done
    for ext in "dll" "exe"; do
      find "$_geckodir"-x86_64/ \
        -iname "*.$ext" \
        -execdir x86_64-w64-mingw32-strip --strip-unneeded {} \;
    done

    local _monodir="$_compatdir/${pkgname}/dist/share/wine/mono/wine-mono-${_monover}"
    for ext in "dll" "exe"; do
      find "$_monodir"/lib/mono/ \
        -iname "*.$ext" \
        -execdir i686-w64-mingw32-strip --strip-unneeded {} \;
    done
    for ext in "x86.dll" "x86.exe"; do
      find "$_monodir"/ \
        -iname "*$ext" \
        -execdir i686-w64-mingw32-strip --strip-unneeded {} \;
    done
    i686-w64-mingw32-strip --strip-unneeded "$_monodir"/lib/x86/*.dll
    for ext in "x86_64.dll" "x86_64.exe"; do
      find "$_monodir"/ \
        -iname "*$ext" \
        -execdir x86_64-w64-mingw32-strip --strip-unneeded {} \;
    done
    x86_64-w64-mingw32-strip --strip-unneeded "$_monodir"/lib/x86_64/*.dll

    mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
    mv "$_compatdir/${pkgname}"/LICENSE{,.OFL} \
        "$pkgdir/usr/share/licenses/${pkgname}"
}

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
            '06a00cedf391ee07bbca0b3282e5c8ad9d950446d50648d2ff417716816fd1ab'
            'ea5246e4c91d1aa1226658e1749b6e5d0e9353b52b14df79c4b93b6e61a3c59e'
            'b17ac815afbf5eef768c4e8d50800be02af75c8b230d668e239bad99616caa82'
            'd7f1d1c82b84eb13d2d05f08be9f499fc719e666a18adacc7ebeba78fd78adf7'
            '8263a3ffb7f8e7a5d81bfbffe1843d6f84502d3443fe40f065bcae02b36ba954'
            '20f7cd3e70fad6f48d2f1a26a485906a36acf30903bf0eefbf82a7c400e248f3'
            '31fc1677e3a92189bab09f683e721be764dd24672c0c8198a52b8fd98e32fbdf'
            '7c5f9c20e41c0cd7d0d18867950a776608cef43e0ab9ebad2addb61e613fe17a')
