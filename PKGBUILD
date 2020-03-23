# Maintainer: loathingkernel <loathingkernel _a_ gmail _d_ com>

pkgname=proton-ge-custom
_srctag=5.4-GE-3
pkgver=${_srctag//-/.}
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
    proton-ge-custom::git+https://github.com/gloriouseggroll/proton-ge-custom.git#tag=$_srctag
    wine::git://source.winehq.org/git/wine.git
    wine-staging::git+https://github.com/wine-staging/wine-staging.git
    vkd3d-doitsujin::git+https://github.com/doitsujin/vkd3d.git
    dxvk::git+https://github.com/doitsujin/dxvk.git
    openvr::git+https://github.com/ValveSoftware/openvr.git
    ffmpeg::git+https://git.ffmpeg.org/ffmpeg.git
    liberation-fonts::git+https://github.com/liberationfonts/liberation-fonts.git
    SPIRV-Headers::git+https://github.com/KhronosGroup/SPIRV-Headers.git
    Vulkan-Headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git
    FAudio::git+https://github.com/FNA-XNA/FAudio.git
    protonfixes-gloriouseggroll::git+https://github.com/gloriouseggroll/protonfixes.git
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
    SKIP
    SKIP
#    SKIP
#    SKIP
#    SKIP
#    SKIP
    '9c3228b0fcf98da23403eb9fc52c4f7fa200d66c1ff598d4a5dfbb16708a1815'
    'f12df8e1e2dcb6bcced6fdccfdf044b2dc55714712efd577fd5d92abfad0f5c5'
    '20f7cd3e70fad6f48d2f1a26a485906a36acf30903bf0eefbf82a7c400e248f3'
    '15fc8d8a4465ffc69897f0264ecb08d95f4b0fb00ec45dc8cb542f14c8808ef3'
)

