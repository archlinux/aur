# Maintainer:
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

## links
# https://desmume.org
# https://github.com/TASVideos/desmume

## options
: ${_build_avx:=false}
: ${_build_git:=true}

unset _pkgtype
[[ "${_build_avx::1}" == "t" ]] && _pkgtype+="-avx"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

## basic info
_pkgname='desmume'
pkgname="$_pkgname${_pkgtype:--git}"
pkgver=0.9.14.r233.g60714f6
pkgrel=1
pkgdesc="Nintendo DS emulator"
url="https://github.com/TASVideos/desmume"
license=('GPL-2.0-or-later')
arch=('x86_64' 'aarch64')

depends=(
  'gtk3'
  'libopenal.so'
  'libpcap'
  'sdl2'
  'soundtouch'
  'zlib'
)
makedepends=(
  'git'
  'intltool'
  'mesa'
  'meson'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local _file _hash _ver _rev
  _file="desmume/src/version.cpp"
  read -r _hash _ver < <(
    NL=$(awk '/^#define DESMUME_VERSION_STRING /{n=NR}END{print n}' "$_file")

    git blame -L "$NL,+1" -- "$_file" \
      | awk '{print $1" "$(NF-5) }' \
      | sed -E -e 's&"&&g'
  )
  _rev=$(git rev-list --count --cherry-pick "$_hash"...HEAD)

  printf "%s.r%s.g%s" "${_ver:?}" "${_rev:?}" "${_hash::7}"
}

build() {
  export CFLAGS CXXFLAGS
  if [[ "${_build_avx::1}" == "t" ]] ; then
    CFLAGS="$(echo "$CFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
    CXXFLAGS="$(echo "$CXXFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
  fi

  local _pkgsrc="$_pkgsrc/desmume/src/frontend/posix"

  local _meson_args=(
    -Dopengl=true
    -Dglx=true
    -Dopenal=true
    -Dwifi=true
  )

  arch-meson "${_meson_args[@]}" "$_pkgsrc" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
