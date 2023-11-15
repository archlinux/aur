# Maintainer:
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

# options
if [ x"$_srcinfo" == "xt" ] ; then
  : ${_autoupdate:=false}
elif [ -z "$_pkgver" ] ; then
  : ${_autoupdate:=true}
else
  : ${_autoupdate:=false}
fi

: ${_tag:=v3.4-1}

: ${_pkgtype:=git}

# basic info
_pkgname="g4music"
pkgname="$_pkgname${_pkgtype:+-$_pkgtype}"
pkgver=3.4.1.r2.g3b76f92
pkgrel=2
pkgdesc="Play your music"
url="https://gitlab.gnome.org/neithern/g4music"
license=('GPL3')
arch=('x86_64' 'aarch64')

# main package
_main_package() {
  depends=(
    gstreamer
    libadwaita
    taglib
    tracker3
  )
  makedepends=(
    git
    meson
    vala
  )
  checkdepends=(
    appstream-glib
  )
  optdepends=(
    'gst-plugins-bad'
    'gst-plugins-base'
    'gst-plugins-good'
  )

  if [ x"$pkgname" == x"$_pkgname" ] ; then
    _update_version
    _main_stable
  else
    _main_git
  fi
}

# stable package
_main_stable() {
  _pkgsrc="$_pkgname"
  _pkgext="tar.gz"
  source+=("$_pkgsrc"::"git+$url.git#tag=${_tag:?}")
  sha256sums+=('SKIP')

  pkgver() {
    local _pkgver=$(sed -E 's@^[^0-9]+@@; s@\.r.*$@@; s@-@.@g' <<< "${_tag:?}")
    echo "${_pkgver:?}"
  }
}

# git package
_main_git() {
  provides=("$_pkgname=${pkgver%%.r*}")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() (
    cd "$_pkgsrc"
    local _pkgver=$(
      git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' 2>/dev/null \
        | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
    )

    echo "${_pkgver:?}"
  )
}

# common functions
build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

check() {
  meson test -C build || true
}

package() {
  meson install -C build --destdir "${pkgdir:?}"
}

# update version
_update_version() {
  if [ x"${_autoupdate::1}" != "xt" ] ; then
    return
  fi

  _gitlab_host="${url#*//}"
  _gitlab_host="${_gitlab_host%%/*}"
  _gitlab_id=21317
  _gitlab_path="api/v4/projects/$_gitlab_id/repository/tags"
  _response=$(curl -Ssf "https://$_gitlab_host/$_gitlab_path")

  _get() {
    printf '%s' "$_response" \
      | tr ',' '\n' \
      | awk -F '"' '/"'"$1"'":/{print $4}' \
      | sort -Vr | head -1
  }
  _tag=$(_get name)
}

# execute
_main_package
