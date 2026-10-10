# Maintainer: Caleb Maclennan <caleb@alerque.com>

_obs_studio=obs-studio
pkgbase=obs-rust-git
pkgname=("$_obs_studio-rust-git" "$_obs_studio-rust-plugin-browser-git")
pkgver=32.2.2.r373.gad60c0e
pkgrel=2
pkgdesc="Free, open source software for live streaming and recording"
arch=('x86_64')
url="https://github.com/${pkgbase%-git}"
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
source=(
  "$pkgbase::git+$url/$_obs_studio.git"
  "${pkgbase}-libdshowcapture::git+$url/libdshowcapture.git"
  "${pkgbase}-obs-browser::git+$url/obs-browser.git"
  "${pkgbase}-obs-websocket::git+$url/obs-websocket.git"
)
sha256sums=('SKIP'
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

pkgver() {
  cd "$pkgbase"
  local _version=$(git tag | grep -Ev '.*[a-z]{2}.*' | sort -rV | head -1)
  local _revision=$(git rev-list --count --cherry-pick "$_version"...HEAD)
  local _hash=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
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
    -DOBS_VERSION_OVERRIDE="$pkgver"
    -DCALM_DEPRECATION=ON
    -DENABLE_WEBSOCKET=ON
    -DENABLE_RUST_LIBOBS=ON
    -Wno-dev
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package_obs-studio-rust-git() {
  provides=("$_obs_studio-rust=${pkgver%%.g*}" "obs-studio=${pkgver%%.g*}")
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

package_obs-studio-rust-plugin-browser-git() {
  provides=("$_obs_studio-rust-plugin-browser=$pkgver" "obs-studio-plugin-browser=$pkgver")
  pkgdesc="CEF-based OBS Studio browser plugin"
  url="https://obsproject.com/kb/browser-source"
  depends=('cef' 'glibc' 'libgcc' 'libstdc++' 'libx11' "$_obs_studio-rust" 'qt6-base')

  cd build/plugins
  install -Dm755 obs-browser/obs-browser-page obs-browser/obs-browser.so -t $pkgdir/usr/lib/obs-plugins/
  install -d $pkgdir/usr/share/obs/obs-plugins/
  cp -a obs-browser $pkgdir/usr/share/obs/obs-plugins/
}
