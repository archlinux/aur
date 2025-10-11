# Maintainer: tytan652 <tytan652 at tytanium dot xyz>
# Contributor: Alice Gaudon <alice at gaudon dot pro>
# Contributor: Benjamin Klettbach <b dot klettbach at gmail dot com>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: ArcticVanguard <LideEmily at gmail dot com>
# Contributor: ledti <antergist at gmail dot com>

_suffix=browser
pkgname="obs-studio-${_suffix}"
_pkgver=32.0.1
pkgver="${_pkgver//-/_}"
pkgrel=4
pkgdesc="Free and open source software for video recording and live streaming. With everything except service integration"
arch=("x86_64" "aarch64")
url="https://github.com/obsproject/obs-studio"
license=('GPL-2.0-or-later')
# To manage dependency rebuild easily, this will prevent you to rebuild OBS on non-updated system
_qtver=6.10
_libajantv2ver=17.5.0
_libdatachannelver=0.23
_mbedtlsver=3.6.1
_pythonver=3.13
depends=(
  "alsa-lib" # Deps of ALSA plugin and CEF
  "curl" # Deps of OBS Studio and rtmp-services plugin
  "ffmpeg-obs>=8" # Deps of OBS Studio and FFmpeg plugin
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
  "rnnoise" # Deps if the filter plugin
  "simde" # Deps of libobs and its headers
  "sndio" # Deps of sndio plugin
  "speexdsp" # Deps if the filter plugin
  "srt" # Deps of FFmpeg plugin
  "systemd-libs" # Deps of V4L2 plugin
  "util-linux-libs" # Deps of libobs
  "v4l-utils" # Deps of V4L2 plugin
  "vlc-luajit" # Deps of VLC Plugin ("vlc" issue crashes)
  "wayland" # Deps of libobs, libobs-opengl and CEF
  "x264" # Deps of the X264 plugin
  "zlib" # Deps of libobs

  # Deps of CEF
  "at-spi2-core" "cairo" "dbus" "expat" "libcups" "libdrm"
  "libxdamage" "libxext" "libxfixes" "libxrandr" "mesa" "nspr"
  "nss" "pango"
)
## About vlc-luajit
# The official VLC package will make OBS crash when a VLC source is used.
# The issue is that VLC and OBS are compiled with different lua version.
# So I also created vlc-luajit, a VLC package compiled with the same lua as OBS.
# But to make people unable to install VLC official package with obs-studio-tytan652.
# I decided to make vlc-luajit a dependency of OBS rather than an optional one.
## About ffmpeg-obs
# Read ffmpeg-obs PKGBUILD for more info
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
conflicts=(
  "obs-studio" "obs-vst" "obs-websocket" "obs-browser"
  "obs-linuxbrowser" # This plugin is obsolete
  "libva-vdpau-driver" # This driver is abandonned and make OBS segfault if it happen to be loaded, try libva-nvidia-driver is you really need Nvidia decode through VAAPI
)
options=('debug')
source=(
  "obs-studio::git+https://github.com/obsproject/obs-studio.git#tag=$_pkgver"
  "obs-browser::git+https://github.com/obsproject/obs-browser.git"
  "obs-websocket::git+https://github.com/obsproject/obs-websocket.git"
  "12328-Cleanup_Qt_Gui_Private_linkage.patch" # https://github.com/obsproject/obs-studio/pull/12328
)
source_x86_64=("https://cdn-fastly.obsproject.com/downloads/cef_binary_6533_linux_x86_64_v6.tar.xz")
source_aarch64=("https://cdn-fastly.obsproject.com/downloads/cef_binary_6533_linux_aarch64_v6.tar.xz")
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
  "25322c692cf5cc88fc7d17cbb40a61b7e32d5ea675da647dd1a1996474ec2c8e"
)
sha256sums_x86_64=("7963335519a19ccdc5233f7334c5ab023026e2f3e9a0cc417007c09d86608146")
sha256sums_aarch64=("642514469eaa29a5c887891084d2e73f7dc2d7405f7dfa7726b2dbc24b309999")

if [[ ${CARCH/%_v?/} == 'x86_64' ]]; then
  optdepends+=("decklink: Blackmagic Design DeckLink support")
fi

prepare() {
  cd "$srcdir/obs-studio"
  git config submodule.plugins/obs-browser.url $srcdir/obs-browser
  git config submodule.plugins/obs-websocket.url $srcdir/obs-websocket
  git -c protocol.file.allow=always submodule update

  ## Mark log and titlebar version
  sed -i "s|obs_get_version_string()|\"$_pkgver-$_suffix-$pkgrel\"|" frontend/OBSApp.cpp

  ## frontend: Cleanup Qt GuiPrivate linkage (https://github.com/obsproject/obs-studio/pull/12328)
  patch -Np1 -i "$srcdir/12328-Cleanup_Qt_Gui_Private_linkage.patch"
}

build() {
  cmake -B build -S obs-studio \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_C_FLAGS="-DNDEBUG" \
    -DCMAKE_CXX_FLAGS="-DNDEBUG" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_LIBFDK=ON \
    -DENABLE_JACK=ON \
    -DENABLE_SNDIO=ON \
    -DENABLE_BROWSER=ON \
    -DCEF_ROOT_DIR="$srcdir/cef_binary_6533_linux_${CARCH/%_v?/}" \
    -DOBS_VERSION_OVERRIDE="$_pkgver" \
    -DOBS_COMPILE_DEPRECATION_AS_WARNING=ON \
    -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