prepare() {
    [ ! -d build ] && mkdir build

    cd proton-ge-custom

    for submodule in ffmpeg openvr SPIRV-Headers Vulkan-Headers FAudio fonts/liberation-fonts; do
        git submodule init "${submodule}"
        git config submodule."${submodule}".url ../"${submodule#*/}"
        git submodule update "${submodule}"
    done

    for submodule in wine wine-staging dxvk; do
        git submodule init "${submodule}"
        git config submodule."${submodule}".url ../"${submodule#*/}"
        git submodule update "${submodule}"
    done

    git submodule init vkd3d
    git config submodule.vkd3d.url ../vkd3d-doitsujin
    git submodule update vkd3d

    git submodule init protonfixes
    git config submodule.protonfixes.url ../protonfixes-gloriouseggroll
    git submodule update protonfixes

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

    pushd lsteamclient
    patch -Np1 < ../game-patches-testing/proton-hotfixes/steamclient-disable_SteamController007_if_no_controller.patch
    popd

    pushd dxvk
    patch -Np1 < ../game-patches-testing/dxvk-patches/valve-dxvk-avoid-spamming-log-with-requests-for-IWineD3D11Texture2D.patch
    patch -Np1 < ../game-patches-testing/dxvk-patches/proton-add_new_dxvk_config_library.patch
    popd

    pushd wine
    echo "applying staging patches"
    ../wine-staging/patches/patchinstall.sh DESTDIR="." --all \
    -W server-Desktop_Refcount \
    -W ws2_32-TransmitFile \
    -W winex11.drv-mouse-coorrds \
    -W winex11-MWM_Decorations \
    -W winex11-_NET_ACTIVE_WINDOW \
    -W winex11-WM_WINDOWPOSCHANGING \
    -W user32-rawinput-mouse \
    -W user32-rawinput-nolegacy \
    -W user32-rawinput-mouse-experimental \
    -W user32-rawinput-hid \
    -W winex11-key_translation 

    #WINE FAUDIO
    echo "applying faudio patches"
    patch -Np1 < ../game-patches-testing/faudio-patches/faudio-ffmpeg.patch

    ### GAME PATCH SECTION ###
    echo "mech warrior online"
    patch -Np1 < ../game-patches-testing/game-patches/mwo.patch

    echo "final fantasy XIV"
    patch -Np1 < ../game-patches-testing/game-patches/ffxiv-launcher.patch

    echo "assetto corsa"
    patch -Np1 < ../game-patches-testing/game-patches/assettocorsa-hud.patch

    echo "sword art online"
    patch -Np1 < ../game-patches-testing/game-patches/sword-art-online-gnutls.patch

    echo "origin downloads fix" 
    patch -Np1 < ../game-patches-testing/game-patches/origin-downloads_fix.patch

    echo "blackops 2 fix"
    patch -Np1 < ../game-patches-testing/game-patches/blackops_2_fix.patch

    echo "NFSW launcher fix"
    patch -Np1 < ../game-patches-testing/game-patches/NFSWLauncherfix.patch

    echo "fix steep and AC Odyssey fullscreen"
    patch -Np1 < ../game-patches-testing/wine-patches/0001-Add-some-semi-stubs-in-user32.patch

    ### END GAME PATCH SECTION ###
    
    echo "clock monotonic, amd ags"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-use_clock_monotonic.patch
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-amd_ags.patch

    echo "bypass compositor"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-FS_bypass_compositor.patch

    echo "applying winevulkan childwindow"
    patch -Np1 < ../game-patches-testing/wine-patches/winevulkan-childwindow.patch

    #WINE FSYNC
    echo "applying fsync patches"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-fsync_staging.patch
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-fsync-spincounts.patch
    
    echo "fullscreen hack"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/valve_proton_fullscreen_hack-staging.patch

    echo "raw input"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-rawinput.patch
    
    echo "staging winex11-key_translation"
    patch -Np1 < ../wine-staging/patches/winex11-key_translation/0001-winex11-Match-keyboard-in-Unicode.patch
    patch -Np1 < ../wine-staging/patches/winex11-key_translation/0002-winex11-Fix-more-key-translation.patch
    patch -Np1 < ../wine-staging/patches/winex11-key_translation/0003-winex11.drv-Fix-main-Russian-keyboard-layout.patch
    
    echo "LAA"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-LAA_staging.patch

    echo "staging winex11-MWM_Decorations"
    patch -Np1 < ../game-patches-testing/proton-hotfixes/proton-staging_winex11-MWM_Decorations.patch
    
    echo "steamclient swap"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-steamclient_swap.patch

    echo "protonify rpc"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-protonify_staging_rpc.patch

    echo "protonify"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-protonify_staging.patch
    
    echo "steam bits"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-steam-bits.patch

    echo "SDL Joystick"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-sdl_joy.patch
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-sdl_joy_2.patch
    
    echo "Valve VR patches"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-vr.patch

    echo "Valve vulkan patches"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-vk-bits-4.5.patch

    echo "FS Hack integer scaling"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton_fs_hack_integer_scaling.patch
    
    echo "proton winevulkan"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-winevulkan.patch
    
    echo "msvcrt overrides"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-msvcrt_nativebuiltin.patch

    echo "valve registry entries"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-apply_LargeAddressAware_fix_for_Bayonetta.patch
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-Set_amd_ags_x64_to_built_in_for_Wolfenstein_2.patch
    
    echo "set prefix win10"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-win10_default.patch

    echo "dxvk_config"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-dxvk_config.patch

    echo "hide wine prefix update"
    patch -Np1 < ../game-patches-testing/proton-valve-patches/proton-hide_wine_prefix_update_window.patch

    echo "applying WoW vkd3d wine patches"
    patch -Np1 < ../game-patches-testing/wine-patches/D3D12SerializeVersionedRootSignature.patch
    patch -Np1 < ../game-patches-testing/wine-patches/D3D12CreateVersionedRootSignatureDeserializer.patch

    ./dlls/winevulkan/make_vulkan
    ./tools/make_requests
    autoreconf -f
    popd
}

build() {
    cd build
    ../proton-ge-custom/configure.sh \
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
