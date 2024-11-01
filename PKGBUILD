# Maintainer: Konstantin Liberty <jon9097 at gmail dot com>

pkgname=obs-studio-liberty
pkgver=30.2.3
pkgrel=2
pkgdesc="Free, open source software for live streaming and recording. With Browser Source support. Without the need to install ffmpeg-obs, etc."
arch=('x86_64')
url="https://github.com/obsproject/obs-studio"
license=('GPL-2.0-or-later')
_qtver=6.6.2
_libajantv2ver=17.0.1
_libdatachannelver=0.21
_mbedtlsver=3.6
_pythonver=3.12
depends=(
  "alsa-lib" # Deps of ALSA plugin and CEF
  "curl" # Deps of OBS Studio and rtmp-services plugin
  "ffmpeg>=7" # Deps of OBS Studio and FFmpeg plugin
  "fontconfig" # Deps of Freetype2 plugin
  "freetype2" # Deps of Freetype2 plugin
  "gcc-libs" # Deps of any C++ related binary
  "glib2" # Deps of libobs, PipeWire plugin and CEF
  "glibc" # Deps of any C related binary
  "jansson" # Deps of libobs and rtmp-services plugin
  "libgl" # Deps of libobs-opengl and OBS Studio
  "libpipewire" # Deps of the PipeWire plugin
  "libpulse" # Deps of PulseAudio monitoring (in libobs) and PulseAudio plugin
  "librist" # Deps of FFmpeg plugin
  "libva" # Deps of FFmpeg plugin and QSV plugin
  "libx11" # Deps of libobs, libobs-opengl, X11 Capture plugin, frontend tools plugin, obs-browser and CEF
  "libxcb" # Deps of libobs-opengl, X11 Capture plugin and CEF
  "libxcomposite" # Deps of the X11 capture plugin
  "libxkbcommon" # Deps of libobs, OBS Studio and CEF
  "mbedtls>=$_mbedtlsver" # Deps of OBS Studio and Outputs plugin
  "pciutils" # Deps of FFmpeg plugin
  "qrcodegencpp-cmake" # Deps of Websocket plugin
  "qt6-base>=$_qtver" # Deps of OBS Studio and any frontend plugin
  "qt6-svg>=$_qtver" # Deps of OBS Studio
  "qt6-wayland>=$_qtver" # Needed to use Qt on Wayland platform
  "rnnoise" # Deps if the filter plugin
  "speexdsp" # Deps if the filter plugin
  "srt" # Deps of FFmpeg plugin
  "util-linux-libs" # Deps of libobs
  "vlc" # It is necessary to build the package and work
  "wayland" # Deps of libobs, libobs-opengl and CEF
  "x264" # Deps of the X264 plugin
  "zlib" # Deps of libobs

  # Deps of CEF
  "at-spi2-core" "dbus" "expat" "libcups" "libdrm" "libxdamage"
  "libxext" "libxfixes" "libxrandr" "mesa" "nspr" "nss"
)
makedepends=(
  "asio" # Deps of Websocket plugin (headers-only lib)
  "cmake"
  "jack" # Deps of JACK plugin
  "git"
  "uthash" # Deps of libobs
  "libajantv2>=$_libajantv2ver" # Deps of AJA plugins
  "libdatachannel>=$_libdatachannelver" # Deps of WebRTC plugin (NICE variant like the Flatpak)
  "libfdk-aac" # Deps of FDK AAC plugin
  "luajit" # Deps of Scripting plugin
  "nlohmann-json" # Deps of Websocket plugin (headers-only lib)
  "libvpl" # Deps of QSV plugin
  "python>=$_pythonver" # Deps of Scripting plugin
  "sndio" # Deps of sndio plugin
  "swig" # Deps of Scripting plugin
  "systemd-libs" # Deps of V4L2 plugin
  "v4l-utils" # Deps of V4L2 plugin
  "websocketpp" # Deps of Websocket plugin (headers-only lib)

  # Deps of obs-browser
  "cef-minimal-obs=103.0.0_5060_shared_textures_2594+g17f8588+chromium_103.0.5060.134_1"
)
optdepends=(
  "jack: JACK support"
  "libfdk-aac: FDK AAC codec support"
  "libvpl: QSV encoder support"
  "intel-media-sdk: QSV encoder support(<= Rocket Lake & >= Broadwell)"
  "vpl-gpu-rt: QSV encoder support (>= Alder Lake)"
  "intel-media-driver: VAAPI encoder support (>= Broadwell)"
  "libva-intel-driver: VAAPI encoder support (<= Haswell)"
  "libva-mesa-driver: VAAPI encoder support"
  "swig: Scripting"
  "luajit: Lua scripting"
  "python>=$_pythonver: Python scripting"
  "sndio: Sndio input client"
  "v4l-utils: V4L2 support"
  "systemd-libs: V4L2 support"
  "v4l2loopback-dkms: V4L2 virtual camera output"
  "libdatachannel>=$_libdatachannelver: WHIP Support"
  "libajantv2>=$_libajantv2ver: AJA support"
)
provides=("obs-studio=$pkgver" "obs-vst" "obs-websocket" "obs-browser")
conflicts=("obs-studio" "obs-websocket" "obs-browser" "obs-linuxbrowser" "obs-studio-tytan652" "obs-studio-git" "obs-studio-amf" "obs-studio-browser")
source=(
  "obs-studio::git+https://github.com/obsproject/obs-studio.git#tag=$pkgver"
  "obs-browser::git+https://github.com/obsproject/obs-browser.git"
  "obs-websocket::git+https://github.com/obsproject/obs-websocket.git"
  "ftl-sdk::git+https://github.com/microsoft/ftl-sdk.git"
  "supported-nv-codec-headers::git+https://github.com/FFmpeg/nv-codec-headers.git#tag=n12.1.14.0"
  #"0004-Max_tls_v1_2_mbedtls_3_6_0_workaround.patch"
)
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  #"c397a8da291547c757a42f7727a5e6650aa70e6e531f2ef150356eb9eb1fb49c"
)

prepare() {
  cd "$srcdir/obs-studio"
  git config submodule.plugins/obs-browser.url $srcdir/obs-browser
  git config submodule.plugins/obs-websocket.url $srcdir/obs-websocket
  git config submodule.plugins/obs-outputs/ftl-sdk.url $srcdir/ftl-sdk
  git -c protocol.file.allow=always submodule update

  # MbedTLS 3.6.0 broke stuff with TLS v1.3 (Thanks tytan652)
  # patch -Np1 -i "$srcdir/0004-Max_tls_v1_2_mbedtls_3_6_0_workaround.patch"

  cd "$srcdir"
  make PREFIX="$srcdir/nv-prefix" -C supported-nv-codec-headers install
}

build() {
  export PKG_CONFIG_PATH="${srcdir}/nv-prefix/lib/pkgconfig"

  cmake -B build -S obs-studio \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DOBS_CMAKE_VERSION=3 \
    -DENABLE_LIBFDK=ON \
    -DENABLE_JACK=ON \
    -DENABLE_SNDIO=ON \
    -DENABLE_BROWSER=ON \
    -DCEF_ROOT_DIR=/opt/cef-obs \
    -DOBS_VERSION_OVERRIDE="$pkgver" \
    -DOBS_COMPILE_DEPRECATION_AS_WARNING=ON \
    -Wno-dev \
    -DCMAKE_INCLUDE_PATH="${srcdir}/nv-prefix/include:/usr/include"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
