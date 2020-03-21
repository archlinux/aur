# Maintainer: loathingkernel <loathingkernel _a_ gmail _d_ com>

pkgname=proton-native
pkgver=5.0.5
_srctag=${pkgver%.*}-${pkgver##*.}
_geckover=2.47.1
_monover=4.9.4
#_dxvkver=1.5
pkgrel=1
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
  "wine-gecko-bin>=$_geckover"
  "wine-mono-bin>=$_monover"
#  "dxvk>=$_dxvkver"
)
makedepends=(autoconf ncurses bison perl fontforge flex meson
  'gcc>=4.5.0-2'
  mingw-w64-gcc
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
#  vkd3d                 lib32-vkd3d
  sdl2                  lib32-sdl2
  libgphoto2
  sane
  gsm
#  vulkan-headers
#  spirv-headers
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
#  ncurses               lib32-ncurses
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  gst-plugins-base-libs lib32-gst-plugins-base-libs
#  vkd3d                 lib32-vkd3d
  sdl2                  lib32-sdl2
  libgphoto2
  sane
  gsm
  cups
  samba           dosbox
)
makedepends=(${makedepends[@]} ${depends[@]})
source=(
    proton::git+https://github.com/ValveSoftware/Proton.git#tag=proton-$_srctag
    wine-valve::git+https://github.com/ValveSoftware/wine.git
    vkd3d-valve::git+https://github.com/ValveSoftware/vkd3d.git
    dxvk-valve::git+https://github.com/ValveSoftware/dxvk.git
    openvr::git+https://github.com/ValveSoftware/openvr.git
    ffmpeg::git+https://git.ffmpeg.org/ffmpeg.git
    liberation-fonts::git+https://github.com/liberationfonts/liberation-fonts.git
    SPIRV-Headers::git+https://github.com/KhronosGroup/SPIRV-Headers.git
    Vulkan-Headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git
    FAudio::git+https://github.com/FNA-XNA/FAudio.git
#    gstreamer::git+https://gitlab.freedesktop.org/gstreamer/gstreamer.git
#    gst-plugins-base::git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-base.git
#    gst-plugins-good::git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-good.git
#    glib::git+https://gitlab.gnome.org/GNOME/glib.git
    proton-unfuck_makefile.patch
    proton-disable_lock.patch
    proton-user_compat_data.patch
    dxvk-extraopts.patch
)
sha256sums=(
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
#    SKIP
#    SKIP
#    SKIP
#    SKIP
    'b9e8443c3f1949cc8b0d311594aa46cbfb79da48c3f00e95c97e87656368dd49'
    'f12df8e1e2dcb6bcced6fdccfdf044b2dc55714712efd577fd5d92abfad0f5c5'
    '375015b1582e3c606122d4dd6dc9919f6df1ca7223855908600e1e8fae762c51'
    '15fc8d8a4465ffc69897f0264ecb08d95f4b0fb00ec45dc8cb542f14c8808ef3'
)

