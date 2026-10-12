# Maintainer: Caleb Maclennan <caleb@alerque.com>

_obs_studio=obs-studio
pkgbase=obs-rust
pkgname=("$_obs_studio-rust" "$_obs_studio-rust-plugin-browser")
pkgver=0.1.0beta.20261012
pkgrel=1
pkgdesc="Free, open source software for live streaming and recording"
arch=('x86_64')
url="https://github.com/$pkgbase"
license=('GPL-2.0-only')
depends=('ffmpeg' 'jansson' 'libxinerama' 'libxkbcommon-x11' 'mbedtls3' 'rnnoise' 'pciutils'
         'qt6-svg' 'curl' 'jack' 'gtk-update-icon-cache' 'pipewire' 'libxcomposite'
         'libdatachannel' 'uthash' 'simde' 'qrcodegencpp-cmake' 'python' 'luajit')
makedepends=('cef' 'cmake' 'libfdk-aac' 'x264' 'swig' 'sndio' 'nlohmann-json'
             'ffnvcodec-headers' 'websocketpp' 'asio' 'extra-cmake-modules'
             'git' 'rust')
conflicts=("$_obs_studio"
           "$_obs_studio-plugin-browser"
)
_tag="$_obs_studio-rust-v${pkgver/beta/-beta}"
source=(
  "$pkgbase::git+$url/$_obs_studio.git#tag=$_tag"
  "${pkgbase}-libdshowcapture::git+$url/libdshowcapture.git"
  "${pkgbase}-obs-browser::git+$url/obs-browser.git"
  "${pkgbase}-obs-websocket::git+$url/obs-websocket.git"
)
sha256sums=('57d49493193b8daf10d5ce93cd854e9f587dafd31c43a56fdf160b161e0c2aa8'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "$pkgbase"

  git submodule init

  git config submodule."plugins/obs-browser".url "${srcdir}/${pkgbase}"-obs-browser
  git config submodule."plugins/obs-websocket".url "${srcdir}/${pkgbase}"-obs-websocket
  git config submodule."plugins/win-dshow/libdshowcapture".url "${srcdir}/${pkgbase}"-libdshowcapture

  git -c protocol.file.allow=always submodule update --init --recursive

  # use FindCEF provided by system CEF
  rm cmake/finders/FindCEF.cmake

  # set rpath to /usr/lib/cef for obs-browser plugin
  sed -e 's|INSTALL_RPATH ".*"|INSTALL_RPATH "/usr/lib/cef/"|' -i plugins/obs-browser/cmake/os-linux.cmake
}

build() {
  local _cef_api_version=$(grep -oP 'CEF_API_VERSION_LAST CEF_API_VERSION\_\K[0-9]+' /usr/include/cef/include/cef_api_versions.h)
  echo Setting CEF_API_VERSION to $_cef_api_version

  local cmake_options=(
    -B build
    -S $pkgbase
    -DCMAKE_INSTALL_PREFIX="/usr"
    -DCMAKE_COMPILE_WARNING_AS_ERROR=OFF
    -DMbedTLS_DIR="/usr/lib/mbedtls3/cmake/MbedTLS"
    -DENABLE_BROWSER=ON
    -DCEF_API_VERSION=$_cef_api_version
    -DENABLE_VST=ON
    -DENABLE_VLC=OFF
    -DENABLE_NEW_MPEGTS_OUTPUT=OFF
    -DENABLE_AJA=OFF
    -DENABLE_JACK=ON
    -DENABLE_LIBFDK=ON
    -DENABLE_WEBRTC=ON
    -DOBS_VERSION_OVERRIDE="${_tag#*-v}"
    -DCALM_DEPRECATION=ON
    -DENABLE_WEBSOCKET=ON
    -DENABLE_RUST_LIBOBS=ON
    -Wno-dev
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package_obs-studio-rust() {
  provides=("obs-studio=$pkgver")
  optdepends=('libfdk-aac: FDK AAC codec support'
              'libva-intel-driver: hardware encoding for older Intel GPUs'
              'intel-media-driver: hardware encoding for recent Intel GPUs'
              'libva-mesa-driver: hardware encoding'
              'sndio: Sndio input client'
              'v4l2loopback-dkms: virtual camera support'
              'xdg-desktop-portal-impl: Wayland window/screen capture'
              "$_obs_studio-plugin-browser: CEF-based browser plugin"
              )
  DESTDIR="$pkgdir" cmake --install build
}

package_obs-studio-rust-plugin-browser() {
  provides=("obs-studio-plugin-browser=$pkgver")
  pkgdesc="CEF-based OBS Studio browser plugin"
  url="https://obsproject.com/kb/browser-source"
  depends=('cef' 'glibc' 'libgcc' 'libstdc++' 'libx11' "$_obs_studio-rust" 'qt6-base')

  cd build/plugins
  install -Dm755 obs-browser/obs-browser-page obs-browser/obs-browser.so -t $pkgdir/usr/lib/obs-plugins/
  install -d $pkgdir/usr/share/obs/obs-plugins/
  cp -a obs-browser $pkgdir/usr/share/obs/obs-plugins/
}
