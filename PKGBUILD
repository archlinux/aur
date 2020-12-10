# Maintainer: loathingkernel <loathingkernel _a_ gmail _d_ com>

pkgname=proton-native
_srctag=5.13-4
_commit=
pkgver=${_srctag//-/.}
_geckover=2.47.1
_monover=5.1.1
pkgrel=1
epoch=1
pkgdesc="Compatibility tool for Steam Play based on Wine and additional components. Monolithic distribution"
arch=(x86_64)
url="https://github.com/ValveSoftware/Proton"
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
  "wine-gecko-bin=$_geckover"
  "wine-mono-bin=$_monover"
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
  afdko
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
    proton::git+https://github.com/ValveSoftware/Proton.git#tag=proton-${_srctag}
    wine-valve::git+https://github.com/ValveSoftware/wine.git
    vkd3d-proton::git+https://github.com/HansKristian-Work/vkd3d-proton.git
    dxvk-valve::git+https://github.com/ValveSoftware/dxvk.git
    openvr::git+https://github.com/ValveSoftware/openvr.git
    liberation-fonts::git+https://github.com/liberationfonts/liberation-fonts.git
    SPIRV-Headers::git+https://github.com/KhronosGroup/SPIRV-Headers.git
    Vulkan-Headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git
    dxil-spirv::git+https://github.com/HansKristian-Work/dxil-spirv.git
    FAudio::git+https://github.com/FNA-XNA/FAudio.git
    gstreamer::git+https://gitlab.freedesktop.org/gstreamer/gstreamer.git
    gst-orc::git+https://gitlab.freedesktop.org/gstreamer/orc.git
    gst-plugins-base::git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-base.git
    gst-plugins-good::git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-good.git
    proton-unfuck_makefile.patch
    proton-disable_lock.patch
    proton-user_compat_data.patch
    dxvk-extraopts.patch
    vkd3d-extraopts.patch
)
noextract=(
)

prepare() {

    [ ! -d build ] && mkdir build
    cd proton
    for submodule in openvr FAudio fonts/liberation-fonts vkd3d-proton; do
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
    ../proton/configure.sh \
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

    # Provide system gecko and mono to be availabe
    # during the default prefix creation
    mkdir -p dist/dist/share/wine/
    ln -s /usr/share/wine/gecko dist/dist/share/wine/gecko
    ln -s /usr/share/wine/mono dist/dist/share/wine/mono

    export WINEESYNC=0
    export WINEFSYNC=0
    export CARGO_HOME="$srcdir/build/cargo"
    SUBMAKE_JOBS="${MAKEFLAGS/-j/}" \
        NO_DXVK=0 \
        SYSTEM_GECKO=1 \
        SYSTEM_MONO=1 \
        make -j1 dist
}

package() {
    cd build

    local _compatdir="$pkgdir/usr/share/steam/compatibilitytools.d"

    mkdir -p "$_compatdir"
    mv dist "$_compatdir/${pkgname}"

    i686-w64-mingw32-strip --strip-unneeded \
        "$_compatdir/${pkgname}"/dist/lib/wine/{,fakedlls/,dxvk/,vkd3d-proton/}*.dll
    x86_64-w64-mingw32-strip --strip-unneeded \
        "$_compatdir/${pkgname}"/dist/lib64/wine/{,fakedlls/,dxvk/,vkd3d-proton/}*.dll

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
            'a112c6a16d8a53a6be4719d44b91a017170a26c328176dbab6c926ffccb442c6'
            '8263a3ffb7f8e7a5d81bfbffe1843d6f84502d3443fe40f065bcae02b36ba954'
            '20f7cd3e70fad6f48d2f1a26a485906a36acf30903bf0eefbf82a7c400e248f3'
            'bc17f1ef1e246db44c0fa3874290ad0a5852b0b3fe75902b39834913e3811d98'
            '7c5f9c20e41c0cd7d0d18867950a776608cef43e0ab9ebad2addb61e613fe17a')
