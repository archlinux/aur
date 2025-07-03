# Maintainer:
# Contributor: XenHat <me at xenh.at>
# Contributor: SoftwareRat <jaguar5018@gmail.com>
# Contributor: Michael Herzberg <{firstname}@{firstinitial}{lastname}.de>

: ${_ffmpeg:=ffmpeg}

_pkgname="moonlight-qt"
pkgname="$_pkgname-git"
pkgver=6.1.0.r78.g1dbdcb5
pkgrel=1
pkgdesc='GameStream client for PCs'
url="https://github.com/moonlight-stream/moonlight-qt"
license=('GPL-3.0-or-later')
arch=('aarch64' 'x86_64')

depends=(
  "$_ffmpeg"
  'qt6-base'
  'qt6-declarative'
  'qt6-svg'
  'sdl2_ttf'
)
makedepends=(
  'git'
  'vulkan-headers'
)
optdepends=(
  'libva-intel-driver: hardware acceleration for Intel GPUs GMA 4500 (2008) up to Coffee Lake (2017)'
  'intel-media-driver: hardware acceleration for Intel GPUs starting from Broadwell (2014) and newer (e.g. Intel Arc)'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_source_main() {
  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')
}

_source_moonlight_qt() {
  local _sources_add=(
    'aizvorski.h264bitstream'::'git+https://github.com/aizvorski/h264bitstream.git'::'h264bitstream/h264bitstream'
    'cgutman.libsoundio'::'git+https://github.com/cgutman/libsoundio.git'::'soundio/libsoundio'
    #'cgutman.moonlight-qt-prebuilts'::'git+https://github.com/cgutman/moonlight-qt-prebuilts.git'::'libs'
    'cgutman.qmdnsengine'::'git+https://github.com/cgutman/qmdnsengine.git'::'qmdnsengine/qmdnsengine'
    'gabomdq.sdl_gamecontrollerdb'::'git+https://github.com/gabomdq/SDL_GameControllerDB.git'::'app/SDL_GameControllerDB'
    'moonlight-stream.moonlight-common-c'::'git+https://github.com/moonlight-stream/moonlight-common-c.git'::'moonlight-common-c/moonlight-common-c'
  )

  local _p _idx _src _sm_prep _sm_func
  for _p in ${_sources_add[@]}; do
    _idx="${_p%%::*}"
    _sm_prep+=("${_idx}::${_p##*::}")
    _src="${_p%::*}"
    source+=("$_src")
    sha256sums+=('SKIP')
  done

  eval "_prepare_moonlight_qt() (
    cd \"\$srcdir/\$_pkgsrc\"
    local _submodules=(${_sm_prep[@]})
    _submodule_update
  )"
}

_source_moonlight_stream_moonlight_common_c() {
  local _sources_add=(
    'cgutman.enet'::'git+https://github.com/cgutman/enet.git'::'enet'
  )

  local _p _idx _src _sm_prep _sm_func
  for _p in ${_sources_add[@]}; do
    _idx="${_p%%::*}"
    _sm_prep+=("${_idx}::${_p##*::}")
    _src="${_p%::*}"
    source+=("$_src")
    sha256sums+=('SKIP')
  done

  eval "_prepare_moonlight_stream_moonlight_common_c() (
    cd \"\$srcdir/\$_pkgsrc\"
    cd 'moonlight-common-c/moonlight-common-c'
    local _submodules=(${_sm_prep[@]})
    _submodule_update
  )"
}

_source_main
_source_moonlight_qt
_source_moonlight_stream_moonlight_common_c

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
    done
  }

  _run_if_exists _prepare_moonlight_qt
  _run_if_exists _prepare_moonlight_stream_moonlight_common_c
}

build() {
  [ "$_ffmpeg" != "ffmpeg" ] && export PKG_CONFIG_PATH="/usr/lib/$_ffmpeg/pkgconfig/"

  cd "$_pkgsrc"
  qmake6 'moonlight-qt.pro' PREFIX='/usr'
  make
}

package() {
  make -C "$_pkgsrc" INSTALL_ROOT="$pkgdir" install
}

_run_if_exists() {
  if declare -F "$1" > /dev/null; then
    eval "$1"
  fi
}
