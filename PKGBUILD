# Maintainer:
# Contributor: sehraf
# Contributor: stqn
# Contributor: JHeaton <jheaton at archlinux dot us>
# Contributor: Tristero <tristero at online dot de>
# Contributor: funkyou

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


## basic info
_pkgname="retroshare"
pkgname="$_pkgname"
pkgver=0.6.7.2
pkgrel=1
pkgdesc="Serverless encrypted instant messenger with filesharing, chatgroups, e-mail."
#url="http://retroshare.cc/"
url="https://github.com/retroshare/retroshare"
license=('AGPL3')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')

## main package
_main_package() {
  depends=(
    'libxss'
    'miniupnpc'
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
  if [[ "${_plugin_voip::1}" =~ 't|y|1' ]] ; then
    depends+=('ffmpeg' 'opencv3-opt')
  fi

  if [[ "${_plugin_feedreader::1}" =~ 't|y|1' ]] ; then
    depends+=('curl' 'libxslt')
  fi

  if [[ "${_jsonapi::1}" =~ 't|y|1' ]] ; then
    makedepends+=('doxygen')
  fi

  if [[ "${_clang::1}" =~ 't|y|1' ]] ; then
    makedepends+=('clang')
  fi

  if [[ "${_autologin::1}" =~ 't|y|1' ]] ; then
    depends+=('libsecret')
  fi

  # package type
  if [ x"$pkgname" == x"$_pkgname" ] ; then
    _main_stable
  else
    _main_git
  fi

  _source_retroshare
  _source_rapidjson
  _source_restbed
}

## stable package
_main_stable() {
  _pkgtag="v$pkgver"

  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git#tag=$_pkgtag")
  sha256sums=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    echo "${_pkgtag}" | sed -E 's/^v//;s/(.*[0-9])([a-z])/\1.\2/'
  }
}

## git package
_main_git() {
  provides=("$_pkgname=${pkgver%%.r*}")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --exclude='*[a-z][a-z]*' --exclude='*[a-z]' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g ; s/\.RC/RC/'
  }
}

## submodules
_source_retroshare() {
  source+=(
    'retroshare.openpgp-sdk'::'git+https://github.com/RetroShare/OpenPGP-SDK.git'
    'retroshare.bitdht'::'git+https://github.com/RetroShare/BitDHT.git'

    'commonmark.cmark'::'git+https://github.com/commonmark/cmark.git'
    'corvusoft.restbed'::'git+https://github.com/Corvusoft/restbed.git'
    'i2p.libsam3'::'git+https://github.com/i2p/libsam3.git'
    'retroshare.jni.hpp'::'git+https://github.com/RetroShare/jni.hpp.git'
    'retroshare.libretroshare'::'git+https://github.com/RetroShare/libretroshare.git'
    'retroshare.obs'::'git+https://github.com/RetroShare/OBS.git'
    'retroshare.rsnewwebui'::'git+https://github.com/RetroShare/RSNewWebUI.git'
    'tencent.rapidjson'::'git+https://github.com/Tencent/rapidjson.git'
    'truvorskameikin.udp-discovery-cpp'::'git+https://github.com/truvorskameikin/udp-discovery-cpp.git'
  )
  sha256sums+=(
    'SKIP'
    'SKIP'

    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
  )

  _prepare_retroshare() (
    cd "${srcdir:?}/$_pkgsrc"
    local -A _submodules=(
      ['retroshare.openpgp-sdk']='openpgpsdk'
      ['retroshare.bitdht']='libbitdht'

      ['commonmark.cmark']='supportlibs/cmark'
      ['corvusoft.restbed']='supportlibs/restbed'
      ['i2p.libsam3']='supportlibs/libsam3'
      ['retroshare.jni.hpp']='supportlibs/jni.hpp'
      ['retroshare.libretroshare']='libretroshare'
      ['retroshare.obs']='build_scripts/OBS'
      ['retroshare.rsnewwebui']='retroshare-webui'
      ['tencent.rapidjson']='supportlibs/rapidjson'
      ['truvorskameikin.udp-discovery-cpp']='supportlibs/udp-discovery-cpp'
    )
    _submodule_update
  )
}

_source_rapidjson() {
  source+=(
    'google.googletest'::'git+https://github.com/google/googletest.git'
  )
  sha256sums+=(
    'SKIP'
  )

  _prepare_rapidjson() (
    cd "${srcdir:?}/$_pkgsrc"
    cd "supportlibs/rapidjson"
    local -A _submodules=(
      ['google.googletest']='thirdparty/gtest'
    )
    _submodule_update
  )
}

_source_restbed() {
  source+=(
    'corvusoft.asio-dependency'::'git+https://github.com/corvusoft/asio-dependency.git'
    'corvusoft.catch-dependency'::'git+https://github.com/corvusoft/catch-dependency.git'
    'corvusoft.openssl-dependency'::'git+https://github.com/corvusoft/openssl-dependency.git'
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
    'SKIP'
  )

  _prepare_restbed() (
    cd "${srcdir:?}/$_pkgsrc"
    cd "supportlibs/restbed"
    local -A _submodules=(
      ['corvusoft.asio-dependency']='dependency/asio'
      ['corvusoft.catch-dependency']='dependency/catch'
      ['corvusoft.openssl-dependency']='dependency/openssl'
    )
    _submodule_update
  )
}

## common functions
prepare() {
  _submodule_update() {
    local key;
    for key in ${!_submodules[@]} ; do
      git submodule init "${_submodules[${key}]}"
      git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
      git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
    done
  }

  _prepare_retroshare
  _prepare_rapidjson
  _prepare_restbed
}

build() {
  cd "$_pkgsrc"

  # remove unwanted plugins
  if [[ ! "${_plugin_voip::1}" =~ 't|y|!' ]] ; then
    sed -i '/VOIP \\/d' plugins/plugins.pro
  fi
  if [[ ! "$_plugin_feedreader" =~ 't|y|1' ]] ; then
    sed -i '/FeedReader/d' plugins/plugins.pro
  fi

  local _qmake_options=(
    CONFIG-=debug
    CONFIG+=release
  )

  if [[ "${_jsonapi::1}" =~ 't|y|1' ]] ; then
    _qmake_options+=(
      CONFIG+=rs_jsonapi
    )
  fi

  if [[ "${_clang::1}" =~ 't|y|1' ]] ; then
    _qmake_options+=(
      -spec linux-clang
      CONFIG+=c++11
    )
  fi

  if [[ "${_autologin::1}" =~ 't|y|1' ]] ; then
    _qmake_options+=(
      CONFIG+=rs_autologin
    )
  fi

  if [[ "${_nativ_dialogs::1}" =~ 't|y|1' ]] ; then
    _qmake_options+=(
      CONFIG+=rs_use_native_dialogs
    )
  fi

  if [[ "${_plugin_voip::1}" =~ 't|y|1' ]] || [[ "${_plugin_feedreader::1}" =~ 't|y|1' ]] ; then
    _qmake_options+=(
      CONFIG+=retroshare_plugins
    )
  fi

  if [[ "${_wiki::1}" =~ 't|y|1' ]] ; then
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
  make INSTALL_ROOT="${pkgdir:?}" install
}

## execute
_main_package
