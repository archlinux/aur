# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

pkgname=obs-studio-rc
_pkgver=29.1.0-beta4
pkgver=${_pkgver//-/_}
pkgrel=1
epoch=5
pkgdesc="Beta cycle of the free and open source software for video recording and live streaming. With everything except service integration"
arch=("x86_64" "aarch64")
url="https://github.com/obsproject/obs-studio"
license=("GPL3")
# To manage dependency rebuild easily, this will prevent you to rebuild OBS on non-updated system
_mbedtlsver=2.28
_pythonver=3.10
depends=(
  "jack" "gtk-update-icon-cache" "x264" "rnnoise" "pciutils" "qt6-svg"
  "mbedtls>=$_mbedtlsver"

  # "libxinerama" provided by "vlc-luajit"
  # "libxkbcommon-x11" provided by "qt6-base"
  # "jansson" "curl" provided by "ftl-sdk"

  # Needed to use Qt on Wayland platform
  "qt6-wayland"

  # Both needed to load linux-capture, so those two are no longer optional
  "libxcomposite" "pipewire"

  # Needed to use PipeWire capture
  "xdg-desktop-portal"

  # Needed by obs-browser
  "libxss" "libxrandr" "nss" "at-spi2-core"
         
  # AUR Packages
  "ffmpeg-obs>=6" "vlc-luajit" "ftl-sdk"
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
  "cmake" "git" "libfdk-aac" "swig" "luajit" "sndio"
  "python>=$_pythonver"

  # Needed by obs-websocket
  'asio' 'nlohmann-json' 'websocketpp'

  # AUR Packages
  "libajantv2"

  "cef-minimal-obs=103.0.0_5060_shared_textures_143.2591+g4204d54+chromium_103.0.5060.134_1"
)
optdepends=(
  "libfdk-aac: FDK AAC codec support"
  "intel-media-driver: Hardware encoding (>= Broadwell)"
  "libva-intel-driver: Hardware encoding (<= Haswell)"
  "libva-mesa-driver: Hardware encoding"
  "swig: Scripting"
  "luajit: Lua scripting"
  "python>=$_pythonver: Python scripting"
  "sndio: Sndio input client"
  "v4l2loopback-dkms: Virtual camera output"
  "libajantv2: AJA NTV 2 support"
)
provides=("obs-studio=$pkgver" "obs-vst" "obs-websocket")
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
  "qr::git+https://github.com/nayuki/QR-Code-generator.git"
)
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
)

if [[ $CARCH == 'x86_64' ]]; then
  optdepends+=("decklink: Blackmagic Design DeckLink support")
fi

prepare() {
  cd "$srcdir/obs-studio"
  git config submodule.plugins/obs-browser.url $srcdir/obs-browser
  git config submodule.plugins/obs-websocket.url $srcdir/obs-websocket
  git -c protocol.file.allow=always submodule update

  cd plugins/obs-websocket
  git config submodule.deps/qr.url $srcdir/qr
  git -c protocol.file.allow=always submodule update deps/qr
}

build() {
  cd "$srcdir"/obs-studio
  mkdir -p build; cd build

  cmake \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_RTMPS=ON \
    -DQT_VERSION=6 \
    -DENABLE_LIBFDK=ON \
    -DENABLE_JACK=ON \
    -DENABLE_SNDIO=ON \
    -DENABLE_BROWSER=ON \
    -DCEF_ROOT_DIR=/opt/cef-obs \
    -DBETA="$_pkgver" ..
#    -DOBS_VERSION_OVERRIDE="$_pkgver" ..
#    -DRELEASE_CANDIDATE="$_pkgver" ..

  sed -i "s|#define OBS_VERSION |#define OBS_VERSION \"$_pkgver-rc-$pkgrel\" //|" config/obsconfig.h

  make
}

package() {
  cd obs-studio/build

  make install DESTDIR="$pkgdir"
}
