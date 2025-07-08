# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

_suffix=tytan652
pkgname="obs-studio-${_suffix}"
_pkgver=31.1.0
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc="Free and open source software for video recording and live streaming. With everything except service integrations. Plus my bind interface PR, and sometimes backported fixes"
arch=("x86_64" "aarch64")
url="https://github.com/obsproject/obs-studio"
license=('GPL-2.0-or-later')
# To manage dependency rebuild easily, this will prevent you to rebuild OBS on non-updated system
_qtver=6.6.2
_libajantv2ver=17.0.1
_libdatachannelver=0.22
_mbedtlsver=3.6.1
_pythonver=3.13
depends=(
  "alsa-lib" # Deps of ALSA plugin and CEF
  "curl" # Deps of OBS Studio and rtmp-services plugin
  "ffmpeg-obs>=7.1" # Deps of OBS Studio and FFmpeg plugin
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
  "bind_iface_eyeballed.patch" # Based on https://github.com/tytan652/obs-studio/commits/bind_iface_eyeballed3
  "v4l2_by-path.patch" # https://patch-diff.githubusercontent.com/raw/obsproject/obs-studio/pull/3437.patch
)
source_x86_64=("https://cdn-fastly.obsproject.com/downloads/cef_binary_6533_linux_x86_64_v3.tar.xz")
source_aarch64=("https://cdn-fastly.obsproject.com/downloads/cef_binary_6533_linux_aarch64_v4.tar.xz")
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
  "f98822ce22f53c83df36a3db888762598a62092daf2f45fd982e0242789cf10f"
  "ee54b9c6f7e17fcc62c6afc094e65f18b2e97963c2fe92289b2b91972ac206e5"
)
sha256sums_x86_64=("cb7225c7a937ac4cdc9c41700061f45cccc640d696902357782e57f8250bf43a")
sha256sums_aarch64=("e82388ef61776a88701b37d96e44f65dcc91f4d4f205f4f17cdc0d50f4e6a7a7")

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

  ## Add network interface binding for RTMP on Linux (https://github.com/tytan652/obs-studio/commits/bind_iface_eyeballed)
  patch -Np1 < "$srcdir/bind_iface_eyeballed.patch"
}

build() {
  cmake -B build -S obs-studio \
    -DCMAKE_BUILD_TYPE=None \
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
