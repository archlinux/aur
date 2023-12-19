# Maintainer: xiota / aur.chaotic.cx
# Contributor: Benjamin Landis <bmlandis2010@gmail.com>

# options
: ${_autoupdate:=false}
: ${_build_git:=false}

[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_gitname="mpv"
_pkgname="$_gitname-vapoursynth"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=0.37.0
pkgrel=1
pkgdesc='a free, open source, and cross-platform media player'
url='https://github.com/mpv-player/mpv'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL-2.0-or-later')

# main package
_main_package() {
  depends=(
    'libarchive'
    'libcdio-paranoia'
    'libdvdnav'
    'libxkbcommon'
    'libxpresent'
    'libxrandr'
    'libxss'
    'luajit'
    'mujs'
    'rubberband'
    'uchardet'
    'vapoursynth'

    ## implicit
    #alsa-lib
    #bash
    #gcc-libs
    #glibc
    #hicolor-icon-theme
    #lcms2
    #libass
    #libbluray
    #libcdio
    #libdrm
    #libglvnd
    #libjpeg-turbo
    #libpipewire
    #libpulse
    #libva
    #libvdpau
    #libx11
    #libxext
    #libxv
    #mesa
    #pipewire-jack
    #vulkan-icd-loader
    #wayland
    #zimg
    #zlib
  )
  makedepends=(
    'ffnvcodec-headers'
    'git'
    'ladspa'
    'meson'
    'python-docutils'
    'vulkan-headers'
    'wayland-protocols'
  )
  optdepends=(
    'yt-dlp: for video-sharing websites playback'
    'youtube-dl: for video-sharing websites playback'
  )

  provides=("mpv=${pkgver%%.r*}")
  conflicts=('mpv')

  options=('!emptydirs')
  validpgpkeys=('145077D82501AA20152CACCE8D769208D5E31419') # sfan5 <sfan5@live.de>

  if [ x"$pkgname" == x"$_pkgname" ] ; then
    _main_stable
  else
    _main_git
  fi
}

# stable package
_main_stable() {
  : ${_pkgver:=${pkgver%%.r*}}

  depends+=(
    'ffmpeg'
    'libplacebo'
  )

  _pkgsrc="$_gitname"
  source=("$_pkgsrc"::"git+$url.git#tag=v$_pkgver")
  sha256sums=('SKIP')

  prepare() {
    cd "$_pkgsrc"

    if [[ "${_autoupdate::1}" != "t" ]] ; then
      return
    fi

    local _tag=$(git tag | grep -Ev '^.*[A-Za-z]{2}.*$' | sort -V | tail -1)
    _pkgver="${_tag#v}"

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
  depends+=(
    'ffmpeg-git'
    'libplacebo-git'
  )

  _pkgsrc="$_gitname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')

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
  local _meson_options=(
    --auto-features auto

    -Dlibmpv=true

    -Dcaca=disabled
    -Dcdda=enabled
    -Ddvbin=enabled
    -Ddvdnav=enabled
    -Dlibarchive=enabled

    -Dbuild-date=false
    -Dvapoursynth=enabled
  )

  arch-meson "$_pkgsrc" build "${_meson_options[@]}"

  meson compile -C build
}

check() {
  meson test -C build || true
}

package() {
  provides+=('libmpv.so')

  meson install -C build --destdir "${pkgdir:?}"

  # delete private entries only required for static linking
  sed -i -e '/Requires.private/d' -e '/Libs.private/d' "${pkgdir:?}/usr/lib/pkgconfig/mpv.pc"

  install -Dm0644 "$_pkgsrc/DOCS"/{encoding.rst,tech-overview.txt} \
    -t "${pkgdir:?}/usr/share/doc/mpv"

  install -Dm0644 "$_pkgsrc/TOOLS/lua"/* \
    -t "${pkgdir:?}/usr/share/mpv/scripts"
}

# execute
_main_package
