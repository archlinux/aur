# Maintainer: Benjamin Klettbach <b dot klettbach at gmail dot com >
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: ArcticVanguard <LideEmily at gmail dot com>
# Contributor: ledti <antergist at gmail dot com>

## options
: ${_plugin_aja:=false}

# build-aux/modules/99-cef.json
: ${_cef_branch:=6533}
: ${_cef_ver=_v6}

_pkgname="obs-studio"
pkgname="$_pkgname-git"
pkgver=32.0.1.r0.g0b12296
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

provides=("obs-studio=$pkgver")
conflicts=("obs-studio")

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

  _cef_src="cef_binary_${_cef_branch}_linux_${CARCH}"
  _cef_ext="tar.xz"
  _cef_filename="$_cef_src$_cef_ver.$_cef_ext"
  _cef_dl_url="https://cdn-fastly.obsproject.com/downloads"

  source+=("$_cef_filename"::"$_cef_dl_url/$_cef_filename")
  sha256sums+=('SKIP')
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
  gitconf="protocol.file.allow=always"

  git config submodule.plugins/obs-browser.url $srcdir/obs-browser
  git config submodule.plugins/obs-websocket.url $srcdir/obs-websocket
  git -c $gitconf submodule update
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
    -DENABLE_UNIT_TESTS=OFF
    -DBUILD_TESTS=OFF
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
