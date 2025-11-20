# Maintainer:
# Contributor: sehraf

: ${_use_sodeps:=false}

: ${_commit:=fa91380765a79f297cba679b95d962200d44841d} # 0.6.7.2.r485

_pkgname="retroshare"
pkgname="$_pkgname"
pkgver=0.6.7.2
pkgrel=5
pkgdesc="Serverless encrypted instant messenger with filesharing, chatgroups, e-mail"
url="https://github.com/retroshare/retroshare"
license=('AGPL-3.0-only')
arch=('x86_64') # --ignorearch

depends=(
  'botan'
  'json-c'
  'libxss'
  'miniupnpc'
  'qt6-5compat'
  'qt6-base'
  'qt6-multimedia'
  'sqlcipher'
)
makedepends=(
  'asio'
  'cmake'
  'doxygen'
  'git'
  'rapidjson'
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git${_commit:+#commit=$_commit}")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"

  # fix submodule links
  sed -E -e 's&url = \.\./&url = https://github.com/retroshare/&' -i .gitmodules

  # clone submodules
  git submodule update --init --recursive --depth=1

  # use extra/botan
  sed -E -e 's&botan-2&botan-3&' \
    -i libretroshare/src/libretroshare.pro \
    libretroshare/src/use_libretroshare.pri \
    retroshare-service/src/retroshare-service.pro

  sed -E -e 's&if\(.* EQUAL "3"\)&if(FALSE)&' \
    -e '/QUIET botan-2/d' \
    -e 's&"(lib)botan-2"&&g' \
    -i supportlibs/librnp/cmake/Modules/FindBotan.cmake

  # disable warning-error
  sed -e '/inconsistent-missing-override/d' -i retroshare.pri

  # disable plugins
  sed -e '/VOIP \\/d' \
    -e '/FeedReader/d' \
    -i plugins/plugins.pro
}

build() {
  cd "$_pkgsrc"

  local _qmake_options=(
    CONFIG+=release
    CONFIG+=rs_use_native_dialogs
    CONFIG+=rs_jsonapi
    CONFIG+=rs_webui

    RS_UPNP_LIB="miniupnpc"
    RetroShare.pro
  )

  qmake6 "${_qmake_options[@]}"
  make
}

package() {
  if [[ "${_use_sodeps::1}" == "t" ]]; then
    eval "depends+=(
      'libbz2.so'    # bzip2
      'libcrypto.so' # openssl
      'libjson-c.so' # json-c
      'libminiupnpc.so'
      'libssl.so'    # openssl
      'libz.so'      # zlib
    )"
  fi

  cd "$_pkgsrc"
  make INSTALL_ROOT="$pkgdir" install

  # components have various OSI-approved licenses
  install -Dm644 .reuse/dep5 "$pkgdir/usr/share/licenses/$pkgname/LICENSES"
}
