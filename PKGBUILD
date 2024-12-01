# Maintainer:
# Contributor: Benjamin Landis <bmlandis2010@gmail.com>

_gitname="mpv"
_pkgname="$_gitname-vapoursynth"
pkgname="$_pkgname-git"
pkgver=0.39.0.r436.g744cd70
pkgrel=1
pkgdesc='a free, open source, and cross-platform media player'
url='https://github.com/mpv-player/mpv'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL-2.0-or-later')

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

  # ffmpeg
  'libavcodec.so'
  'libavdevice.so'
  'libavfilter.so'
  'libavformat.so'
  'libavutil.so'

  # libplacebo
  'libplacebo.so'

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

provides=("mpv=1:${pkgver%%.r*}")
conflicts=('mpv')

options=('!emptydirs')
validpgpkeys=('145077D82501AA20152CACCE8D769208D5E31419') # sfan5 <sfan5@live.de>

_pkgsrc="$_gitname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

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
