# Maintainer:
# Contributor: Yamada Hayao <hayao@fascode.net>
# Contributer: rilian-la-te <ria.freelander@gmail.com>

# options
if [ -n "$_srcinfo" ] || [ -n "$_pkgver" ] ; then
  : ${_autoupdate:=false}
else
  : ${_autoupdate:=true}
fi

: ${_build_git:=false}

[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_name="vala-panel-appmenu"
_pkgname="$_name-registrar"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=0.7.6
pkgrel=2
pkgdesc="Small utility to hold DBusMenu menus"
url="https://gitlab.com/vala-panel-project/vala-panel-appmenu"
license=('LGPL-3.0-or-later')
arch=('i686' 'x86_64')

# main package
_main_package() {
  depends=(
    'glib2'

    ## implicit
    #gcc-libs
    #glibc
  )
  makedepends=(
    'git'
    'meson'
  )

  if [ "${_build_git::1}" != "t" ] ; then
    _update_version
    _main_stable
  else
    _main_git
  fi
}

# stable package
_main_stable() {
  conflicts+=("$_pkgname-git")

  _pkgsrc="$_name"
  _path="subprojects/registrar"
  source+=("$_pkgsrc"::"git+$url.git#tag=$_pkgver")
  sha256sums+=('SKIP')

  pkgver() {
    echo "${_pkgver:?}"
  }
}

# git package
_main_git() {
  provides+=("$_pkgname=${pkgver%%.r*}")
  conflicts+=("$_pkgname")

  _pkgsrc="$_name"
  _path="subprojects/registrar"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"

    git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
  }
}

# common functions
build() {
  arch-meson "$_pkgsrc/$_path" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# update version
_update_version() {
  : ${_pkgver:=${pkgver%%.r*}}

  if [[ "${_autoupdate::1}" != "t" ]] ; then
    return
  fi

  local _response=$(curl -Ssf "$url/-/tags?format=atom")
  local _tag=$(
    printf '%s' "$_response" \
      | grep '"https://.*/tags/.*"' \
      | sed -E 's@^.*/tags/(.*)".*$@\1@' \
      | grep -Ev '[a-z]{2}' | sort -rV | head -1
  )
  local _pkgver_new="${_tag#v}"

  # update _pkgver
  if [ "$_pkgver" != "${_pkgver_new:?}" ] ; then
    _pkgver="${_pkgver_new:?}"
  fi
}

# execute
_main_package
