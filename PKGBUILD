# Maintainer:
# Contributor: sehraf
# Contributor: stqn
# Contributor: JHeaton <jheaton at archlinux dot us>
# Contributor: Tristero <tristero at online dot de>
# Contributor: funkyou

## default options
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
pkgver=0.6.7RC2.47
pkgrel=1
pkgdesc="Serverless encrypted instant messenger with filesharing, chatgroups, e-mail."
#url="http://retroshare.cc/"
url="https://github.com/retroshare/retroshare"
license=('AGPL3')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')

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
  # normal package
  _commit='c52e84d709df9d264d8aa2b9de41af5825496450'

  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git#commit=$_commit")
  sha256sums=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/-/./g;s/\.RC/RC/;s/\.g.*$//'
  }
else
  # git package
  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g ; s/\.RC/RC/'
  }
fi

source+=(
  # submodules for retroshare
  'cmark'::'git+https://github.com/commonmark/cmark.git'
  'libsam3'::'git+https://github.com/i2p/libsam3.git'
  'rapidjson'::'git+https://github.com/Tencent/rapidjson.git'
  'restbed'::'git+https://github.com/Corvusoft/restbed.git'
  'retroshare-OBS'::'git+https://github.com/RetroShare/OBS.git'
  'retroshare-jni.hpp'::'git+https://github.com/RetroShare/jni.hpp.git'
  'udp-discovery-cpp'::'git+https://github.com/truvorskameikin/udp-discovery-cpp.git'

  'libbitdht'::'git+https://github.com/RetroShare/BitDHT.git'
  'libretroshare'::'git+https://github.com/RetroShare/libretroshare.git'
  'openpgpsdk'::'git+https://github.com/RetroShare/OpenPGP-SDK.git'
  'retroshare-webui'::'git+https://github.com/RetroShare/RSNewWebUI.git'

  # submodules for rapidjson
  'gtest'::'git+https://github.com/google/googletest.git'

  # submodules for restbed
  'asio'::'git+https://github.com/corvusoft/asio-dependency.git'
  'catch'::'git+https://github.com/corvusoft/catch-dependency.git'
  'openssl'::'git+https://github.com/corvusoft/openssl-dependency.git'
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

  'SKIP'

  'SKIP'
  'SKIP'
  'SKIP'
)

prepare() {
  cd "$_pkgsrc"
  (
    # submodules for retroshare
    local -A _submodules=(
      ['cmark']='supportlibs/cmark'
      ['libsam3']='supportlibs/libsam3'
      ['rapidjson']='supportlibs/rapidjson'
      ['restbed']='supportlibs/restbed'
      ['retroshare-OBS']='build_scripts/OBS'
      ['retroshare-jni.hpp']='supportlibs/jni.hpp'
      ['udp-discovery-cpp']='supportlibs/udp-discovery-cpp'

      ['libbitdht']='libbitdht'
      ['libretroshare']='libretroshare'
      ['openpgpsdk']='openpgpsdk'
      ['retroshare-webui']='retroshare-webui'
    )
     for key in ${!_submodules[@]} ; do
      git submodule init "${_submodules[${key}]}"
      git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
      git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
    done
  )
  (
    # submodules for rapidjson
    cd "supportlibs/rapidjson"
    local -A _submodules=(
      ['gtest']='thirdparty/gtest'
    )
     for key in ${!_submodules[@]} ; do
      git submodule init "${_submodules[${key}]}"
      git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
      git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
    done
  )
  (
    # submodules for restbed
    cd "supportlibs/restbed"
    local -A _submodules=(
      ['asio']='dependency/asio'
      ['catch']='dependency/catch'
      ['openssl']='dependency/openssl'
    )
     for key in ${!_submodules[@]} ; do
      git submodule init "${_submodules[${key}]}"
      git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
      git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
    done
  )
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
