# Maintainer: Konstantin Liberty <jon9097 at gmail dot com>

pkgname=obs-studio-liberty
pkgver=32.0.2
pkgrel=2
pkgdesc="Free, open source software for live streaming and recording. With Browser Source support. Without the need to install ffmpeg-obs, etc."
arch=('x86_64')
url="https://github.com/obsproject/obs-studio"
license=('GPL-2.0-or-later')
_qtver=6.10.0
_libajantv2ver=17.5.0
_libdatachannelver=0.24
_mbedtlsver=3.6.1
_pythonver=3.13
_cefver=cef_binary_6533_linux_x86_64_v6
depends=(
  "alsa-lib" # Deps of ALSA plugin and CEF
  "curl" # Deps of OBS Studio and rtmp-services plugin
  "ffmpeg>=8" # Deps of OBS Studio and FFmpeg plugin
  "fontconfig" # Deps of Freetype2 plugin
  "freetype2" # Deps of Freetype2 plugin
  "gcc-libs" # Deps of any C++ related binary
  "glib2" # Deps of libobs, PipeWire plugin and CEF
  "glibc" # Deps of any C related binary
  "jack" # Deps of JACK plugin
  "jansson" # Deps of libobs and rtmp-services plugin
  "libajantv2>=$_libajantv2ver" # Deps of AJA plugins
  "libdatachannel>=$_libdatachannelver" # Deps of WebRTC plugin (NICE variant like the Flatpak)
  "libfdk-aac" # Deps of FDK AAC plugin
  "libgl" # Deps of libobs-opengl and OBS Studio
  "libjuice" # UDP Interactive Connectivity Establishment (ICE) library
  "libpipewire" # Deps of the PipeWire plugin
  "libpulse" # Deps of PulseAudio monitoring (in libobs) and PulseAudio plugin
  "librist" # Deps of FFmpeg plugin
  "libva" # Deps of FFmpeg plugin and QSV plugin
  "libvpl" # Deps of QSV plugin
  "libx11" # Deps of libobs, libobs-opengl, X11 Capture plugin, frontend tools plugin, obs-browser and CEF
  "libxcb" # Deps of libobs-opengl, X11 Capture plugin and CEF
  "libxcomposite" # Deps of the X11 capture plugin
  "libxkbcommon" # Deps of libobs, OBS Studio and CEF
  "luajit" # Deps of Scripting plugin
  "mbedtls>=$_mbedtlsver" # Deps of OBS Studio and Outputs plugin
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
conflicts=("obs-studio" "obs-websocket" "obs-browser" "obs-linuxbrowser" "obs-studio-tytan652" "obs-studio-git" "obs-studio-amf" "obs-studio-browser" "obs-vst")
source=(
  "obs-studio::git+https://github.com/obsproject/obs-studio.git#tag=$pkgver"
  "obs-browser::git+https://github.com/obsproject/obs-browser.git"
  "obs-websocket::git+https://github.com/obsproject/obs-websocket.git"
  "https://cdn-fastly.obsproject.com/downloads/$_cefver.tar.xz"
  "qt_fix.patch"
)
sha512sums=(
  "SKIP"
  "SKIP"
  "SKIP"
  "790da9bf3a2495eb6d4d155ae89adea88a45f496b5996278d72df47a1dea662241b2b73d93be7fc56f83186805c591dcd718266575a74d1b25b6b93379ce74b3"
  "421e5d95869cab6abe621a04ad552c1e419b714c970dfecd3517b8aec1eba638fd56694ad76fbc843f3a9eda7c9ffb077ffde2a59084fae73b56a3ad1a0f6c9f"
)

prepare() {
  cd "$srcdir/obs-studio"
  git config submodule.plugins/obs-browser.url $srcdir/obs-browser
  git config submodule.plugins/obs-websocket.url $srcdir/obs-websocket

  #git checkout 5e7804c1376a7cc40c0270a8b6edd5a6ece8272f

  git -c protocol.file.allow=always submodule update

  patch -Np1 -i $srcdir/qt_fix.patch

}

build() {

  cmake -B build -S obs-studio \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_LIBFDK=ON \
    -DENABLE_JACK=ON \
    -DENABLE_SNDIO=ON \
    -DENABLE_BROWSER=ON \
    -DENABLE_NVENC=ON \
    -DCEF_ROOT_DIR="$srcdir/${_cefver/%_v?/}" \
    -DOBS_VERSION_OVERRIDE="$pkgver" \
    -DOBS_COMPILE_DEPRECATION_AS_WARNING=ON \
    -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
