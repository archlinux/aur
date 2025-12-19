# Maintainer: Benjamin Klettbach <b dot klettbach at gmail dot com >
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: ArcticVanguard <LideEmily at gmail dot com>
# Contributor: ledti <antergist at gmail dot com>

## options
: ${_plugin_aja:=false}

_pkgname="obs-studio"
pkgname="$_pkgname-git"
pkgver=32.0.4.r25.g407944a
pkgrel=1
pkgdesc="Free, open source software for live streaming and recording"
url="https://github.com/obsproject/obs-studio"
license=("GPL-2.0-or-later")
arch=("i686" "x86_64")

depends=(
  'curl'
  'ffmpeg'
  'jack'
  'jansson'
  'libdatachannel'
  'libpipewire'
  'librist'
  'libvpl'
  'libxcomposite'
  'mbedtls'
  'pciutils'
  'qrcodegencpp-cmake'
  'qt6-svg'
  'rnnoise'
  'speexdsp'
)
makedepends=(
  'asio'
  'cmake'
  'extra-cmake-modules'
  'ffnvcodec-headers'
  'git'
  'libfdk-aac'
  'luajit'
  'ninja'
  'nlohmann-json'
  'python'
  'qt6-wayland'
  'simde'
  'sndio'
  'swig'
  'uthash'
  'vlc'
  'wayland'
  'websocketpp'
  'x264'
  'xdg-desktop-portal'
)
optdepends=(
  'libfdk-aac: FDK AAC codec support'
  'libva-intel-driver: hardware encoding'
  'libva-mesa-driver: hardware encoding'
  'luajit: scripting support'
  'python: scripting support'
  'sndio: sndio input client'
  'v4l2loopback-dkms: virtual camera support'
  'vlc: VLC Media Source'
)

if [ "${_plugin_aja::1}" == "t" ]; then
  depends+=('libajantv2') # AUR
  _plugin_aja='ON'
else
  _plugin_aja='OFF'
fi

provides=("$_pkgname=${pkgver%%.g*}")
conflicts=("$_pkgname")

options=('!lto' '!strip')

_source_main() {
  source=(
    "$pkgname::git+https://github.com/obsproject/obs-studio.git#branch=master"
    "git+https://github.com/obsproject/obs-browser.git"
    "git+https://github.com/obsproject/obs-websocket.git"
  )
  sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
  )
}

_source_cef() {
  depends+=(
    'at-spi2-core'
    'libxdamage'
    'libxrandr'
    'nspr'
    'nss'
  )

  local _response _response_cef _cef_dl_url _cef_hash _cef_filename
  _response=$(curl -Ssf --follow --retry 3 "$url/raw/refs/heads/master/build-aux/com.obsproject.Studio.json")
  _response_cef=$(grep -E -e '^\s*"(url|sha256)":' <<< "$_response" | grep -A1 cef_binary)

  _cef_dl_url=$(grep -Pom1 '"url": "\K[^"]+' <<< "$_response_cef")
  _cef_hash=$(grep -Pom1 '"sha256": "\K[0-9a-f]+' <<< "$_response_cef")
  _cef_filename=$(basename "$_cef_dl_url")
  _cef_src=$(sed -E 's&(_v[0-9]+)?\..*$&&' <<< "$_cef_filename")

  source+=("$_cef_filename"::"$_cef_dl_url")
  sha256sums+=("$_cef_hash")
}

_source_main
_source_cef

pkgver() {
  cd "$pkgname"
  local _version=$(git tag | grep -Ev '.*[a-z]{2}.*' | sort -rV | head -1)
  local _revision=$(git rev-list --count --cherry-pick "$_version"...HEAD)
  local _hash=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
}

prepare() {
  cd "$pkgname"
  local gitconf="protocol.file.allow=always"

  git rm -r deps/libdshowcapture/src
  git config submodule.plugins/obs-browser.url $srcdir/obs-browser
  git config submodule.plugins/obs-websocket.url $srcdir/obs-websocket
  git -c $gitconf submodule update

  # fix for Qt 6.10
  sed -e 's&Qt::GuiPrivate&&' \
    -i frontend/cmake/os-freebsd.cmake frontend/cmake/os-linux.cmake

  sed -e '/GuiPrivate/d' \
    -i frontend/plugins/aja-output-ui/CMakeLists.txt \
    frontend/plugins/decklink-output-ui/CMakeLists.txt \
    frontend/plugins/frontend-tools/CMakeLists.txt
}

build() (
  export CFLAGS CXXFLAGS
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=?/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=?/_FORTIFY_SOURCE=2}"

  local _cmake_options=(
    -B build
    -S "$pkgname"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib'
    -DCEF_ROOT_DIR="$srcdir/$_cef_src"
    -DOBS_VERSION_OVERRIDE="${pkgver%%.r*}"
    -DOBS_COMPILE_DEPRECATION_AS_WARNING=ON
    -DENABLE_BROWSER=ON # qrcodegencpp-cmake
    -DENABLE_LIBFDK=ON
    -Wno-dev

    -DENABLE_AJA="${_plugin_aja:?}"
    -DENABLE_JACK=ON
    -DENABLE_NEW_MPEGTS_OUTPUT=ON
    -DENABLE_VLC=ON
    -DENABLE_VST=ON
    -DENABLE_WEBRTC=ON
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
)

package() {
  DESTDIR="$pkgdir" cmake --install build
  chmod -R u+rwX,go+rX,go-w "$pkgdir"
}

# vim: ts=2:sw=2:expandtab
