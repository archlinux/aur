# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

DISTRIB_ID=`lsb_release --id | cut -f2 -d$'\t'`

pkgname=obs-studio-tytan652
pkgver=29.0.2
pkgrel=1
pkgdesc="Free and open source software for video recording and live streaming. With everything except service integrations. Plus V4L2 devices by paths, my bind interface PR, and sometimes backported fixes"
arch=("x86_64" "aarch64")
url="https://github.com/obsproject/obs-studio"
license=("GPL3")
_mbedtlsver=2.28
_pythonver=3.10
depends=(
  "jack" "gtk-update-icon-cache" "x264" "rnnoise" "pciutils" "qt6-svg"

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
  "ffmpeg-obs>=5" "vlc-luajit" "ftl-sdk"
)
# To manage mbedtls rebuild easily, this will prevent you to rebuild OBS on non-updated system
# For Manjaro user this feature is disabled
# Also OBS will need a patch when mbedtls 3 is on the repo
if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
  depends+=('mbedtls')
else
  depends+=("mbedtls>=$_mbedtlsver")
fi
## About vlc-luajit
# The official VLC package will make OBS crash when a VLC source is used.
# The issue is that VLC and OBS are compiled with different lua version.
# So I also created vlc-luajit, a VLC package compiled with the same lua as OBS.
# But to make people unable to install VLC official package with obs-studio-tytan652.
# I decided to make vlc-luajit a dependency of OBS rather than an optional one.
## About ffmpeg-obs
# Read ffmpeg-obs PKGBUILD for more info
makedepends=(
  "cmake" "git" "libfdk-aac" "swig" "luajit" "sndio" "lsb-release"

  # Needed by obs-websocket
  'asio' 'nlohmann-json' 'websocketpp'

  # AUR Packages
  "libajantv2"
)
# To manage python rebuild easily, this will prevent you to rebuild OBS on non-updated system
# For Manjaro user this feature is disabled
if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
  makedepends+=('python')
else
  makedepends+=("python>=$_pythonver")
fi
optdepends=(
  "libfdk-aac: FDK AAC codec support"
  "intel-media-driver: Hardware encoding (>= Broadwell)"
  "libva-intel-driver: Hardware encoding (<= Haswell)"
  "libva-mesa-driver: Hardware encoding"
  "swig: Scripting"
  "luajit: Lua scripting"
  "sndio: Sndio input client"
  "v4l2loopback-dkms: Virtual camera output"
  "libajantv2: AJA NTV 2 support"
)
# To manage python rebuild easily, this will prevent you to rebuild OBS on non-updated system
# For Manjaro user this feature is disabled
if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
  optdepends+=("python: Python scripting")
else
  optdepends+=("python>=$_pythonver: Python scripting")
fi
provides=("obs-studio=$pkgver" "obs-vst" "obs-websocket")
conflicts=(
  "obs-studio" "obs-vst" "obs-websocket"
  "libva-vdpau-driver" # This driver is abandonned and make OBS segfault if it happen to be loaded, try libva-nvidia-driver is you really need Nvidia decode through VAAPI
)
options=('debug')
source=(
  "obs-studio::git+https://github.com/obsproject/obs-studio.git#tag=$pkgver"
  "obs-browser::git+https://github.com/obsproject/obs-browser.git"
  "obs-websocket::git+https://github.com/obsproject/obs-websocket.git"
  "qr::git+https://github.com/nayuki/QR-Code-generator.git"
  "bind_iface.patch" # Based on https://patch-diff.githubusercontent.com/raw/obsproject/obs-studio/pull/4219.patch
  "v4l2_by-path.patch" # https://patch-diff.githubusercontent.com/raw/obsproject/obs-studio/pull/3437.patch
)
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "7a0c359d573ccf2951e4b621465338ee235cb7e535725fdb9bc53a7ff779da4e"
  "ee54b9c6f7e17fcc62c6afc094e65f18b2e97963c2fe92289b2b91972ac206e5"
)

if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
source+=(
  "$pkgname.hook"
  "$pkgname.sh"
)
sha256sums+=(
  "486b8297a7cabccd552a4d49f994b231f87860d32d4535906abf776eee2a377b"
  "4fb9dcb408f9481127546db0c5287e1f1b274d14cf8975b0f02c1bafb23a4c37"
)
fi

if [[ $CARCH == 'x86_64' ]]; then
  optdepends+=("decklink: Blackmagic Design DeckLink support")
fi

if [[ $CARCH == 'x86_64' ]]; then
  makedepends+=("cef-minimal-obs=103.0.0_5060_shared_textures_143.2591+g4204d54+chromium_103.0.5060.134_1")
  provides+=("obs-browser")
  conflicts+=(
    "obs-browser"
    "obs-linuxbrowser" # This plugin is obsolete
  )
  _browser=ON
else
  _browser=OFF
fi

prepare() {
  cd "$srcdir/obs-studio"
  git config submodule.plugins/obs-browser.url $srcdir/obs-browser
  git config submodule.plugins/obs-websocket.url $srcdir/obs-websocket
  git -c protocol.file.allow=always submodule update

  cd plugins/obs-websocket
  sed -i 's|EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/deps/json/CMakeLists.txt||' CMakeLists.txt
  sed -i 's|AND EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/deps/websocketpp/CMakeLists.txt||' CMakeLists.txt
  sed -i 's|AND EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/deps/asio/asio/include/asio.hpp||' CMakeLists.txt
  sed -i "s|AND EXISTS|EXISTS|" CMakeLists.txt
  sed -i "s|add_subdirectory(deps/json)|find_package(nlohmann_json 3.10.0 REQUIRED)|" CMakeLists.txt
  git config submodule.deps/qr.url $srcdir/qr
  git -c protocol.file.allow=always submodule update deps/qr

  cd "$srcdir/obs-studio"
  ## Add network interface binding for RTMP on Linux (https://github.com/obsproject/obs-studio/pull/4219)
  patch -Np1 < "$srcdir/bind_iface.patch"

  ## (not up to date for 29) linux-v4l2: Save device by id or path (https://github.com/obsproject/obs-studio/pull/6493)
  ## patch -Np1 < "$srcdir/v4l2_by-path.patch"
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
    -DENABLE_BROWSER=$_browser \
    -DCEF_ROOT_DIR=/opt/cef-obs \
    -DOBS_VERSION_OVERRIDE="$pkgver" ..

    sed -i "s|#define OBS_VERSION |#define OBS_VERSION \"$pkgver-tytan652-$pkgrel\" //|" config/obsconfig.h

  make
}

package() {
  cd obs-studio/build

  make install DESTDIR="$pkgdir"

  if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
    install -D -m644 "$srcdir/$pkgname.hook" -t "${pkgdir}"/usr/share/libalpm/hooks/
    install -D -m755 "$srcdir/$pkgname.sh" -t "${pkgdir}"/usr/share/libalpm/scripts/
  fi
}
