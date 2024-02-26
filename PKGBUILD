# Maintainer: xiota / aur.chaotic.cx
# Contributor: m4sk1n <m4sk1n@vivaldi.net>
# Contributor: Christian Hesse <mail@eworm.de>

# options
: ${_build_git:=true}

unset _pkgtype
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_pkgname="otter-browser"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=1.0.03.r2444.g305aeec7
pkgrel=1
pkgdesc='Browser recreating the best aspects of the classic Opera interface'
url='https://github.com/OtterBrowser/otter-browser'
license=('GPL-3.0-or-later')
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')

# main package
_main_package() {
  depends=(
    'qt5-multimedia'
    'qt5-svg'
    'qt5-webengine'

    ## implicit
    #qt5-base
    #qt5-declarative
  )
  makedepends=(
    'cmake'
  )
  optdepends=(
    'hunspell: for spell checking'
  )

  if [ "${_build_git::1}" != "t" ] ; then
    _main_stable
  else
    _main_git
  fi
}

# stable package
_main_stable() {
  : ${_pkgver:=${pkgver%%.r*}}

  depends+=(
    'qt5-xmlpatterns'
  )

  _pkgsrc="$_pkgname-${_pkgver:?}"
  _pkgext="tar.gz"
  source+=("$_pkgsrc.$_pkgext"::"$url/archive/v$_pkgver/$_pkgsrc.$_pkgext")
  sha256sums+=('2b07d22a5d921ec0b3d29a680eb913c3fe0713ca7d10e37873a3802d1a5154a3')

  pkgver() {
    echo "${_pkgver:?}"
  }
}

# git package
_main_git() {
  makedepends+=('git')

  provides+=("$_pkgname=${pkgver%%.r*}")
  conflicts+=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"

    local _tag=$(git tag | sort -rV | head -1)
    local _revision=$(git rev-list --count --cherry-pick "$_tag"...HEAD)
    local _hash=$(git rev-parse --short=8 HEAD)

    printf '%s.r%s.g%s' \
      "${_tag#v}" \
      "$_revision" \
      "$_hash"
  }
}

# common functions
build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  depends+=('hicolor-icon-theme')

  DESTDIR="$pkgdir" cmake --install build
}

# execute
_main_package
