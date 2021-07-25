# Maintainer: loathingkernel <loathingkernel _a_ gmail _d_ com>

pkgname=proton-native
_srctag=6.3-5
_commit=
pkgver=${_srctag//-/.}
_geckover=2.47.2
_monover=6.1.2
pkgrel=1
epoch=1
pkgdesc="Compatibility tool for Steam Play based on Wine and additional components. Monolithic distribution"
url="https://github.com/ValveSoftware/Proton"
arch=(x86_64)
options=(staticlibs !lto)
license=('custom')

depends=(
  attr             lib32-attr
  fontconfig       lib32-fontconfig
  lcms2            lib32-lcms2
  libxml2          lib32-libxml2
  libxcursor       lib32-libxcursor
  libxrandr        lib32-libxrandr
  libxdamage       lib32-libxdamage
  libxi            lib32-libxi
  gettext          lib32-gettext
  freetype2        lib32-freetype2
  glu              lib32-glu
  libsm            lib32-libsm
  gcc-libs         lib32-gcc-libs
  libpcap          lib32-libpcap
  desktop-file-utils
  python
  steam-native-runtime
)

makedepends=(autoconf ncurses bison perl fontforge flex mingw-w64-gcc
  git wget rsync mingw-w64-tools lld nasm meson cmake python-virtualenv python-pip
  glslang vulkan-headers
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
  alsa-lib              lib32-alsa-lib
  libxcomposite         lib32-libxcomposite
  mesa                  lib32-mesa
  mesa-libgl            lib32-mesa-libgl
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  libpulse              lib32-libpulse
  libva                 lib32-libva
  gtk3                  lib32-gtk3
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  sdl2                  lib32-sdl2
  libcups               lib32-libcups
  rust                  lib32-rust-libs
  sane
  libgphoto2
  gsm
  ffmpeg
  samba
  opencl-headers
)

optdepends=(
  giflib                lib32-giflib
  libpng                lib32-libpng
  libldap               lib32-libldap
  gnutls                lib32-gnutls
  mpg123                lib32-mpg123
  openal                lib32-openal
  v4l-utils             lib32-v4l-utils
  libpulse              lib32-libpulse
  alsa-plugins          lib32-alsa-plugins
  alsa-lib              lib32-alsa-lib
  libjpeg-turbo         lib32-libjpeg-turbo
  libxcomposite         lib32-libxcomposite
  libxinerama           lib32-libxinerama
  ncurses               lib32-ncurses
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  libva                 lib32-libva
  gtk3                  lib32-gtk3
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  sdl2                  lib32-sdl2
  sane
  libgphoto2
  gsm
  ffmpeg
  cups
  samba           dosbox
)

makedepends=(${makedepends[@]} ${depends[@]})
#install=${pkgname}.install
source=(
    proton::git+https://github.com/ValveSoftware/Proton.git#tag=proton-${_srctag}
    wine-valve::git+https://github.com/ValveSoftware/wine.git
    vkd3d-proton::git+https://github.com/HansKristian-Work/vkd3d-proton.git
    dxvk-valve::git+https://github.com/ValveSoftware/dxvk.git
    openvr::git+https://github.com/ValveSoftware/openvr.git
    OpenXR-SDK::git+https://github.com/KhronosGroup/OpenXR-SDK.git
    liberation-fonts::git+https://github.com/liberationfonts/liberation-fonts.git
    SPIRV-Headers::git+https://github.com/KhronosGroup/SPIRV-Headers.git
    Vulkan-Headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git
    dxil-spirv::git+https://github.com/HansKristian-Work/dxil-spirv.git
    FAudio::git+https://github.com/FNA-XNA/FAudio.git
    gstreamer::git+https://gitlab.freedesktop.org/gstreamer/gstreamer.git
    gst-orc::git+https://gitlab.freedesktop.org/gstreamer/orc.git
    gst-plugins-base::git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-base.git
    gst-plugins-good::git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-good.git
    https://dl.winehq.org/wine/wine-gecko/${_geckover}/wine-gecko-${_geckover}-x86{,_64}.tar.xz
    https://github.com/madewokherd/wine-mono/releases/download/wine-mono-${_monover}/wine-mono-${_monover}-x86.tar.xz
    proton-unfuck_makefile.patch
    proton-disable_lock.patch
    proton-user_compat_data.patch
    dxvk-async.patch
)
noextract=(
    wine-gecko-${_geckover}-{x86,x86_64}.tar.xz
    wine-mono-${_monover}-x86.tar.xz
)

prepare() {
    # I know this is fugly and it should NOT be done
    # but the afdko package from AUR breaks regularly.
    # Install it from pip in a virtualenv
    virtualenv --app-data "$srcdir"/build_venv/cache --no-wheel build_venv
    source build_venv/bin/activate
    pip install --no-cache-dir afdko
    pip install --no-cache-dir pefile

    [ ! -d gecko ] && mkdir gecko
    mv wine-gecko-${_geckover}-x86{,_64}.tar.xz gecko/

    [ ! -d mono ] && mkdir mono
    mv wine-mono-${_monover}-x86.tar.xz mono/

    [ ! -d build ] && mkdir build
    cd proton
    for submodule in openvr OpenXR-SDK fonts/liberation-fonts FAudio vkd3d-proton; do
        git submodule init "${submodule}"
        git config submodule."${submodule}".url "$srcdir"/"${submodule#*/}"
        git submodule update "${submodule}"
    done

    for submodule in wine dxvk; do
        git submodule init "${submodule}"
        git config submodule."${submodule}".url "$srcdir"/"${submodule#*/}"-valve
        git submodule update "${submodule}"
    done

    for submodule in gstreamer gst-{plugins-{base,good},orc}; do
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


    patch -p1 -i "$srcdir"/proton-unfuck_makefile.patch
    patch -p1 -i "$srcdir"/proton-disable_lock.patch
    patch -p1 -i "$srcdir"/proton-user_compat_data.patch

    # Uncomment to enable dxvk async patch.
    # Enable at your own risk. If you don't know what it is,
    # and its implications, leave it as is. You have been warned.
    # I am not liable if anything happens to you by using it.
#    patch -p1 -i "$srcdir"/dxvk-async.patch
}

build() {
    cd build
    ROOTLESS_CONTAINER="" \
    ../proton/configure.sh \
        --container-engine="" \
        --proton-sdk-image="" \
        --steam-runtime=native \
        --no-proton-sdk \
        --build-name="${pkgname}"

    # Export CFLAGS used by upstream
    # -O2 is adjusted to -O3 since AVX is disabled
    # This overrides CFLAGS from makepkg.conf, if you comment these you are on your own
    # If you want the "best" possbile optimizations for your system you can use
    # `-march=native` and remove the `-mtune=core-avx2` option.
    export CFLAGS="-O3 -march=nocona -mtune=core-avx2 -pipe"
    export CXXFLAGS="-O3 -march=nocona -mtune=core-avx2 -pipe"

    # If using -march=native and the CPU supports AVX, launching a d3d9
    # game can cause an Unhandled exception. The cause seems to be the
    # combination of AVX instructions and tree vectorization (implied by O3),
    # all tested archictures from sandybridge to haswell are affected.
    # Disabling AVX (and AVX2 as a side-effect).
    # Since Wine 5.16 AVX is supported. Testing showed 32bit applications
    # crashing with AVX regardless, but 64bit applications worked just fine.
    # So disable AVX only for the 32bit binaries and AVX2 for the 64bit.
    # AVX2 seems to degrade performance. So disregard the above.
    # Relevant Wine issues
    # https://bugs.winehq.org/show_bug.cgi?id=45289
    # https://bugs.winehq.org/show_bug.cgi?id=43516
    export CFLAGS+=" -mno-avx"
    export CXXFLAGS+=" -mno-avx"
    # Filter known bad flags before applying optimizations
    # Filter fstack-protector{ ,-all,-strong} flag for MingW.
    # https://github.com/Joshua-Ashton/d9vk/issues/476
    #export CFLAGS+=" -fno-stack-protector"
    export CFLAGS="${CFLAGS// -fstack-protector*([\-all|\-strong])/}"
    #export CXXFLAGS+=" -fno-stack-protector"
    export CXXFLAGS="${CXXFLAGS// -fstack-protector*([\-all|\-strong])/}"
    # From wine-staging PKGBUILD
    # Doesn't compile with these flags in MingW so remove them.
    # They are also filtered in Wine PKGBUILDs so remove them
    # for winelib versions too.
    # Doesn't compile without remove these flags as of 4.10
    export CFLAGS="${CFLAGS/ -fno-plt/}"
    export CXXFLAGS="${CXXFLAGS/ -fno-plt/}"
    export LDFLAGS="${LDFLAGS/,-z,now/}"
    # MingW Wine builds fail with relro
    export LDFLAGS="${LDFLAGS/,-z,relro/}"

    export WINEESYNC=0
    export WINEFSYNC=0
    SUBJOBS="${MAKEFLAGS/-j/}" \
        make -j1 dist
}

package() {
    cd build

    local _compatdir="$pkgdir/usr/share/steam/compatibilitytools.d"
    mkdir -p "$_compatdir"
    cp -rf --no-dereference --preserve=mode,links dist "$_compatdir/${pkgname}"

    mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
    mv "$_compatdir/${pkgname}"/LICENSE{,.OFL} \
        "$pkgdir/usr/share/licenses/${pkgname}"

    cd "$_compatdir/${pkgname}/dist"
    i686-w64-mingw32-strip --strip-unneeded \
        $(find lib/wine \( -iname fakedlls \) -prune -false -or -iname "*.dll" -or -iname "*.exe")
    x86_64-w64-mingw32-strip --strip-unneeded \
        $(find lib64/wine \( -iname fakedlls \) -prune -false -or -iname "*.dll" -or -iname "*.exe")

    local _geckodir="share/wine/gecko/wine-gecko-${_geckover}"
    i686-w64-mingw32-strip --strip-unneeded \
        $(find "$_geckodir"-x86 -iname "*.dll" -or -iname "*.exe")
    x86_64-w64-mingw32-strip --strip-unneeded \
        $(find "$_geckodir"-x86_64 -iname "*.dll" -or -iname "*.exe")

    local _monodir="share/wine/mono/wine-mono-${_monover}"
    i686-w64-mingw32-strip --strip-unneeded \
        $(find "$_monodir"/lib/mono -iname "*.dll" -or -iname "*.exe")
    i686-w64-mingw32-strip --strip-unneeded \
        "$_monodir"/lib/x86/*.dll \
        $(find "$_monodir" -iname "*x86.dll" -or -iname "*x86.exe")
    x86_64-w64-mingw32-strip --strip-unneeded \
        "$_monodir"/lib/x86_64/*.dll \
        $(find "$_monodir" -iname "*x86_64.dll" -or -iname "*x86_64.exe")
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
            '8fab46ea2110b2b0beed414e3ebb4e038a3da04900e7a28492ca3c3ccf9fea94'
            'b4476706a4c3f23461da98bed34f355ff623c5d2bb2da1e2fa0c6a310bc33014'
            '463efcae9aec82e2ae51adbafe542f2a0674e1a1d0899d732077211f5c62d182'
            '2473fc498d9727c4ed4fc77ca703077d2e081225548d1c8086690e0f62ba1f13'
            '8263a3ffb7f8e7a5d81bfbffe1843d6f84502d3443fe40f065bcae02b36ba954'
            '20f7cd3e70fad6f48d2f1a26a485906a36acf30903bf0eefbf82a7c400e248f3'
            '36aaba6847e4577df4a496d88c11b4b7049773f1f2b90aa4545093e16d5c6066'
)
