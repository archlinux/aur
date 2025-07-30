# Maintainer:
# Contributor: sehraf

## links
# http://retroshare.cc/
# https://github.com/retroshare/retroshare

## options
# whether to build and install plugins
: ${_plugin_feedreader:=false}
: ${_plugin_voip:=false} # currently broken

# whether to enable automatically generated json api
: ${_jsonapi:=false}

# whether to enable auto login
: ${_autologin:=false}

# whether to enable native (system) dialogs
: ${_nativ_dialogs:=true}

# whether to enable wiki functionality (experimental)
: ${_wiki:=false}

# whether to compile with clang (experimental)
: ${_clang:=false}

_pkgname="retroshare"
pkgname="$_pkgname-git"
pkgver=0.6.7.2.r327.g07ee6581e
pkgrel=1
pkgdesc="Serverless encrypted instant messenger with filesharing, chatgroups, e-mail"
url="https://github.com/retroshare/retroshare"
license=('AGPL-3.0-or-later')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')

depends=(
  'botan2'
  'bzip2'
  'hicolor-icon-theme'
  'json-c'
  'libxss'
  'miniupnpc'
  'openssl'
  'qt5-multimedia'
  'qt5-x11extras'
  'sqlcipher'
)
makedepends=(
  'cmake'
  'git'
  'qt5-tools'
  'rapidjson'
)
optdepends=(
  'tor: tor hidden node support'
  'i2p: i2p hidden node support'
  'i2pd: i2p hidden node support'
)

# Add extra dependencies
if [[ "${_plugin_voip::1}" == "t" ]]; then
  depends+=('ffmpeg' 'opencv3-opt')
fi

if [[ "${_plugin_feedreader::1}" == "t" ]]; then
  depends+=('curl' 'libxslt')
fi

if [[ "${_jsonapi::1}" == "t" ]]; then
  makedepends+=('doxygen')
fi

if [[ "${_clang::1}" == "t" ]]; then
  makedepends+=('clang')
fi

if [[ "${_autologin::1}" == "t" ]]; then
  depends+=('libsecret')
fi

_source_main() {
  provides=("$_pkgname=$pkgver")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --exclude='*[A-Za-z][A-Za-z]*' --exclude='*[a-z]' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g ; s/\.RC/RC/'
  }
}

_source_retroshare() {
  local _sources_add=(
    'retroshare.bitdht'::'git+https://github.com/RetroShare/BitDHT.git'::'libbitdht'
    'retroshare.openpgp-sdk'::'git+https://github.com/RetroShare/OpenPGP-SDK.git'::'openpgpsdk'

    'commonmark.cmark'::'git+https://github.com/commonmark/cmark.git'::'supportlibs/cmark'
    'corvusoft.restbed'::'git+https://github.com/Corvusoft/restbed.git'::'supportlibs/restbed'
    'i2p.libsam3'::'git+https://github.com/i2p/libsam3.git'::'supportlibs/libsam3'
    'retroshare.jni.hpp'::'git+https://github.com/RetroShare/jni.hpp.git'::'supportlibs/jni.hpp'
    'retroshare.libretroshare'::'git+https://github.com/RetroShare/libretroshare.git'::'libretroshare'
    'retroshare.obs'::'git+https://github.com/RetroShare/OBS.git'::'build_scripts/OBS'
    'retroshare.rsnewwebui'::'git+https://github.com/RetroShare/RSNewWebUI.git'::'retroshare-webui'
    'rnpgp.rnp'::'git+https://github.com/rnpgp/rnp.git'::'supportlibs/librnp'
    'tencent.rapidjson'::'git+https://github.com/Tencent/rapidjson.git'::'supportlibs/rapidjson'
    #'truvorskameikin.udp-discovery-cpp'::'git+https://github.com/truvorskameikin/udp-discovery-cpp.git'::'supportlibs/udp-discovery-cpp'
  )

  local _p _idx _src _sm_prep _sm_func
  for _p in ${_sources_add[@]}; do
    _idx="${_p%%::*}"
    _sm_prep+=("${_idx}::${_p##*::}")
    _src="${_p%::*}"
    source+=("$_src")
    sha256sums+=('SKIP')
  done

  eval "_prepare_retroshare() (
    cd \"\$srcdir/\$_pkgsrc\"
    local _submodules=(${_sm_prep[@]})
    _submodule_update

    # out of tree
    git submodule update --init --recursive --depth=1 supportlibs/udp-discovery-cpp
  )"
}