prepare() {
    [ ! -d build ] && mkdir build

    cd proton
    for submodule in ffmpeg openvr SPIRV-Headers Vulkan-Headers FAudio fonts/liberation-fonts; do
        git submodule init "${submodule}"
        git config submodule."${submodule}".url ../"${submodule#*/}"
        git submodule update "${submodule}"
    done

    for submodule in wine vkd3d dxvk; do
        git submodule init "${submodule}"
        git config submodule."${submodule}".url ../"${submodule#*/}"-valve
        git submodule update "${submodule}"
    done

#    for submodule in gstreamer gst-plugins-{base,good} glib; do
#        git submodule init "${submodule}"
#        git config submodule."${submodule}".url ../"${submodule#*/}"
#        git submodule update "${submodule}"
#    done

    patch -p1 -i "$srcdir"/proton-unfuck_makefile.patch
    patch -p1 -i "$srcdir"/proton-disable_lock.patch
    patch -p1 -i "$srcdir"/proton-user_compat_data.patch

    # Uncomment to enable extra optimizations
    # Patch crossfiles with extra optimizations from makepkg.conf
    patch -p1 -i "$srcdir"/dxvk-extraopts.patch
    local dxvk_cflags="$CFLAGS"
    local dxvk_ldflags="$LDFLAGS"
    # Filter known bad flags before applying optimizations
    # If using -march=native and the CPU supports AVX, launching a d3d9
    # game can cause an Unhandled exception. The cause seems to be the
    # combination of AVX instructions and tree vectorization (implied by O3),
    # all tested archictures from sandybridge to haswell are affected.
    # Disabling either AVX (and AVX2 as a side-effect) or tree
    # vectorization fixes the issue. I am not sure which one is better
    # to disable so below you can choose. Append either of these flags.
    # Relevant Wine issues
    # https://bugs.winehq.org/show_bug.cgi?id=45289
    # https://bugs.winehq.org/show_bug.cgi?id=43516
    dxvk_cflags+=" -mno-avx"
    #dxvk_cflags+=" -fno-tree-vectorize"
    # Filter fstack-protector flag for MingW.
    # https://github.com/Joshua-Ashton/d9vk/issues/476
    dxvk_cflags+=" -fno-stack-protector"
    #dxvk_cflags="${dxvk_cflags// -fstack-protector+(-all|-strong)/}"
    #dxvk_cflags="${dxvk_cflags// -fstack-protector+(?=[ ])/}"
    # Adjust optimization level in meson arguments. This is ignored
    # anyway because meson sets its own optimization level.
    dxvk_cflags="${dxvk_cflags// -O+([0-3s]|fast)/}"
    # Doesn't compile with these flags in MingW so remove them.
    # They are also filtered in Wine PKGBUILDs so remove them
    # for winelib versions too.
    dxvk_cflags="${dxvk_cflags/ -fno-plt/}"
    dxvk_ldflags="${dxvk_ldflags/,-z,relro,-z,now/}"
    sed -i dxvk/build-win64.txt \
        -e "s|@CARGS@|\'${dxvk_cflags// /\',\'}\'|g" \
        -e "s|@LDARGS@|\'${dxvk_ldflags// /\',\'}\'|g"
    sed -i dxvk/build-win32.txt \
        -e "s|@CARGS@|\'${dxvk_cflags// /\',\'}\'|g" \
        -e "s|@LDARGS@|\'${dxvk_ldflags// /\',\'}\'|g"
}

build() {
    cd build
    ../proton/configure.sh \
        --no-steam-runtime \
        --with-ffmpeg \
        --build-name="${pkgname%-git}"

    # Use -mno-avx for wine too
    # https://bugs.winehq.org/show_bug.cgi?id=45289
    # https://bugs.winehq.org/show_bug.cgi?id=43516
    export CFLAGS+=" -mno-avx"
    #export CFLAGS+=" -fno-tree-vectorize"
    #export CFLAGS="${CFLAGS/-O3/-O2}"
    # From wine-staging PKGBUILD
    # Doesn't compile without remove these flags as of 4.10
    export CFLAGS="${CFLAGS/ -fno-plt/}"
    export LDFLAGS="${LDFLAGS/,-z,now/}"

    SUBMAKE_JOBS="${MAKEFLAGS/-j/}" \
        WINEESYNC=0 \
        WINEFSYNC=0 \
        NO_DXVK=0 \
        SYSTEM_GECKO=1 \
        SYSTEM_MONO=1 \
        make -j1 dist
}

package() {
    cd build

    mkdir -p "$pkgdir/usr/share/steam/compatibilitytools.d"
    mv dist "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}"

    find "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}" \
        -exec chmod go-w {} \;
    find "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}" \
        -type f \
        -not -path "*/proton" \
        -not -path "*/dist/bin/*" \
        -not -path "*/dist/lib/*" \
        -not -path "*/dist/lib64/*" \
        -not -path "*/dist/share/default_pfx/*" \
        -exec chmod 644 {} \;
    chmod 755 "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}"/{proton,dist/bin/{msidb,wine{,64},wine{,64}-preloader,wineserver}}

    ln -s /usr/share/wine/mono \
        "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}"/dist/share/wine/mono
    ln -s /usr/share/wine/gecko \
        "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}"/dist/share/wine/gecko

    mkdir -p "$pkgdir/usr/share/licenses/${pkgname%-git}"
    mv "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}"/LICENSE{,.OFL} \
        "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
