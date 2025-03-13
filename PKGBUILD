# Maintainer:
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

## links
# https://desmume.org
# https://github.com/TASVideos/desmume

## options
: ${_build_level:=1}
: ${_build_git:=true}

unset _pkgtype
[[ "${_build_level::1}" == "2" ]] && _pkgtype+="-x64v2"
[[ "${_build_level::1}" == "3" ]] && _pkgtype+="-x64v3"
[[ "${_build_level::1}" == "4" ]] && _pkgtype+="-x64v4"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

_pkgname="desmume"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=0.9.14.r271.g60714f6
pkgrel=2
pkgdesc="Nintendo DS emulator"
url="https://github.com/TASVideos/desmume"
license=('GPL-2.0-or-later')
arch=('aarch64' 'x86_64' 'x86_64_v2' 'x86_64_v3' 'x86_64_v4')

depends=(
  'gtk3'
  'libopenal.so'
  'libpcap'
  'sdl2'
  'soundtouch'
  'zlib'
)
makedepends=(
  'clang'
  'git'
  'intltool'
  'lld'
  'mesa'
  'meson'
)

case "$CARCH" in
  x86_64_v2)
    _build_level=2
    ;;
  x86_64_v3)
    _build_level=3
    ;;
  x86_64_v4)
    _build_level=4
    ;;
  *) # no changes; may be user defined
    ;;
esac

if [ "${_build_git::1}" == "t" ]; then
  provides=("$_pkgname")
  conflicts=("$_pkgname")
  _commit="master"

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
fi

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  export CC CXX CFLAGS CXXFLAGS LDFLAGS
  CC=clang
  CXX=clang++

  local _ldflags=(${LDFLAGS})
  LDFLAGS="${_ldflags[@]//*fuse-ld*/} -fuse-ld=lld"

  if [[ ${_build_level::1} =~ ^[2-4]$ ]]; then
    local _cflags _cxxflags
    _cflags=(
      -march=x86-64-v${_build_level::1} -mtune=generic -O3
      $(sed -E -e 's&-(march|mtune)=\S+\b&&g' -e 's&-O[0-9]+\b&&g' <<< "${CFLAGS}")
    )
    CFLAGS="${_cflags[@]}"

    _cxxflags=(
      -march=x86-64-v${_build_level::1} -mtune=generic -O3
      $(sed -E -e 's&-(march|mtune)=\S+\b&&g' -e 's&-O[0-9]+\b&&g' <<< "${CXXFLAGS}")
    )
    CXXFLAGS="${_cxxflags[@]}"
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
