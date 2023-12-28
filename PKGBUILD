# Maintainer:

## useful links:
# https://tuba.geopjr.dev/
# https://github.com/GeopJr/Tuba

## options
if [ -n "$_srcinfo" ] || [ -n "$_pkgver" ] ; then
  : ${_autoupdate:=false}
else
  : ${_autoupdate:=true}
fi

: ${_build_git:=true}

[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

## basic info
_pkgname="tuba"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=0.6.1.r0.g8a4708d6
pkgrel=1
pkgdesc='Browse the Fediverse'
url="https://github.com/GeopJr/Tuba"
license=('GPL-3.0-only')
arch=(
  aarch64 #ALARM
  armv7h  #ALARM
  i686    #Arch Linux32
  x86_64  #Arch Linux
)

# main package
_main_package() {
  depends=(
    libadwaita
    libgee
    libsecret
    gtk4
    gtksourceview5
    libspelling
    webp-pixbuf-loader # gdk-pixbuf2

    ## implicit
    #dconf
    #gdk-pixbuf2
    #glib2
    #glibc
    #graphene
    #json-glib
    #libsoup3
    #libxml2
    #pango
  )
  makedepends=(
    git
    meson
    vala
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
  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git#tag=v${pkgver%%.r*}")
  sha256sums+=('SKIP')

  pkgver() {
    echo "${_pkgver:?}"
  }
}

# git package
_main_git() {
  provides+=("$_pkgname=${pkgver%%.r*}")
  conflicts+=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() (
    cd "$_pkgsrc"
    git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
  )
}

# common functions
build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  depends+=(
    hicolor-icon-theme
  )

  meson install -C build --destdir "$pkgdir"
  ln -sf "dev.geopjr.Tuba" "$pkgdir/usr/bin/tuba"
}

## auto update
_update_version() {
  : ${_pkgver:=$pkgver}

  if [[ "${_autoupdate::1}" != "t" ]] ; then
    return
  fi

  local _response=$(curl -Ssf "$url/releases.atom")
  local _tag=$(
    printf '%s' "$_response" \
      | grep '/releases/tag/' \
      | sed -E 's@^.*/releases/tag/(.*)".*$@\1@' \
      | grep -Ev '[a-z]{2}' | sort -V | tail -1
  )
  local _pkgver_new="${_tag#v}"

  # update _pkgver
  if [ "$_pkgver" != "${_pkgver_new:?}" ] ; then
    _pkgver="${_pkgver_new:?}"
  fi
}

# execute
_main_package
