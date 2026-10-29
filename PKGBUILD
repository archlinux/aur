# Maintainer: Konstantin Liberty <jon9097 at gmail dot com>

pkgname=obs-studio-liberty
pkgver=33.0.1
pkgrel=1
pkgdesc="Free, open source software for live streaming and recording. With Browser Source support. Without the need to install ffmpeg-obs, etc."
arch=('x86_64')
url="https://github.com/obsproject/obs-studio"
license=('GPL-2.0-or-later')
_qtver=6.11.0
#_libajantv2ver=17.5.0
_libdatachannelver=0.24.5
_mbedtlsver=3.6.1
_pythonver=3.14
_cefver=cef_binary_7871_linux_x86_64
depends=(
  "alsa-lib" # Deps of ALSA plugin and CEF
  "curl" # Deps of OBS Studio and rtmp-services plugin
  "ffmpeg>=8" # Deps of OBS Studio and FFmpeg plugin
  "fontconfig" # Deps of Freetype2 plugin
  "freetype2" # Deps of Freetype2 plugin
  "glib2" # Deps of libobs, PipeWire plugin and CEF
  "glibc" # Deps of any C related binary
  "jack" # Deps of JACK plugin
  "jansson" # Deps of libobs and rtmp-services plugin
#  "libajantv2>=$_libajantv2ver" # Deps of AJA plugins
  "libdatachannel>=$_libdatachannelver" # Deps of WebRTC plugin (NICE variant like the Flatpak)
  "libfdk-aac" # Deps of FDK AAC plugin
  "libgcc" # GCC runtime library
  "libgl" # Deps of libobs-opengl and OBS Studio
  "libjuice" # UDP Interactive Connectivity Establishment (ICE) library
  "libpipewire" # Deps of the PipeWire plugin
  "libpulse" # Deps of PulseAudio monitoring (in libobs) and PulseAudio plugin
  "librist" # Deps of FFmpeg plugin
  "libstdc++" # GNU C++ standard library
  "libva" # Deps of FFmpeg plugin and QSV plugin
  "libvpl" # Deps of QSV plugin
  "libx11" # Deps of libobs, libobs-opengl, X11 Capture plugin, frontend tools plugin, obs-browser and CEF
  "libxcb" # Deps of libobs-opengl, X11 Capture plugin and CEF
  "libxcomposite" # Deps of the X11 capture plugin
  "libxkbcommon" # Deps of libobs, OBS Studio and CEF
  "luajit" # Deps of Scripting plugin
  "mbedtls3>=$_mbedtlsver" # Deps of OBS Studio and Outputs plugin
  "pciutils" # Deps of FFmpeg plugin
  "python>=$_pythonver" # Deps of Scripting plugin
  "qrcodegencpp-cmake" # Deps of Websocket plugin
  "qt6-base>=$_qtver" # Deps of OBS Studio and any frontend plugin
  "qt6-svg>=$_qtver" # Deps of OBS Studio
  "qt6-wayland>=$_qtver" # Needed to use Qt on Wayland platform
  "rnnoise" # Deps if the filter plugin
  "simde" # Implementations of SIMD instruction sets
  "sndio" # Deps of sndio plugin
  "speexdsp" # Deps if the filter plugin
  "srt" # Deps of FFmpeg plugin
  "systemd-libs" # Deps of V4L2 plugin
  "util-linux-libs" # Deps of libobs
  "v4l-utils" # Deps of V4L2 plugin
  "vlc" # It is necessary to build the package and work
  "wayland" # Deps of libobs, libobs-opengl and CEF
  "x264" # Deps of the X264 plugin
  "zlib" # Deps of libobs

  # Deps of CEF
  "at-spi2-core" "cairo" "dbus" "expat" "libcups" "libdrm"
  "libxdamage" "libxext" "libxfixes" "libxrandr" "mesa" "nspr"
  "nss" "pango"
)

makedepends=(
  "asio" # Deps of Websocket plugin (headers-only lib)
  "cmake"
  "extra-cmake-modules"
  "ffnvcodec-headers" # Deps of NVENC plugin (headers-only lib)
  "git"
  "uthash" # Deps of libobs (headers-only lib)
  "nlohmann-json" # Deps of Websocket plugin (headers-only lib)
  "swig" # Deps of Scripting plugin
  "websocketpp" # Deps of Websocket plugin (headers-only lib)
)

