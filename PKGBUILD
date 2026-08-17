# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: loathingkernel <loathingkernel _a_ gmail _d_ com>

pkgname=proton-cachyos-native
_srctag=11.0-20260703
_commit=
pkgver=${_srctag//-/.}
_geckover=2.47.4
_monover=11.2.0
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
)
noextract=(
  wine-gecko-${_geckover}-{x86,x86_64}.tar.xz
  wine-mono-${_monover}-x86.tar.xz
  xalia-${_xaliaver}-net48-mono.zip
)

pkgdesc="A compatibility tool for Steam Play based on Wine and additional components, experimental branch with extra CachyOS flavour (native build)"
url="https://github.com/CachyOS/proton-cachyos"
arch=(x86_64 x86_64_v3)
options=(!staticlibs !lto !debug emptydirs pestrip)
license=('custom')
depends=(
  attr
#  blas
  cabextract
  desktop-file-utils
  fontconfig
  flac
  freetype2
  libgcc
  gettext
  glib2
  glibc
#  lapack
  libgudev
  libnsl
  libpcap
  libunwind
  libvpx
  libwebp
  libx11
  libxcursor
  libxext
  libxkbcommon
  libxml2
  libxi
  libxrandr
  mpg123
  pipewire
  python
  python-six
  speex
  speexdsp
# Start of old steam-native-runtime
  atk
  cairo
  curl
  dbus-glib
  freeglut
  gdk-pixbuf2
  glu
  lcms2
  libcaca
  libcanberra
  dbus
  libdrm
  libice
  libibus
  libnm
  libusb
  libvdpau
  libvorbis
  libxft
  libxmu
  libxrender
  libxtst
  nspr
  openal
  pango
  sdl2-compat
  pipewire
  librsvg
  libsm
  libtheora
  vulkan-driver
# End of old steam-native-runtime
  unzip
  wayland
  xz
)
makedepends=(
  afdko
  alsa-lib
  clang
  cmake
  ffmpeg
  fontforge
  giflib
  git
  glib2-devel
  glslang 
  gnutls
  gtk3
  libgphoto2
  libpulse
  libva
  libxcomposite
  libxinerama
  libxxf86vm
  lld
  mesa
  mesa-libgl
  meson
  mingw-w64-gcc
  mingw-w64-tools
  nasm
  opencl-headers
  opencl-icd-loader
  pcsclite
  perl
  perl-json
  rsync
  rust
  python-pefile
  python-setuptools-scm
  samba
  unixodbc
  v4l-utils
  vulkan-headers
  vulkan-icd-loader
  wayland-protocols
  wget
  xorg-util-macros
)
optdepends=(
  alsa-lib
  alsa-plugins
  ffmpeg
  gnutls
  gtk3
  libgphoto2
  libpulse
  libva
  libxcomposite
  libxinerama
  opencl-icd-loader
  pcsclite
  samba
  steam
  umu-launcher
  unixodbc
  v4l-utils
  vulkan-icd-loader
)
optdepends+=(
  NTSYNC-MODULE
)
provides=('proton-cachyos' 'proton')
replaces=('proton-cachyos')
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

    [ ! -d contrib ] && mkdir -p contrib
    mv "$srcdir"/wine-gecko-${_geckover}-x86{,_64}.tar.xz contrib/
    mv "$srcdir"/wine-mono-${_monover}-x86.tar.xz contrib/
    mv "$srcdir"/xalia-${_xaliaver}-net48-mono.zip contrib/

    _submodules=(
        OpenXR-SDK
        SPIRV-Headers
        Vulkan-Headers
        dav1d
        dxvk
        dxvk-nvapi
        extras/d7vk
        extras/discord-rpc-bridge
        extras/dxvk-low-latency
        extras/vkd3d-low-latency
        extras/dxvk-sarek
        ffmpeg
        fonts/liberation-fonts
        glslang
        graphene
        gst-orc
        gst-plugins-rs
        gstreamer
        libsoup
        meson
        nvidia-libs/dxvk-nvapi
        nvidia-libs/nvcuda
        nvidia-libs/nvcuda32
        nvidia-libs/nvenc
        nvidia-libs/nvenc32
        nvidia-libs/wine-nvml
        nvidia-libs/wine-nvoptix
        openvr
        protonfixes
        vkd3d
        vkd3d-proton
        vklayers/Vulkan-Utility-Libraries
        vklayers/low_latency_layer
        vklayers/pyroveil
        vklayers/vkbasalt
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
        --enable-wow64 \
        --without-steamrt-depends \
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

b2sums=('6a2eb145f5d3ec468a61bcc3a31a04c166bc6e9b0d493a038f4aeb7f70b8e599ae5f2cf7230c515142594a4c7ec3e0fbbe11d2a14940a9ead1c626aea39e9f00'
        '2a73c12585b502ae11188482cbc9fb1f45f95bfe4383a7615011104b132f4845f9813d01fb40277e1934fab5f1b35ab40b4f4a66a9967463dd1d666a666904e9'
        '62856a88266b4757602c0646e024f832974a93f03b9df253fd4895d4f11a41b435840ad8f7003ec85a0d8087dec15f2e096dbfb4b01ebe4d365521e48fd0c5c0'
        '74555b5f02cb8053ccfb272c30f88e00bb647291ebf57ebd1bce067275ea9184fc0a983d26f4014fa1d6fae53ada9258ddaf11938f0b821fab1bde58257399b1'
        '5a492e5bd62a8116c2571348f01e1ea9dd70e2a185f0891a27be4091c8f182ce55e48f075fe46badf80e0f5b831a1d5993b2b6e1f130f4d6b00e3ef77254d00d'
        'f0a81d83e644ca074a6bf54fc74ae12f5bd047e29d87fab528fba20e4b8d013547ad4b26e912c2b3218a75114f5c76b64aa84fdbc3054d3a1d9bf96635c6212b'
        '964a3ba277821e570aec2127f0d1ae9898da6976c360deb6b196345a50bd3c2c55cb399527507006d8fddef868069032a30b083f23987d5050f185c74dd9de35')
