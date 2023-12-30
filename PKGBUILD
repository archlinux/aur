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
  source+=("$_pkgsrc"::"git+$url.git#tag=${pkgver%%.r*}")
  sha256sums+=('SKIP')

  prepare() {
    : ${_pkgver:=${pkgver%%.r*}}
    if [[ "${_autoupdate::1}" != "t" ]] ; then
      return
    fi

    cd "$_pkgsrc"

    local _tag=$(git tag | grep -Ev '^.*[A-Za-z]{2}.*$' | sort -V | tail -1)
    _pkgver="${_tag:?}"

    if [[ "${_pkgver:?}" != "${pkgver%%.r*}" ]] ; then
      git checkout -f "$_tag"
      git describe --long --tags
    fi
  }

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

# execute
_main_package