_source_rnpgp_rnp() {
  local _sources_add=(
    'rnpgp.sexpp'::'git+https://github.com/rnpgp/sexpp.git'::'src/libsexpp'
  )

  local _p _idx _src _sm_prep _sm_func
  for _p in ${_sources_add[@]}; do
    _idx="${_p%%::*}"
    _sm_prep+=("${_idx}::${_p##*::}")
    _src="${_p%::*}"
    source+=("$_src")
    sha256sums+=('SKIP')
  done

  eval "_prepare_rnpgp_rnp() (
    cd \"\$srcdir/\$_pkgsrc\"
    cd 'supportlibs/librnp'
    local _submodules=(${_sm_prep[@]})
    _submodule_update
  )"
}

_source_tencent_rapidjson() {
  local _sources_add=(
    'google.googletest'::'git+https://github.com/google/googletest.git'::'thirdparty/gtest'
  )

  local _p _idx _src _sm_prep _sm_func
  for _p in ${_sources_add[@]}; do
    _idx="${_p%%::*}"
    _sm_prep+=("${_idx}::${_p##*::}")
    _src="${_p%::*}"
    source+=("$_src")
    sha256sums+=('SKIP')
  done

  eval "_prepare_tencent_rapidjson() (
    cd \"\$srcdir/\$_pkgsrc\"
    cd 'supportlibs/rapidjson'
    local _submodules=(${_sm_prep[@]})
    _submodule_update
  )"
}

_source_main

_source_retroshare
_source_rnpgp_rnp
_source_tencent_rapidjson

prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
    done
  }

  _run_if_exists _prepare_retroshare
  _run_if_exists _prepare_rnpgp_rnp
  _run_if_exists _prepare_tencent_rapidjson
}

build() {
  export CMAKE_POLICY_VERSION_MINIMUM=3.5

  cd "$_pkgsrc"

  # remove unwanted plugins
  if [ "${_plugin_voip::1}" != "t" ]; then
    sed -i '/VOIP \\/d' plugins/plugins.pro
  fi
  if [ "$_plugin_feedreader" != "t" ]; then
    sed -i '/FeedReader/d' plugins/plugins.pro
  fi

  local _qmake_options=(
    CONFIG-=debug
    CONFIG+=release
  )

  if [[ "${_jsonapi::1}" == "t" ]]; then
    _qmake_options+=(
      CONFIG+=rs_jsonapi
    )
  fi

  if [[ "${_clang::1}" == "t" ]]; then
    _qmake_options+=(
      -spec linux-clang
      CONFIG+=c++11
    )
  fi

  if [[ "${_autologin::1}" == "t" ]]; then
    _qmake_options+=(
      CONFIG+=rs_autologin
    )
  fi

  if [[ "${_nativ_dialogs::1}" == "t" ]]; then
    _qmake_options+=(
      CONFIG+=rs_use_native_dialogs
    )
  fi

  if [[ "${_plugin_voip::1}" == "t" ]] || [[ "${_plugin_feedreader::1}" == "t" ]]; then
    _qmake_options+=(
      CONFIG+=retroshare_plugins
    )
  fi

  if [[ "${_wiki::1}" == "t" ]]; then
    _qmake_options+=(
      CONFIG+=wikipoos
    )
  fi

  qmake_options+=(
    RS_UPNP_LIB="miniupnpc"
    CONFIG+=no_rs_friendserver
    QMAKE_CFLAGS_RELEASE="${CFLAGS}"
    QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}"
    RetroShare.pro
  )

  qmake "${_qmake_options[@]}"

  make || true
  rmdir supportlibs/restbed/include || true
  make
}

package() {
  cd "$_pkgsrc"
  make INSTALL_ROOT="$pkgdir" install
}

_run_if_exists() {
  if declare -F "$1" > /dev/null; then
    eval "$1"
  fi
}
