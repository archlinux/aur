# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: loathingkernel <loathingkernel _a_ gmail _d_ com>

pkgname=proton-cachyos
_srctag=11.0-20260429
_commit=
pkgver=${_srctag//-/.}
_geckover=2.47.4
_monover=11.0.0
_xaliaver=0.4.9
pkgrel=3
epoch=1

source=(
  proton-cachyos::git+https://github.com/CachyOS/proton-cachyos.git#tag=cachyos-${_srctag}-native
  https://dl.winehq.org/wine/wine-gecko/${_geckover}/wine-gecko-${_geckover}-x86{,_64}.tar.xz
  https://github.com/madewokherd/wine-mono/releases/download/wine-mono-${_monover}/wine-mono-${_monover}-x86.tar.xz
  https://github.com/madewokherd/xalia/releases/download/xalia-${_xaliaver}/xalia-${_xaliaver}-net48-mono.zip
  compatibilitytool.vdf.template
  ntsync.conf
  0001-build-disable-extraneous-libsoup-features.patch
)
noextract=(
  wine-gecko-${_geckover}-{x86,x86_64}.tar.xz
  wine-mono-${_monover}-x86.tar.xz
  xalia-${_xaliaver}-net48-mono.zip
)

pkgdesc="A compatibility tool for Steam Play based on Wine and additional components, experimental branch with extra CachyOS flavour"
url="https://github.com/CachyOS/proton-cachyos"
arch=(x86_64 x86_64_v3)
options=(!staticlibs !lto !debug emptydirs pestrip)
license=('custom')
depends=(
  attr            lib32-attr
#  blas            lib32-blas
  cabextract
  desktop-file-utils
  fontconfig      lib32-fontconfig
  freetype2       lib32-freetype2
  libgcc          lib32-gcc-libs
  gettext         lib32-gettext
  glib2           lib32-glib2
  glibc           lib32-glibc
#  lapack          lib32-lapack
  libgudev        lib32-libgudev
  libpcap         lib32-libpcap
  libsoup         lib32-libsoup
  libunwind       lib32-libunwind
  libvpx          lib32-libvpx
  libx11          lib32-libx11
  libxcursor      lib32-libxcursor
  libxext         lib32-libxext
  libxkbcommon    lib32-libxkbcommon
  libxi           lib32-libxi
  libxrandr       lib32-libxrandr
  lzo             lib32-lzo
  python
  python-six
  speex           lib32-speex
# Start of old steam-native-runtime
  atk             lib32-atk
  cairo           lib32-cairo
  curl            lib32-curl
  dbus-glib       lib32-dbus-glib
  freeglut        lib32-freeglut
  gdk-pixbuf2     lib32-gdk-pixbuf2
  glu             lib32-glu
  lcms2           lib32-lcms2
  libcaca         lib32-libcaca
  libcanberra     lib32-libcanberra
  dbus            lib32-dbus
  libdrm          lib32-libdrm
  libice          lib32-libice
  libibus
  libnm           lib32-libnm
  libusb          lib32-libusb
  libvdpau        lib32-libvdpau
  libvorbis       lib32-libvorbis
  libxft          lib32-libxft
  libxmu          lib32-libxmu
  libxrender      lib32-libxrender
  libxtst         lib32-libxtst
  nspr            lib32-nspr
  openal          lib32-openal
  pango           lib32-pango
  sdl2            lib32-sdl2
  sdl2_image      lib32-sdl2_image
  sdl2_mixer      lib32-sdl2_mixer
  sdl2_ttf        lib32-sdl2_ttf
  pipewire        lib32-pipewire
  librsvg
  libsm           lib32-libsm
  libtheora       lib32-libtheora
  vulkan-driver   lib32-vulkan-driver
# End of old steam-native-runtime
  unzip
  wayland         lib32-wayland
)
makedepends=(
  afdko
  alsa-lib              lib32-alsa-lib
  clang
  cmake
  ffmpeg
  fontforge
  giflib                lib32-giflib
  git
  glib2-devel
  glslang 
  gnutls                lib32-gnutls
  gtk3                  lib32-gtk3
  libgphoto2
  libpulse              lib32-libpulse
  libva                 lib32-libva
  libxcomposite         lib32-libxcomposite
  libxinerama           lib32-libxinerama
  libxml2               lib32-libxml2
  libxxf86vm            lib32-libxxf86vm
  lld
  mesa                  lib32-mesa
  mesa-libgl            lib32-mesa-libgl
  meson
  mingw-w64-gcc
  mingw-w64-tools
  nasm
  opencl-headers
  opencl-icd-loader     lib32-opencl-icd-loader
  pcsclite              lib32-pcsclite
  perl
  perl-json
  rsync
  rust                  lib32-rust-libs
  python-pefile
  python-setuptools-scm
  samba
  unixodbc
  v4l-utils             lib32-v4l-utils
  vulkan-headers
  vulkan-icd-loader     lib32-vulkan-icd-loader
  wayland-protocols
  wget
  xorg-util-macros
)
optdepends=(
  alsa-lib              lib32-alsa-lib
  alsa-plugins          lib32-alsa-plugins
  ffmpeg
  gnutls                lib32-gnutls
  gtk3                  lib32-gtk3
  libgphoto2
  libpulse              lib32-libpulse
  libva                 lib32-libva
  libxcomposite         lib32-libxcomposite
  libxinerama           lib32-libxinerama
  opencl-icd-loader     lib32-opencl-icd-loader
  pcsclite              lib32-pcsclite
  samba
  steam
  umu-launcher
  unixodbc
  v4l-utils             lib32-v4l-utils
  vulkan-icd-loader     lib32-vulkan-icd-loader
)
optdepends+=(
  NTSYNC-MODULE
)
provides=('proton')
backup=(
  "usr/share/steam/compatibilitytools.d/${pkgname}/user_settings.py"
)
install=${pkgname}.install

_make_wrappers () {
    #     _arch     prefix   gcc    ld             as     strip
    local _i686=(  "i686"   "-m32" "-melf_i386"   "--32" "elf32-i386")
    local _x86_64=("x86_64" "-m64" "-melf_x86_64" "--64" "elf64-x86-64")
    local _opts=(_i686 _x86_64)
    declare -n _opt
    for _opt in "${_opts[@]}"; do
        for l in ar ranlib nm; do
            ln -s /usr/bin/gcc-$l wrappers/${_opt[0]}-pc-linux-gnu-$l
        done
        for t in gcc g++; do
            install -Dm755 /dev/stdin wrappers/${_opt[0]}-pc-linux-gnu-$t <<EOF
#!/usr/bin/bash
$(which ccache 2> /dev/null) /usr/bin/$t ${_opt[1]} "\$@"
EOF
        done
        install -Dm755 /dev/stdin wrappers/${_opt[0]}-pc-linux-gnu-ld <<EOF
#!/usr/bin/bash
/usr/bin/ld ${_opt[2]} "\$@"
EOF
        install -Dm755 /dev/stdin wrappers/${_opt[0]}-pc-linux-gnu-as <<EOF
#!/usr/bin/bash
/usr/bin/as ${_opt[3]} "\$@"
EOF
        install -Dm755 /dev/stdin wrappers/${_opt[0]}-pc-linux-gnu-strip <<EOF
#!/usr/bin/bash
/usr/bin/strip -F ${_opt[4]} "\$@"
EOF
    done
}

prepare() {

    # Provide wrappers to compiler tools
    rm -rf wrappers && mkdir wrappers
    _make_wrappers

    [ ! -d build ] && mkdir build

    cd proton-cachyos
    patch -Np1 -i "$srcdir"/0001-build-disable-extraneous-libsoup-features.patch

    [ ! -d contrib ] && mkdir -p contrib
    mv "$srcdir"/wine-gecko-${_geckover}-x86{,_64}.tar.xz contrib/
    mv "$srcdir"/wine-mono-${_monover}-x86.tar.xz contrib/
    mv "$srcdir"/xalia-${_xaliaver}-net48-mono.zip contrib/

    _submodules=(
        d7vk
        dav1d
        dxvk
        dxvk-llasync
        dxvk-nvapi
        dxvk-sarek
        ffmpeg
        fonts/liberation-fonts
        glslang
        graphene
        gst-orc
        gst-plugins-rs
        gstreamer
        libsoup
        libxml2
        meson
        nghttp2
        nvidia-libs/dxvk-nvapi
        nvidia-libs/nvcuda
        nvidia-libs/nvcuda32
        nvidia-libs/nvenc
        nvidia-libs/nvenc32
        nvidia-libs/wine-nvml
        nvidia-libs/wine-nvoptix
        openvr
        OpenXR-SDK
        protonfixes
        SPIRV-Headers
        vkd3d
        vkd3d-proton
        vkd3d-bratan
        Vulkan-Headers
        wine
    )

    # Explicitly set origin URL for submodules using relative paths
    git remote set-url origin https://github.com/CachyOS/proton-cachyos.git
    git submodule update --init --filter=tree:0 --recursive ${_submodules[@]}

    for rustlib in gst-plugins-rs; do
    pushd $rustlib
        export RUSTUP_TOOLCHAIN=stable
        export CARGO_HOME="${SRCDEST}"/proton-cargo
        export CARGO_NET_GIT_FETCH_WITH_CLI=true
        cargo fetch --locked --target i686-unknown-linux-gnu
        cargo fetch --locked --target x86_64-unknown-linux-gnu
    popd
    done
}

build() {
    export PATH="$(pwd)/wrappers:$PATH"

    local -a split=($CFLAGS)
    local -A flags
    for opt in "${split[@]}"; do flags["${opt%%=*}"]="${opt##*=}"; done
    local march="${flags["-march"]:-nocona}"
    local mtune="${flags["-mtune"]:-core-avx2}"

    CFLAGS="-O2 -march=${march} -mtune=${mtune}"
    CXXFLAGS="-O2 -march=${march} -mtune=${mtune}"
    RUSTFLAGS="-C opt-level=3 -C target-cpu=${march}"
    LDFLAGS="-Wl,-O1,--sort-common,--as-needed"

    export CFLAGS CXXFLAGS RUSTFLAGS LDFLAGS

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="${SRCDEST}"/proton-cargo

    cd build
    ROOTLESS_CONTAINER="" \
    ../proton-cachyos/configure.sh \
        --container-engine="none" \
        --proton-sdk-image="" \
        --build-name="${pkgname}" \
        --without-wayland-libs \
        --without-libpcap \
        --without-tts

    SUBJOBS=$([[ "$MAKEFLAGS" =~ -j\ *([1-9][0-9]*) ]] && echo "${BASH_REMATCH[1]}" || echo "$(nproc)") \
        make -j1 dist

    cd dist
    sed -r \
      -e "s|##INSTALL_PATH##|.|" \
      -e "s|##DISPLAY_NAME##|proton-cachyos-${_srctag} (native)|" \
      -e "s|##INTERNAL_TOOL_NAME##|${pkgname}|" \
      "${srcdir}/compatibilitytool.vdf.template" > compatibilitytool.vdf
}

package() {
    cd build

    # Delete the intermediate build directories to free space (mostly for my github actions)
    rm -rf dst-* obj-* src-* pfx-*

    local _compatdir="${pkgdir}/usr/share/steam/compatibilitytools.d"
    mkdir -p "${_compatdir}/${pkgname}"
    rsync --delete -arx dist/* "${_compatdir}/${pkgname}"

    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${_compatdir}/${pkgname}"/{PATENTS.AV1,LICENSE{,.OFL}} \
        "${pkgdir}/usr/share/licenses/${pkgname}"

    # Load ntsync module
    install -Dm644 "$srcdir/ntsync.conf" "$pkgdir/usr/lib/modules-load.d/10-$pkgname.conf"

    cd "${_compatdir}/${pkgname}/files"

    local _geckodir="share/wine/gecko/wine-gecko-${_geckover}"
    i686-w64-mingw32-strip --strip-debug \
        $(find "${_geckodir}"-x86 -iname "*.dll" -or -iname "*.exe")
    x86_64-w64-mingw32-strip --strip-debug \
        $(find "${_geckodir}"-x86_64 -iname "*.dll" -or -iname "*.exe")

    local _monodir="share/wine/mono/wine-mono-${_monover}"
    i686-w64-mingw32-strip --strip-debug \
        $(find "${_monodir}"/lib/mono -iname "*.dll" -or -iname "*.exe")
    i686-w64-mingw32-strip --strip-debug \
        "${_monodir}"/lib/x86/*.dll \
        $(find "${_monodir}" -iname "*x86.dll" -or -iname "*x86.exe")
    x86_64-w64-mingw32-strip --strip-debug \
        "${_monodir}"/lib/x86_64/*.dll \
        $(find "${_monodir}" -iname "*x86_64.dll" -or -iname "*x86_64.exe")
}

b2sums=('f8345a08259df329ec6d10fd93ec8f6b11aaf790a8f47d8f27aa4436f0344c4c34efcdf2c497b877cc4763bca25eb366b39bc3c79aa4b0a297c6bbc7a82e8914'
        '2a73c12585b502ae11188482cbc9fb1f45f95bfe4383a7615011104b132f4845f9813d01fb40277e1934fab5f1b35ab40b4f4a66a9967463dd1d666a666904e9'
        '62856a88266b4757602c0646e024f832974a93f03b9df253fd4895d4f11a41b435840ad8f7003ec85a0d8087dec15f2e096dbfb4b01ebe4d365521e48fd0c5c0'
        '76bdc625c6c14a6c3e3892649c1fbb7ed127d8ce90079a3f8d317c8e6fd567c763d71dd838f8422c921ed315e9d2735849b223a94a9517ad73d0734d313c1a6f'
        '5a492e5bd62a8116c2571348f01e1ea9dd70e2a185f0891a27be4091c8f182ce55e48f075fe46badf80e0f5b831a1d5993b2b6e1f130f4d6b00e3ef77254d00d'
        'f0a81d83e644ca074a6bf54fc74ae12f5bd047e29d87fab528fba20e4b8d013547ad4b26e912c2b3218a75114f5c76b64aa84fdbc3054d3a1d9bf96635c6212b'
        '964a3ba277821e570aec2127f0d1ae9898da6976c360deb6b196345a50bd3c2c55cb399527507006d8fddef868069032a30b083f23987d5050f185c74dd9de35'
        '1ee7fc123a63e7c4acc5305d30d15e5116fd67909106b59983f7d4cc6bf79e558685b15d7b33013cb18ae1ef9cb720fe653bb8ee287399cb63c29bebd63dd294')