optdepends=(
  "intel-media-sdk: QSV encoder support(<= Rocket Lake & >= Broadwell)"
  "vpl-gpu-rt: QSV encoder support (>= Alder Lake)"
  "intel-media-driver: VAAPI encoder support (>= Broadwell)"
  "libva-intel-driver: VAAPI encoder support (<= Haswell)"
  "libva-mesa-driver: VAAPI encoder support"
  "v4l2loopback-dkms: V4L2 virtual camera output"
)

provides=("obs-studio=$pkgver" "obs-vst" "obs-websocket" "obs-browser")
conflicts=("obs-studio" "obs-websocket" "obs-browser" "obs-linuxbrowser" "obs-studio-tytan652" "obs-studio-git" "obs-studio-amf" "obs-studio-browser" "obs-vst" "obs-studio-plugin-browser")
source=(
  "obs-studio::git+https://github.com/obsproject/obs-studio.git#tag=$pkgver"
  "obs-browser::git+https://github.com/obsproject/obs-browser.git"
  "obs-websocket::git+https://github.com/obsproject/obs-websocket.git"
  "https://cdn-fastly.obsproject.com/downloads/$_cefver.tar.xz"
  #"qt_fix.patch"
)

sha512sums=('845b955a65ff9357ca870756748abe5c790122f7e89dc726986c036e638e734bd0add63850a948eb01c04fe323ade66a74fd4e69e5206943439fe62919fc81a6'
            'SKIP'
            'SKIP'
            'd5ffabfe40d0c3cfad3a6e7522c9352d05bdc6330615e3f42eddfe787e82e8c21a0d7b323aaae3a1fb52e2a377d218624fc60dc1ae88762c8eb16d589f368289')

prepare() {
  cd "$srcdir/obs-studio"
  git config submodule.plugins/obs-browser.url $srcdir/obs-browser
  git config submodule.plugins/obs-websocket.url $srcdir/obs-websocket

  #git checkout 5e7804c1376a7cc40c0270a8b6edd5a6ece8272f

  git -c protocol.file.allow=always submodule update

  #patch -Np1 -i $srcdir/qt_fix.patch

}

# build() {
#
#   cmake -B build -S obs-studio \
#     -DCMAKE_BUILD_TYPE=Release \
#     -DCMAKE_INSTALL_PREFIX=/usr \
#     -DCMAKE_INSTALL_LIBDIR=lib \
#     -DENABLE_LIBFDK=ON \
#     -DENABLE_JACK=ON \
#     -DENABLE_SNDIO=ON \
#     -DENABLE_AJA=OFF \
#     -DENABLE_BROWSER=ON \
#     -DENABLE_NVENC=ON \
#     -DCEF_ROOT_DIR="$srcdir/${_cefver/%_v?/}" \
#     -DOBS_VERSION_OVERRIDE="$pkgver" \
#     -DOBS_COMPILE_DEPRECATION_AS_WARNING=ON \
#     -Wno-dev
#
#   cmake --build build
# }

build() {

local cmake_options=(
    -B build
    -S obs-studio
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib
    -DENABLE_LIBFDK=ON
    -DENABLE_JACK=ON
    -DENABLE_SNDIO=ON
    -DENABLE_AJA=OFF
    -DENABLE_BROWSER=ON
    -DENABLE_NVENC=ON
    -DCEF_ROOT_DIR="$srcdir/${_cefver/%_v?/}"
    -DOBS_VERSION_OVERRIDE="$pkgver"
    -DOBS_COMPILE_DEPRECATION_AS_WARNING=ON

    # Support mbedtls 3
    -DMbedTLS_DIR="/usr/lib/mbedtls3/cmake/MbedTLS"
    -DMbedTLS_INCLUDE_DIR="/usr/include/mbedtls3"
    -DMbedtls_LIBRARY="/usr/lib/mbedtls3/libmbedtls.so"
    -DMbedcrypto_LIBRARY="/usr/lib/mbedtls3/libmbedcrypto.so"
    -DMbedx509_LIBRARY="/usr/lib/mbedtls3/libmbedx509.so"

    -Wno-dev
)
  cmake "${cmake_options[@]}"
  cmake --build build
}


package() {
  DESTDIR="$pkgdir" cmake --install build
}
